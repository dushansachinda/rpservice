import ballerina/http;
import ballerina/io;
import ballerina/mime;
import ballerina/log;
import rpservice.util;
import ballerina/time;

public class AddAccessTokenPlugin {
    *Plugin;
    // The `init` method initializes the object.
    public function init() {

    }
    json cacheToken = {};
    int accessTokenBufferTime = 900000;

    public function callPlugin(http:Caller caller, http:Request req) returns boolean|error {
        io:println("AddAccessTokenPlugin !!!!!!");
        if (check self.isNonExpired()) {
            // token is not expired
            final http:Client clientEndpoint = check new (util:propertiesMap.get("oauth-service-url"), httpVersion = http:HTTP_1_1);
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
            self.cacheToken = response;
            io:println(response.toString());
            log:printInfo("tokenresponse", res = jwt);
            json|error expiration = response.expires_in;
            log:printInfo("tokenresponse expiration", res = check expiration);
            req.addHeader("smheader", "Bearer " + jwt);
        }else{
            string jwt  =  check self.cacheToken.access_token;
            log:printInfo("cache token##", res = jwt);
            req.addHeader("smheader", "Bearer " + jwt);
            return true;
           
        }

        return true;
    }

    function isNonExpired() returns boolean|error {
        if (self.cacheToken != {}) {
            int expiration = check self.cacheToken.expires_in;
            time:Utc currTime = time:utcNow();
            boolean expired = (currTime[0] / 1000 + self.accessTokenBufferTime < expiration);
            return expired;
        } else {
            return true;
        }
    }

}
