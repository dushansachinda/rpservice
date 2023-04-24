import ballerina/http;

public type RequestPluginContext record {|
    string basePath;
    http:Request httpRequest;
    http:Caller httpCaller;
|};

public type ResponsePluginContext record {|
    string basePath;
    http:Response httpResponse;
    http:Caller httpCaller;
|}; 

public type Plugin distinct isolated object {
    public isolated function processRequest(RequestPluginContext pluginCtx) returns boolean;
    public isolated function processResponse(ResponsePluginContext pluginCtx) returns boolean;
};

