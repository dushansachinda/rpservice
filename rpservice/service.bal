import ballerina/http;
import rpservice.filters;



// Engage interceptors at the service level. Request interceptor services will be executed from
// head to tail.
@http:ServiceConfig {
    // The interceptor pipeline. The base path of the interceptor services is the same as
    // the target service. Hence, they will be executed only for this particular service.
    interceptors: [ new filters:RequestInterceptor()]
}
service / on new http:Listener(9090) {

    resource function 'default [string... paths](http:Request req) returns http:Response  {
        //TODO dynamically invoke the BE based on plugin chain context and return
        //return string `method: ${req.method}, path: ${paths.toString()}`;
        http:Response res = new;
        res.setPayload(string `method: ${req.method}, path: ${paths.toString()}`);
        return res;
    }
}
