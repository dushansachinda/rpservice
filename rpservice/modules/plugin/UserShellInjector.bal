import ballerina/http;
import ballerina/io;

public class UserShellInjector  {
    *Plugin;
    // The `init` method initializes the object.
    public function init() {
      
    }
    public function callReqPlugin(http:Caller caller, http:Request req) returns boolean|error  {
        io:println("UserShellInjector reqest !!!!!!") ;
        return true;
    }

     public function callResPlugin(http:Caller caller, http:Request req) returns boolean|error  {
        io:println("UserShellInjector respnse !!!!!!") ;
        return true;
    }

}