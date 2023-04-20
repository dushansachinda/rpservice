import ballerina/http;
import ballerina/io;
import ballerina/mime;
import ballerina/log;
import rpservice.util;

public class AddAccessTokenPlugin {
    *Plugin;
    // The `init` method initializes the object.
    public function init() {

    }
    public function callPlugin(http:Caller caller, http:Request req) returns boolean|error {
        io:println("AddAccessTokenPlugin !!!!!!");
        final http:Client clientEndpoint = check new ("https://api.asgardeo.io/t/hahack23", httpVersion = http:HTTP_1_1);
    
        string client_id = util:propertiesMap.get("client-id");
        string client_secret = util:propertiesMap.get("client-secret");

        string encoded = client_id + ":" + client_secret;
        byte[] inputArr = encoded.toBytes();
        string encodedString = inputArr.toBase64();

        json response = check clientEndpoint->post("/oauth2/token",
        {
            "grant_type": "client_credentials"
        },
        {
            "Authorization": "Basic " + encodedString
        },
        mime:APPLICATION_FORM_URLENCODED
    
    );
        string jwt = check response.access_token;
        io:println(response.toString());
        log:printInfo("tokenresponse", res = jwt);
        req.addHeader("smheader", "Bearer " + jwt);
        return true;
    }

}
