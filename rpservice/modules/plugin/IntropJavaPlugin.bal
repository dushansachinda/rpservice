import ballerina/http;
import ballerina/io;
import ballerina/jballerina.java as java;

public class IntropJavaPlugin {
    *Plugin;
    // The `init` method initializes the object.
    public function init() {

    }
    json cacheToken = {};
    int accessTokenBufferTime = 900000;

    public function callReqPlugin(http:Caller caller, http:Request req) returns boolean|error {
        io:println("IntropJavaPlugin !!!!!!");
        var txt = self.interceptRequest(caller, req);
        io:println(txt);
        return true;
    }

    public function callResPlugin(http:Caller caller, http:Request req) returns boolean|error {
        io:println("IntropJavaPlugin !!!!!!");
        return true;
    }

    isolated function interceptRequest(http:Caller caller, http:Request req) returns boolean = @java:Method {
        name: "interceptRequest",
        'class: "com.test.interceptor.InterceptorManager"
    } external;

}
