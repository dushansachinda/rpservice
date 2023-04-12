import ballerina/io;
import ballerina/jballerina.java as java;

isolated function sayHelloJava() returns handle = @java:Method {
    name: "sayHello",
    'class: "com.test.Hello"
} external;


public function callJavaMethod() {
    io:println("Calling Java method!!!!!!");
    var txt = sayHelloJava();
    io:println(txt);
}