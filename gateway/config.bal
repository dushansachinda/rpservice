type ApplicationConfig record {|
    readonly string basePath;
    string endpointUrl;
    table<PluginConfig> key(id) requestPlugins?;
    table<PluginConfig> key(id) responsePlugins?;
|};

# Description
public type PluginConfig readonly & record {|
    readonly string id;
    map<string> config?;
    // JBUG ballerina-lang/issues/40277
    // map<string> config = {};
|};

configurable table<PluginConfig> key(id) requestPlugins = ?; // Global request plugins
configurable table<PluginConfig> key(id) responsePlugins = ?; // Global response plugins
configurable table<ApplicationConfig> key(basePath) apps = ?; // Application  configurations
