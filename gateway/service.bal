import ballerina/log;
import ballerina/http;

type HttpErrorPayload record {
    string message;
    string path;
};

service class GatewayService {
    *http:Service;

    private final table<PathSegmentNode> key(path) dispatchTable;
    // private final map<http:Client> appClients;

    function init(table<PathSegmentNode> key(path) dispatchTable) {
        self.dispatchTable = dispatchTable;
    }

    resource function 'default [string... path](http:Request request) returns http:Response|error {
        // TODO: Contextual logger
        log:printDebug("Request intercepted", path = path);

        AppContext? appContext = self.findAppContext(path);
        if appContext is () {
            log:printError(ERR_MSG_NO_APP_FOUND, path = path);
            HttpErrorPayload errorPayload = {message: ERR_MSG_NO_APP_FOUND, path: request.rawPath};
            return self.createHttpResponse(errorPayload, 400);
        }

        // Execute the plugin chain
        Plugin[] reqPlugins = appContext.requestPlugins;
        RequestPluginContext reqPluginCtx = self.createRequestPluginContext(request, appContext);
        PluginStatus reqPluginStatus = self.runRequestPluginChain(reqPlugins, reqPluginCtx);
        if reqPluginStatus is Abort {
            log:printError("Plugin chain failed", application = appContext.basePath);
            return reqPluginStatus.httpResponse;
        }
        log:printDebug("Plugin chain successfully executed", application = appContext.basePath);

        // TODO Improve the following logic based on the WSO2 MG implementation.
        // Remove the base path from the request path.
        string urlPostfix = self.removeBasePathFromRequestPath(request.rawPath, appContext.basePath);
        log:printDebug("Paths", requestPath = request.rawPath, urlPostfix = urlPostfix);

        http:Client appClient = appContext.httpClient;
        http:Response|http:ClientError response = appClient->forward(urlPostfix, request);

        // TODO Improve the following logic to handle errors properly.
        if (response is http:Response) {
            // Execute the plugin chain
            Plugin[] resPlugins = appContext.responsePlugins;
            ResponsePluginContext resPluginCtx = self.createResponsePluginContext(response, appContext);
            PluginStatus resPluginStatus = self.runResponsePluginChain(resPlugins, resPluginCtx);
            if resPluginStatus is Abort {
                log:printError("Plugin chain failed", application = resPluginCtx.basePath);
                return resPluginStatus.httpResponse;
            } else {
                log:printDebug("Plugin chain successfully executed", application = resPluginCtx.basePath);
                return response;
            }
        } else {
            log:printError("Error calling endpoint: ", err = response.toString());
            return response;
        }
    }

    function removeBasePathFromRequestPath(string requestPath, string basePath) returns string {
        string:RegExp r = re `${basePath}`;
        string urlPostfix = r.replace(requestPath, "", startIndex = 0);
        if urlPostfix != "" && !urlPostfix.startsWith("/") {
            urlPostfix = "/" + urlPostfix;
        }
        return urlPostfix;
    }

    function findAppContext(string[] pathSegments) returns AppContext? {
        if pathSegments.length() == 0 {
            return ();
        }

        PathSegmentNode? curPathNode = ();
        table<PathSegmentNode> key(path) currentDispatchTable = self.dispatchTable;
        foreach var pathSegment in pathSegments {
            if currentDispatchTable.hasKey(pathSegment) {
                PathSegmentNode pathNode = currentDispatchTable.get(pathSegment);
                currentDispatchTable = pathNode.children;
                curPathNode = pathNode;
            } else {
                break;
            }
        }

        return curPathNode is () ? () : curPathNode.app;
    }

    isolated function runRequestPluginChain(Plugin[] plugins, RequestPluginContext pluginCtx) returns PluginStatus {
        log:printDebug("Invoking request plugin chain.", application = pluginCtx.basePath);
        foreach var plugin in plugins {
            PluginStatus status = plugin.processRequest(pluginCtx);
            if status is Abort {
                return status;
            }
        }
        return PLUGIN_STATUS_CONTINUE;
    }

    isolated function runResponsePluginChain(Plugin[] plugins, ResponsePluginContext pluginCtx) returns PluginStatus {
        log:printDebug("Invoking response plugin chain.", application = pluginCtx.basePath);
        foreach var plugin in plugins {
            PluginStatus status = plugin.processResponse(pluginCtx);
            if status is Abort {
                return status;
            }
        }
        return PLUGIN_STATUS_CONTINUE;
    }

    isolated function createRequestPluginContext(http:Request request, AppContext app) returns RequestPluginContext {
        return {
            basePath: app.basePath,
            httpRequest: request
        };
    }

    isolated function createResponsePluginContext(http:Response response, AppContext app) returns ResponsePluginContext {
        return {
            basePath: app.basePath,
            httpResponse: response
        };
    }

    isolated function createHttpResponse(HttpErrorPayload errorPayload, int statusCode) returns http:Response {
        http:Response response = new;
        response.statusCode = statusCode;
        response.setJsonPayload(errorPayload.toJson());
        return response;
    }
};
