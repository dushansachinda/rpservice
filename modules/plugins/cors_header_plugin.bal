import ballerina/log;
import gateway.config;

public const PLUGIN_ID_CORS_HEADERS = "CORSHeaderPlugin";

public isolated class CORSHeaderPlugin {
    *Plugin;
    private final config:PluginConfig pluginConfig;

    // Define custom error types here.
    public function init(config:PluginConfig pluginConfig) returns error? {
        self.pluginConfig = pluginConfig;
        // Validate the config
    }
    
    public isolated function processRequest(RequestPluginContext pluginCtx) returns boolean {
        log:printDebug("Plugin processRequest invoked", plugin = PLUGIN_ID_CORS_HEADERS);
        return true;
    }

    public isolated function processResponse(ResponsePluginContext pluginCtx) returns boolean {
        log:printDebug("Plugin processResponse invoked", plugin = PLUGIN_ID_CORS_HEADERS);        
        return true;
    }
}