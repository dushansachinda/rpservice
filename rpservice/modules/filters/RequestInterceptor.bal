import ballerina/log;
import ballerina/http;
import rpservice.npx;

// A `Requestinterceptorservice` class implementation. It intercepts the request
// and adds a header before it is dispatched to the target service.
public service class RequestInterceptor {
    *http:RequestInterceptor;

    // A default resource function, which will be executed for all the requests. 
    // A `RequestContext` is used to share data between the interceptors.
    // An accessor and a path can also be specified. In that case, the interceptor will be
    // executed only for the requests, which match the accessor and path.
    resource function 'default [string... path](
            http:RequestContext ctx,
            @http:Header {name: "Authoriziation"} string authorization)
        returns http:Unauthorized|http:NextService|error? {
        // Checks the API version header.
        log:printInfo("RequestInterceptor invoked!!!!!");
        log:printInfo("request path: " + path.toString());
        log:printInfo("ctx keys: " , test=ctx.keys());
        
        if authorization == "" {
            // Returns a `501 NotImplemented` response if the version is not supported.
            return http:UNAUTHORIZED;
        }

        log:printInfo("BEFORE pluginChain: " + path[0]);
        string pluginChain = npx:pluginChain(path[0]);
        log:printInfo("AFTER pluginChain: " + pluginChain);
        // Returns the next interceptor or the target service in the pipeline. 
        // An error is returned when the call fails.
        return ctx.next();
    }
}
