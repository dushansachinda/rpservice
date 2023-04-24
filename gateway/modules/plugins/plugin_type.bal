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

// public type FailureResult readonly & record {|
//     int httpStatusCode;
//     string message;
//     map<string> context = {};
//     error cause?;
// |};

// public type SuccessResult readonly & record {|
//     "SuccessResult" successResult = "SuccessResult";
// |};

// public type ExecutionResult SuccessResult | FailureResult;

// public final SuccessResult SUCCESS_RESULT = {};  

# Description
public type Plugin distinct isolated object {
    public isolated function processRequest(RequestPluginContext pluginCtx) returns boolean;
    public isolated function processResponse(ResponsePluginContext pluginCtx) returns boolean;
};

