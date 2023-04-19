import ballerina/http;
import ballerina/io;

public class SMLevelCheckerPlugin  {
    *Plugin;
    // The `init` method initializes the object.
    public function init() {
      
    }
    public function callPlugin(http:Caller caller, http:Request req) returns boolean|error  {
        io:println("SMLevelCheckerPlugin !!!!!!") ;
        return true;
    }

}
