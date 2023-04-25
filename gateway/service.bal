import ballerina/log;
import ballerina/http;

// @http:ServiceConfig {
//     interceptors: [new RequestInterceptor(), new ResponseInterceptor()]
// }
// service / on new http:Listener(port) {

http:Service gatewayService  = service object {

// service class GatewayService {
//     *http:Service;

    resource function 'default [string... path](http:Request request, http:Caller caller) returns error? {
        // TODO Bring request interceptor logic here.
        log:printInfo("Request intercepted", path = path);

        // TODO: Contextual logger
        Application? app = findApp(path);
        if app is () {
            log:printError("No matching application found", path = path);
            http:Response response = new ();
            response.setJsonPayload({'error: "No matching application found", path: request.rawPath});
            response.statusCode = 404;
            // return response;
            check caller->respond(response);
            return;
        }

        // Execute the plugin chain
        Plugin[] reqPlugins = app.requestPlugins;
        RequestPluginContext reqPluginCtx = createRequestPluginContext(request, caller, app);
        if !runRequestPluginChain(reqPlugins, reqPluginCtx) {
            // Assumption is that plugin has already responded using http:Caller. If the response has not been written, returning () will return an HTTP 500 error to the client.
            log:printError("Plugin chain failed", application = reqPluginCtx.basePath);
            // TODO Figure out a better way to handle this.
            return error("Response plugin chain failed");
        }

        log:printDebug("Plugin chain successfully executed", application = reqPluginCtx.basePath);

        // TODO Improve the following logic based on the WSO2 MG implementation.
        log:printDebug("Gateway service invoked...", basePath = app.basePath);

        // Remove the base path from the request path.
        string urlPostfix = self.removeBasePathFromRequestPath(request.rawPath, app.basePath);
        log:printDebug("Paths", requestPath = request.rawPath, urlPostfix = urlPostfix);

        http:Client appClient = app.httpClient;
        http:Response|http:ClientError response = appClient->forward(urlPostfix, request);

        // TODO Bring response interceptor logic here.

        // TODO Improve the following logic to handle errors properly.
        if (response is http:Response) {
            // Execute the plugin chain
            Plugin[] resPlugins = app.responsePlugins;
            ResponsePluginContext resPluginCtx = createResponsePluginContext(response, caller, app);
            if runResponsePluginChain(resPlugins, resPluginCtx) {
                log:printDebug("Plugin chain successfully executed", application = resPluginCtx.basePath);
                // return response;
                check caller->respond(response);
                return;
            } else {
                log:printError("Plugin chain failed", application = resPluginCtx.basePath);
                return error("Response plugin chain failed");
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
};
