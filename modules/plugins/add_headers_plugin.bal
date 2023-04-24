import gateway.config;
import ballerina/log;

public const PLUGIN_ID_ADD_HEADERS = "AddHeadersPlugin";

public isolated class AddHeadersPlugin {
    *Plugin;
    private final config:PluginConfig pluginConfig;

    public function init(config:PluginConfig pluginConfig) returns error? {
        self.pluginConfig = pluginConfig;
        // Validate the config
    }

    public isolated function processRequest(RequestPluginContext pluginCtx) returns boolean {
        log:printDebug("Plugin processRequest invoked", plugin = PLUGIN_ID_ADD_HEADERS);
        return true;
    }

    public isolated function processResponse(ResponsePluginContext pluginCtx) returns boolean {
        log:printDebug("Plugin processResponse invoked", plugin = PLUGIN_ID_ADD_HEADERS);        
        return true;
    }
}