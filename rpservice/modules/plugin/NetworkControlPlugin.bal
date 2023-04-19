import ballerina/http;
import ballerina/io;
public class NetworkControlPlugin {
    *Plugin;
    // The `init` method initializes the object.
    public function init() {
      
    }
    public function callPlugin(http:Caller caller, http:Request req) returns boolean|error {
        io:println("NetworkControlPlugin !!!!!!") ;
        return true;
    }

}
