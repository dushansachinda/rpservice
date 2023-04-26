import ballerina/http;

# Contains the context information required to process the request.
#
# + basePath - basePath of the application to which the request will be forwarded 
# + httpRequest - `http:Request` object received by the gateway service
public type RequestPluginContext record {|
    string basePath;
    http:Request httpRequest;
|};

# Contains the context information required to process the response.
#
# + basePath - basePath of the application to which the request will be forwarded    
# + httpResponse - `http:Response` object received by the gateway service
public type ResponsePluginContext record {|
    string basePath;
    http:Response httpResponse;
|};

# Indicates that the plugin execution should be aborted.
#
# + status - Field Description  
# + httpResponse - `http:Response` object which should be sent back to the client
public type Abort record {
    "Abort" status = "Abort";
    http:Response httpResponse;
};

# Indicates that the plugin execution should be continued.
public type Continue readonly & record {
    "Continue" status = "Continue";
    never httpResponse?;
};

# Base type that inidicates the status of the plugin execution.
public type PluginStatus Continue|Abort;

# The Continue plugin status constant.
public final Continue PLUGIN_STATUS_CONTINUE = {};

# Distinct Plugin object type.
#
# A class can make itself a Plugin by using `*gateway:Plugin;`,
# and then defining following methods.
public type Plugin distinct isolated object {

    # Processes the request and return `Continue` or `Abort` status.
    #
    # + pluginCtx - Contains context information that is required to process the request
    # + return - plugin status indicating whether the plugin execution should be continued or aborted
    public isolated function processRequest(RequestPluginContext pluginCtx) returns PluginStatus;

    # Processes the response and return `Continue` or `Abort` status.
    #
    # + pluginCtx - Contains context information that is required to process the response
    # + return - plugin status indicating whether the plugin execution should be continued or aborted
    public isolated function processResponse(ResponsePluginContext pluginCtx) returns PluginStatus;
};
