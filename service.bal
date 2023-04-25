import ballerina/log;
import ballerina/http;
import gateway.config;

@http:ServiceConfig {
    interceptors: [new RequestInterceptor(), new ResponseInterceptor()]
}
service / on new http:Listener(config:port) {

    resource function 'default [string... path](http:Request request, http:RequestContext requestCtx) returns http:Response|error {

        // TODO Bring request interceptor logic here.


        // TODO Improve the following logic based on the WSO2 MG implementation.
        Application app = retrieveApplication(requestCtx);
        log:printDebug("Gateway service invoked...", basePath = app.basePath);

        // Remove the base path from the request path.
        string urlPostfix = self.removeBasePathFromRequestPath(request.rawPath, app.basePath);
        log:printDebug("Paths", requestPath = request.rawPath, urlPostfix = urlPostfix);

        http:Client appClient = app.httpClient;
        http:Response|http:ClientError response = appClient->forward(urlPostfix, request);


        // TODO Bring response interceptor logic here.


        // TODO Improve the following logic to handle errors properly.
        if (response is http:Response) {
            return response;
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
}
