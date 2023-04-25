import gateway.config;
import ballerina/log;

public const PLUGIN_ID_NETWORK_CONTROL = "NetworkControlPlugin";

public isolated class NetworkControlPlugin {
    *Plugin;
    private final config:PluginConfig pluginConfig;

    // Define custom error types here.
    public function init(config:PluginConfig pluginConfig) returns error? {
        self.pluginConfig = pluginConfig;
        // Validate the config
    }

    public isolated function processRequest(RequestPluginContext pluginCtx) returns boolean {
        log:printDebug("Plugin processRequest invoked", plugin = PLUGIN_ID_NETWORK_CONTROL);
        return true;
    }

    public isolated function processResponse(ResponsePluginContext pluginCtx) returns boolean {
        log:printDebug("Plugin processResponse invoked", plugin = PLUGIN_ID_NETWORK_CONTROL);        
        return true;
    }
}