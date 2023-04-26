import ballerina/http;

public type PluginInitFunction function (PluginConfig pluginConfig) returns Plugin|error;

public function registerPlugin(string pluginId, PluginInitFunction pluginInitFunction) {
    pluginRegistry[pluginId] = pluginInitFunction;
}

public function 'start(http:Listener httpListener) returns error? {
    // TODO Design error types for the gateway library
    do {
        table<AppContext> key(basePath) appContexts = check createAppContexts(apps, pluginRegistry);
        table<PathSegmentNode> key(path) dispatchTable = check initDispatchTable(appContexts);

        GatewayService gatewayService = new (dispatchTable);
        check httpListener.attach(gatewayService);
        check httpListener.'start();
    } on fail error e {
        return error("Error starting gateway", cause = e);
    }
}
