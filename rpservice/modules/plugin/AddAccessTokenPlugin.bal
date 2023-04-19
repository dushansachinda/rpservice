import ballerina/http;
import ballerina/io;

public class AddAccessTokenPlugin {
    *Plugin;
    // The `init` method initializes the object.
    public function init() {
      
    }
    public function callPlugin(http:Caller caller, http:Request req) returns boolean {
        io:println("AddAccessTokenPlugin !!!!!!") ;
        return true;
    }

}