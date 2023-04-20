import ballerina/http;
import rpservice.util;
import ballerina/io;
import ballerina/regex;

public class NetworkControlPlugin {
    *Plugin;
    // The `init` method initializes the object.
    string regex = "([0-9]|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.([0-9]|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3}";
    public function init() {

    }
    public function callPlugin(http:Caller caller, http:Request req) returns boolean|error {
        io:println("NetworkControlPlugin #### !!!!!!");
        io:println("check ip list !!!!!!", util:propertiesMap.get("proxy-ips"));
        string[] xforwardlist = check self.getIPList(check req.getHeader("x-forwarded-for"));
        io:println("x-forwarded-for list", xforwardlist);
        if (xforwardlist.length() == 0) {
            return false;
        } else {
            boolean isProxy = check self.isProxy(xforwardlist[0]);
            io:println("is proxy  ", isProxy);
            if (isProxy) {
                return true;
            } else {
                //handle error
                http:Response response = new ();
                response.setJsonPayload("{error: \"invalid proxy ip\"}");
                response.statusCode = 500;
                http:ListenerError? respond = caller->respond(response);
                if respond is http:ListenerError {

                }
                if respond is error {

                }
                return false;

            }
        }
    }

    public function getIPList(string xForwardedFor) returns (string[]|error) {
        io:println("xForwardedFor #1 ", xForwardedFor);
        if (xForwardedFor == "") {
            error err = error("invalid header");
            return err;
        }
        string[] ipList = regex:split(xForwardedFor, ",");
        io:println("ipList #2 ", ipList);
        foreach string ip in ipList {
            var validate = self.validateIP(ip);
            if (validate is error) {
                return validate;
            }
        }
        io:println("ipList #3 ", ipList);
        return ipList;
    }

    function validateIP(string ip) returns (error|boolean) {
        // Add IP validation logic here
        return true;
    }

    function isProxy(string xfip) returns (error|boolean) {
        string ips = util:propertiesMap.get("proxy-ips");
        string[] ipArr = regex:split(ips, ",");
        io:println("isProxy ###", xfip, " : ip address ####", ipArr);
        foreach var proxyip in ipArr {
            if (xfip == proxyip) {
                return true;
            }
        }
        return false;
    }

}
