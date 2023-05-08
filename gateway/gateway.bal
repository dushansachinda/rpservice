import ballerina/http;

# A function type for creating `Plugin` instances for each plugin configuration.
public type PluginInitFunction function (PluginConfig pluginConfig) returns Plugin|error;

# Registers a user-provided `Plugin` implementation for a given plugin id.
#
# + pluginId - Plugin Id. This id should match with the plugin id specified in the gateway configuration  
# + pluginInitFunction - a function to create instances of user-provided plugins
public isolated function registerPlugin(string pluginId, PluginInitFunction pluginInitFunction) {
    lock {
        pluginRegistry[pluginId] = pluginInitFunction;
    }
}

# Starts the gateway with the given configurations.
#
# + httpListener - Configurations for the HTTP service listener
# + return - An `error` if an error occurred during the gateway startup
public function 'start(http:Listener httpListener) returns error? {
    // TODO Design error types for the gateway library
    do {
        map<PluginInitFunction> pluginReg;
        lock {
            pluginReg = pluginRegistry.cloneReadOnly();
        }
        table<AppContext> key(basePath) appContexts = check createAppContexts(apps, pluginReg);
        table<PathSegmentNode> key(path) dispatchTable = check initDispatchTable(appContexts);

        GatewayService gatewayService = new (dispatchTable);
        check httpListener.attach(gatewayService);
        check httpListener.'start();
    } on fail error e {
        return error("Error starting gateway", cause = e);
    }
}
