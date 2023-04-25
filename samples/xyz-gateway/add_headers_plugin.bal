import ballerinax/gateway;
import ballerina/log;

public const PLUGIN_ID_ADD_HEADERS = "AddHeadersPlugin";

public isolated class AddHeadersPlugin {
    *gateway:Plugin;
    private final gateway:PluginConfig pluginConfig;

    public function init(gateway:PluginConfig pluginConfig) returns error? {
        self.pluginConfig = pluginConfig;
        // Validate the config
    }

    public isolated function processRequest(gateway:RequestPluginContext pluginCtx) returns boolean {
        log:printDebug("Plugin processRequest invoked", plugin = PLUGIN_ID_ADD_HEADERS);
        return true;
    }

    public isolated function processResponse(gateway:ResponsePluginContext pluginCtx) returns boolean {
        log:printDebug("Plugin processResponse invoked", plugin = PLUGIN_ID_ADD_HEADERS);        
        return true;
    }
}