import ballerina/io;
import ballerina/jballerina.java as java;
import ballerina/http;

isolated function interceptRequest(http:Caller caller,http:Request req) returns handle = @java:Method {
    name: "interceptRequest",
    'class: "com.test.interceptor.InterceptorManager"
} external;


public function callInterceptManager(http:Caller caller,http:Request req) {
    io:println("invoke Java interceptor manager !!!!!!");
    var txt = interceptRequest(caller,req);
    io:println(txt);
}