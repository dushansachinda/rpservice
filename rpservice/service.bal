import ballerina/http;
//import rpservice.filters;
import ballerina/log;
import rpservice.interceptor;
import ballerina/jballerina.java;
import rpservice.npx;



// Engage interceptors at the service level. Request interceptor services will be executed from
// head to tail.
@http:ServiceConfig {
    // The interceptor pipeline. The base path of the interceptor services is the same as
    // the target service. Hence, they will be executed only for this particular service.
    //interceptors: [new filters:RequestInterceptor()]
}
service / on new http:Listener(9095) {

    resource function 'default [string... paths](http:Caller caller, http:Request req) returns error? {
        //TODO dynamically invoke the BE based on plugin chain context and return
        //return string `method: ${req.method}, path: ${paths.toString()}`;
        //string path = req.rawPath;
        string urlPostfix = req.rawPath; 

        if (urlPostfix != "" && !hasPrefix(urlPostfix, "/")) {
            urlPostfix = "/" + urlPostfix;
        }

        string? basepath = npx:findclosestBasePath(paths);
        if(npx:getEndpointUrl(<string>basepath) == ()) {
            http:Response response = new ();
                response.setJsonPayload("{error: \"resouce not available\"}");
                response.statusCode = 404;
                http:ListenerError? respond = caller->respond(response);
                if respond is http:ListenerError {

                }
                if respond is error {

                }
            log:printError("No endpoint found for path: ", a = <string>basepath);
            return;
        }

        //request interceptor pre-processing
        boolean pluginres = check interceptor:interceptRequest(paths,caller, req);
        if !pluginres {
            return;
        }
        //TODO validate request chain context and return

        
        var result = callEndpoint(caller, req, <string>npx:getEndpointUrl(<string>basepath), urlPostfix);

        // response interceptor post-processing
        boolean respresult = interceptor:interceptResponse(paths,caller, req);
         if !respresult {
            return;
        }

        if (result is error) {
            log:printError("Error calling endpoint: ", err = result.toString());
        }

        return result;
    }
}

// Define the function that calls an endpoint
function callEndpoint(http:Caller caller, http:Request request, string endpointUrl, string urlPostfix) returns error? {
    http:Client httpClient = check new (endpointUrl);
    log:printInfo("HTTP call: ", a = endpointUrl, b = urlPostfix);
    http:Response|http:ClientError response = httpClient->forward(urlPostfix, request);
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

public function replaceFirst(string str, string regex, string replacement) returns string {
    handle reg = java:fromString(regex);
    handle rep = java:fromString(replacement);
    handle rec = java:fromString(str);
    handle newStr = jReplaceFirst(rec, reg, rep);

    return newStr.toString();
}

public function hasPrefix(string str, string prefix) returns boolean {
    handle pref = java:fromString(prefix);
    handle rec = java:fromString(str);

    return jStartsWith(rec, pref);
}

function jStartsWith(handle receiver, handle prefix) returns boolean = @java:Method {
    name: "startsWith",
    'class: "java.lang.String",
    paramTypes: ["java.lang.String"]
} external;

function jReplaceFirst(handle receiver, handle regex, handle replacement) returns handle = @java:Method {
    name: "replaceFirst",
    'class: "java.lang.String"
} external;

//http:Response res = new;
//res.setPayload(string `method: ${req.method}, path: ${paths.toString()}`);
//return res;