import ballerina/log;
import ballerina/http;
//import rpservice.npx;

// A `Requestinterceptorservice` class implementation. It intercepts the request
// and adds a header before it is dispatched to the target service.
public service class RequestInterceptor {
    *http:RequestInterceptor;

    // A default resource function, which will be executed for all the requests. 
    // A `RequestContext` is used to share data between the interceptors.
    // An accessor and a path can also be specified. In that case, the interceptor will be
    // executed only for the requests, which match the accessor and path.
    resource function 'default [string... path](http:Caller caller,http:Request req,
            http:RequestContext ctx,
            @http:Header {name: "Authoriziation"} string authorization)
        returns http:Unauthorized|http:NextService|error? {
        // Checks the API version header.
        log:printInfo("JAVA Before method call: " + path[0]);
        () _ = callInterceptManager(caller,req);
        log:printInfo("JAVA After method call: " + path[0]);
        return ctx.next();
    }
}
