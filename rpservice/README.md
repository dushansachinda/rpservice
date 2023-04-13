## Executive Summary:

This report presents a Ballerina implementation for routing logic in a default service using an interceptor design pattern. The provided code demonstrates a service with a RequestInterceptor class that intercepts incoming requests and calls a Java InterceptorManager class to handle routing logic. The interoperability between Ballerina and Java is also showcased which allows the program to call java implementation if implemented by the vendor as part of the plugin executor process. Further evaluation is required to ensure the approach is optimal for the intended use case.

### Service Implementation:

The service.bal file contains the configuration for a service, including the use of interceptors at the service level. In this example, a RequestInterceptor is added to the interceptor pipeline, which will only be executed for this specific service. The service layer implements a dynamic routing logic based on the resource context. This routing logic can be further customized to choose the appropriate backend service based on the plugin executor runtime logic or the request path. To illustrate this, the sample scenario showcases a dynamic routing logic based on the request context and retrieves the back end from map, which can still be moved to configuration.

E.g

```
import ballerina/http;

import rpservice.filters;

import ballerina/log;

import ballerina/jballerina.java;

// Define the endpoint URLs as a map

map\<string\> endpointUrls = {

"finance": "https://run.mocky.io/v3/f919c881-a23e-482b-ae74-dbb0ca61b101",

"partner": "https://run.mocky.io/v3/97defad3-8983-45e1-a4d4-3f8b96470700",

"pet": "http://localhost:9090/"

};

// Engage interceptors at the service level. Request interceptor services will be executed from

// head to tail.

@http:ServiceConfig {

// The interceptor pipeline. The base path of the interceptor services is the same as

// the target service. Hence, they will be executed only for this particular service.

interceptors: [new filters:RequestInterceptor()]

}

service / on new http:Listener(9095) {

resource function 'default [string... paths](http:Caller caller, http:Request req) returns error? {

//TODO dynamically invoke the BE based on plugin chain context and return

string urlPostfix =req.rawPath;

if(urlPostfix != "" && !hasPrefix(urlPostfix, "/")) {

urlPostfix = "/" + urlPostfix;

}

var result = callEndpoint(caller, req, \<string\>endpointUrls[paths[0]],urlPostfix);

if (result is error) {

log:printError("Error calling endpoint: ", err = result.toString());

}

return result;

}

}

function callEndpoint(http:Caller caller, http:Request request, string endpointUrl, string urlPostfix) returns error? {

http:Client httpClient = check new (endpointUrl);

log:printInfo("HTTP call: " ,a=endpointUrl, b=urlPostfix);

http:Response|http:ClientError response = httpClient-\>forward(urlPostfix, request);

if (response is http:Response) {

var result = caller-\>respond(response);

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

### Interceptor Implementation:

The RequestInterceptor.bal file contains the definition for the RequestInterceptor class. The class intercepts the request and calls the InterceptorManager to handle additional logic. After the InterceptorManager has executed its logic, the interceptor continues to the next service in the chain.

public service class RequestInterceptor {

\*http:RequestInterceptor;

resource function 'default [string... path](http:Caller caller,http:Request req,

http:RequestContext ctx,

@http:Header {name: "Authorization"} string authorization)

returns http:Unauthorized|http:NextService|error? {

log:printInfo("JAVA Before method call: " + path[0]);

**() \_ = callInterceptManager(caller,req);**

log:printInfo("JAVA After method call: " + path[0]);

return ctx.next();

}

}
```

### Interoperability:

The interoperability.bal file demonstrates how to call Java methods from Ballerina code. The **callInterceptManager** function invokes the interceptRequest method of the InterceptorManager class in Java. (this is similar to how implemented the InterceptorManager, the libraries can call directly without implementing the entire logic from ballerina which makes the transition faster and allows decoupling from micro gateway dependencies.

```
isolated function interceptRequest(http:Caller caller,http:Request req) returns handle = @java:Method {

name: "interceptRequest",

'class: "com.test.interceptor.InterceptorManager"

} external;

public function callInterceptManager(http:Caller caller,http:Request req) {

io:println("invoke Java interceptor manager !!!!!!");

var txt = interceptRequest(caller,req);

io:println(txt);

}
```

### InterceptorManager in Java:

The InterceptorManager.java file contains the interceptRequest method, which receives the caller and requests objects from Ballerina. The implementation of the plugin chain and routing logic should be placed in this method.

```
public class InterceptorManager {

public static String interceptRequest(ObjectValue caller, ObjectValue request) {

System.out.println("caller " + caller);

System.out.println("Request " + request);

return "Hello . NPX. .";

}

}
```

Execute bal build --native --cloud=docker to generate the artifacts with the native executable. Optionally, you can create a file named Cloud.toml in the package directory to add cloud related configurations. For more information, see [Docker](https://ballerina.io/learn/by-example/c2c-docker-deployment/) and [Kubernetes](https://ballerina.io/learn/by-example/c2c-k8s-deployment/) documentation.

The provided code demonstrates a starting point for implementing routing logic for a default service in Ballerina. The interceptor design pattern is utilized, with a Java InterceptorManager class handling the actual logic. Further discussion and evaluation are needed to ensure this approach is optimal for the specific use case.

Please refer to the code references [1]

Run sample

- Fork the sample [1]
- Install Ballerina [2]
- Option-1
  - Run the services bal run [PROJECT\_HOME]/rpservice/rpservice
  - Build Docker image ref [3]
- Execute commands e.g
  - curl -H "Authoriziation:vxxxxxxx" http://localhost:9095/partner?name=test -v
  - curl -H "Authoriziation:vxxxxxxx" http://localhost:9095/finance?name=test -v

[1] [https://github.com/dushansachinda/rpservice/tree/master/rpservice](https://github.com/dushansachinda/rpservice/tree/master/rpservice)

[2] [https://ballerina.io/learn/get-started-with-ballerina/](https://ballerina.io/learn/get-started-with-ballerina/)

[3] [https://ballerina.io/learn/by-example/c2c-docker-deployment/](https://ballerina.io/learn/by-example/c2c-docker-deployment/)