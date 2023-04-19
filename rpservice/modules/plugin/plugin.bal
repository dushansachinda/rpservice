import ballerina/http;
public type Plugin object {
    public function callPlugin(http:Caller caller, http:Request req) returns boolean|error ;
};