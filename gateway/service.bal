import ballerina/log;
import ballerina/http;

type HttpErrorPayload record {
    string message;
    string path;
};

service isolated class GatewayService {
    *http:Service;

    private final table<PathSegmentNode> key(path) dispatchTable;

    isolated function init() returns error? {
        readonly & map<PluginInitFunction> pluginReg;
        lock {
            pluginReg = pluginRegistry.cloneReadOnly();
        }
        self.dispatchTable = check createDispatchTable(apps, pluginReg);
    }

    resource isolated function 'default [string... path](http:Request request) returns http:Response|error {
        log:printDebug("Request intercepted", path = path);

        AppContext? appContext = self.findAppContext(path.cloneReadOnly());
        if appContext is () {
            log:printError(ERR_MSG_NO_APP_FOUND, path = path);
            HttpErrorPayload errorPayload = {message: ERR_MSG_NO_APP_FOUND, path: request.rawPath};
            return self.createHttpResponse(errorPayload, 400);
        }

        // Execute the plugin chain
        PluginStatus reqPluginStatus = self.runRequestPluginChain(request, appContext);
        if reqPluginStatus is Abort {
            log:printError("Plugin chain failed", application = appContext.basePath());
            return reqPluginStatus.httpResponse;
        }
        log:printDebug("Plugin chain successfully executed", application = appContext.basePath);

        // TODO Improve the following logic based on the WSO2 MG implementation.
        // Remove the base path from the request path.
        string urlPostfix = self.removeBasePathFromRequestPath(request.rawPath, appContext.basePath());
        log:printDebug("Paths", requestPath = request.rawPath, urlPostfix = urlPostfix);

        http:Client endpoint = appContext.httpClient();
        http:Response|http:ClientError response = endpoint->forward(urlPostfix, request);

        // TODO Improve the following logic to handle errors properly.
        if (response is http:Response) {
            // Execute the plugin chain
            PluginStatus resPluginStatus = self.runResponsePluginChain(response, appContext);
            if resPluginStatus is Abort {
                log:printError("Plugin chain failed", application = appContext.basePath());
                return resPluginStatus.httpResponse;
            } else {
                log:printDebug("Plugin chain successfully executed", application = appContext.basePath());
                return response;
            }
        } else {
            log:printError("Error calling endpoint: ", err = response.toString());
            return response;
        }
    }

    isolated function removeBasePathFromRequestPath(string requestPath, string basePath) returns string {
        string:RegExp r = re `${basePath}`;
        string urlPostfix = r.replace(requestPath, "", startIndex = 0);
        if urlPostfix != "" && !urlPostfix.startsWith("/") {
            urlPostfix = "/" + urlPostfix;
        }
        return urlPostfix;
    }

    isolated function findAppContext(readonly & string[] pathSegments) returns AppContext? {
        if pathSegments.length() == 0 {
            return ();
        }

        lock {
            PathSegmentNode? curPathNode = ();
            table<PathSegmentNode> key(path) currentDispatchTable;
            currentDispatchTable = self.dispatchTable;
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
    }

    isolated function runRequestPluginChain(http:Request request, AppContext appContext) returns PluginStatus {
        log:printDebug("Invoking request plugin chain.", application = appContext.basePath());

        RequestPluginContext pluginCtx = self.createRequestPluginContext(request, appContext);
        int pluginCount = appContext.requestPluginCount();
        foreach var index in 0 ..< pluginCount {
            Plugin plugin = appContext.requestPlugin(index);
            PluginStatus status = plugin.processRequest(pluginCtx);
            if status is Abort {
                return status;
            }
        }
        return PLUGIN_STATUS_CONTINUE;
    }

    isolated function runResponsePluginChain(http:Response response, AppContext appContext) returns PluginStatus {
        log:printDebug("Invoking response plugin chain.", application = appContext.basePath());

        ResponsePluginContext pluginCtx = self.createResponsePluginContext(response, appContext);
        int pluginCount = appContext.responsePluginCount();
        foreach var index in 0 ..< pluginCount {
            Plugin plugin = appContext.responsePlugin(index);
            PluginStatus status = plugin.processResponse(pluginCtx);
            if status is Abort {
                return status;
            }
        }
        return PLUGIN_STATUS_CONTINUE;
    }

    isolated function createRequestPluginContext(http:Request request, AppContext appContext) returns RequestPluginContext {
        return {
            basePath: appContext.basePath(),
            httpRequest: request
        };
    }

    isolated function createResponsePluginContext(http:Response response, AppContext appContext) returns ResponsePluginContext {
        return {
            basePath: appContext.basePath(),
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
