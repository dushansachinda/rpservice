import ballerina/http;
import rpservice.util;
import ballerina/io;
public class NetworkControlPlugin {
    *Plugin;
    // The `init` method initializes the object.
    public function init() {
      
    }
    public function callPlugin(http:Caller caller, http:Request req) returns boolean|error {
        io:println("NetworkControlPlugin !!!!!!") ;
        io:println("check ip list !!!!!!",util:propertiesMap.get("proxy-ips")) ;
        return true;
    }

}
