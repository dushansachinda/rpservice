import ballerina/http;
import ballerina/log;

// service class RequestInterceptor {
//     *http:RequestInterceptor;

//     resource function 'default [string... path](http:Request request, http:Caller caller, http:RequestContext requestCtx) returns http:Response|http:NextService|error? {
//         log:printInfo("Request intercepted", path = path);

//         // TODO: Contextual logger
//         Application? app = findApp(path);
//         if app is () {
//             log:printError("No matching application found", path = path);
//             http:Response response = new ();
//             response.setJsonPayload({'error: "No matching application found", path: request.rawPath});
//             response.statusCode = 404;
//             return response;
//         }
//         requestCtx.set(KEY_BASEPATH, app.basePath);

//         // Execute the plugin chain
//         Plugin[] plugins = app.requestPlugins;
//         RequestPluginContext pluginCtx = createRequestPluginContext(request, caller, app);
//         if runRequestPluginChain(plugins, pluginCtx) {
//             log:printDebug("Plugin chain successfully executed", application = pluginCtx.basePath);
//             return requestCtx.next();
//         } else {
//             // Assumption is that plugin has already responded using http:Caller. If the response has not been written, returning () will return an HTTP 500 error to the client.
//             log:printError("Plugin chain failed", application = pluginCtx.basePath);
//             return (); 
//         }
//     }
// }

// service class ResponseInterceptor {
//     *http:ResponseInterceptor;

//     remote function interceptResponse(http:Response response, http:Caller caller, http:RequestContext requestCtx) returns http:NextService|error? {
//         Application app = retrieveApplication(requestCtx);

//         // Execute the plugin chain
//         Plugin[] plugins = app.responsePlugins;
//         ResponsePluginContext pluginCtx = createResponsePluginContext(response, caller, app);
//         if runResponsePluginChain(plugins, pluginCtx) {
//             log:printDebug("Plugin chain successfully executed", application = pluginCtx.basePath);
//             return requestCtx.next();
//         } else {
//             log:printError("Plugin chain failed", application = pluginCtx.basePath);
//             return ();
//         }
//     }
// }

// Use disptchTable to find the matching application
function findApp(string[] pathSegments) returns Application? {
    if pathSegments.length() == 0 {
        return ();
    }

    PathSegmentNode? curPathNode = ();
    table<PathSegmentNode> key(path) currentDispatchTable = dispatchTable;
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

isolated function runRequestPluginChain(Plugin[] plugins, RequestPluginContext pluginCtx) returns boolean {
    log:printDebug("Invoking request plugin chain.", application = pluginCtx.basePath);
    foreach var plugin in plugins {
        if !plugin.processRequest(pluginCtx) {
            return false;
        }
    }
    return true;
}

isolated function runResponsePluginChain(Plugin[] plugins, ResponsePluginContext pluginCtx) returns boolean {
    log:printDebug("Invoking response plugin chain.", application = pluginCtx.basePath);
    foreach var plugin in plugins {
        if !plugin.processResponse(pluginCtx) {
            return false;
        }
    }
    return true;
}

isolated function createRequestPluginContext(http:Request request, http:Caller caller, Application app) returns RequestPluginContext {
    return {
        basePath: app.basePath,
        httpCaller: caller,
        httpRequest: request
    };
}

isolated function createResponsePluginContext(http:Response response, http:Caller caller, Application app) returns ResponsePluginContext {
    return {
        basePath: app.basePath,
        httpCaller: caller,
        httpResponse: response
    };
}

