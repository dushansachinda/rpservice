import ballerina/http;

public type RequestPluginContext record {|
    string basePath;
    http:Request httpRequest;
|};

public type ResponsePluginContext record {|
    string basePath;
    http:Response httpResponse;
|};

public type Abort record {
    "Abort" status = "Abort";
    http:Response httpResponse;
};

public type Continue readonly & record {
    "Continue" status = "Continue";
    never httpResponse?;
};

public type PluginStatus Continue|Abort;

public final Continue PLUGIN_STATUS_CONTINUE = {};

public type Plugin distinct isolated object {
    public isolated function processRequest(RequestPluginContext pluginCtx) returns PluginStatus;
    public isolated function processResponse(ResponsePluginContext pluginCtx) returns PluginStatus;
};

