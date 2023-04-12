import ballerina/http;
import rpservice.filters;
import ballerina/log;

// Define the endpoint URLs as a map
map<string> endpointUrls = {
    "finance": "https://run.mocky.io/v3/f919c881-a23e-482b-ae74-dbb0ca61b101",
    "partner": "https://run.mocky.io/v3/97defad3-8983-45e1-a4d4-3f8b96470700"
};

// Engage interceptors at the service level. Request interceptor services will be executed from
// head to tail.
@http:ServiceConfig {
    // The interceptor pipeline. The base path of the interceptor services is the same as
    // the target service. Hence, they will be executed only for this particular service.
    interceptors: [new filters:RequestInterceptor()]
}
service / on new http:Listener(9090) {

    resource function 'default [string... paths](http:Caller caller, http:Request req) returns error?  {
        //TODO dynamically invoke the BE based on plugin chain context and return
        //return string `method: ${req.method}, path: ${paths.toString()}`;
        //string path = req.rawPath;
        log:printInfo("path: " + paths[0]);
        var result = callEndpoint(caller, req, <string>endpointUrls[paths[0]]);
        if (result is error) {
            log:printError("Error calling endpoint: ", err = result.toString());
        }

        return result;
    }
}

// Define the function that calls an endpoint
function callEndpoint(http:Caller caller, http:Request request, string endpointUrl) returns error? {
    http:Client httpClient = check new (endpointUrl);
    http:Response|http:ClientError response = httpClient->forward("/", request);
    if (response is http:Response) {
        var result = caller->respond(response);
        if (result is error) {
            log:printError("Error sending response: ", err = result.toString());
        }
        return result;
    } else {
        //log:printError("Error calling endpoint: ", err );
    }
}


        //http:Response res = new;
        //res.setPayload(string `method: ${req.method}, path: ${paths.toString()}`);
        //return res;