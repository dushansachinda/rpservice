public type ApplicationConfig record {|
    readonly string basePath;
    string endpointUrl;
    table<PluginConfig> key(id) requestPlugins?;
    table<PluginConfig> key(id) responsePlugins?;
|};

public type PluginConfig readonly & record {|
    readonly string id;
    map<string> config?;
    // JBUG ballerina-lang/issues/40277
    // map<string> config = {};
|};

public configurable table<PluginConfig> key(id) requestPlugins = ?;
public configurable table<PluginConfig> key(id) responsePlugins = ?;
public configurable map<string> pluginProperties = ?;
public configurable table<ApplicationConfig> key(basePath) apps = ?;
public configurable int port = 9090;
