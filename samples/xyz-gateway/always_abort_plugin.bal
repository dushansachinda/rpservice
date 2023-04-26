import ballerinax/gateway;
import ballerina/log;
import ballerina/http;

const PLUGIN_ID_ALWAYS_ABORT_PLUGIN = "AlwaysAbortPlugin";

public isolated class AlwaysAbortPlugin {
    *gateway:Plugin;
    private final gateway:PluginConfig pluginConfig;

    // Define custom error types here.
    public function init(gateway:PluginConfig pluginConfig) returns error? {
        self.pluginConfig = pluginConfig;
        // Validate the config
    }

    public isolated function processRequest(gateway:RequestPluginContext pluginCtx) returns gateway:PluginStatus {
        log:printDebug("Plugin processRequest invoked", plugin = PLUGIN_ID_ALWAYS_ABORT_PLUGIN);
        http:Response response = new;
        response.statusCode = 401;
        response.setPayload("Unauthorized");
        return <gateway:Abort>{httpResponse: response};
    }

    public isolated function processResponse(gateway:ResponsePluginContext pluginCtx) returns gateway:PluginStatus {
        log:printDebug("Plugin processResponse invoked", plugin = PLUGIN_ID_ALWAYS_ABORT_PLUGIN);
        http:Response response = new;
        response.statusCode = 401;
        response.setPayload("Unauthorized");
        return <gateway:Abort>{httpResponse: response};
    }
}
