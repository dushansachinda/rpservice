import ballerina/http;
import ballerina/io;

public class UserShellInjector  {
    *Plugin;
    // The `init` method initializes the object.
    public function init() {
      
    }
    public function callPlugin(http:Caller caller, http:Request req) returns boolean|error  {
        io:println("UserShellInjector !!!!!!") ;
        return true;
    }

}