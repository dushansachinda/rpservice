import ballerina/http;
public type Plugin object {
    public function callReqPlugin(http:Caller caller, http:Request req) returns boolean|error ;
    public function callResPlugin(http:Caller caller, http:Request req) returns boolean|error ;
};