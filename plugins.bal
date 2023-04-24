import gateway.config;
import gateway.plugins;

type PluginInitFunc function (config:PluginConfig pluginConfig) returns plugins:Plugin|error;

final readonly & map<PluginInitFunc> pluginMap = {
    [plugins:PLUGIN_ID_ADD_ACCESS_TOKEN]: pluginConfig => new plugins:AddAccessTokenPlugin(pluginConfig),
    [plugins:PLUGIN_ID_ADD_HEADERS]: pluginConfig => new plugins:AddHeadersPlugin(pluginConfig),
    [plugins:PLUGIN_ID_REMOVE_HEADERS]: pluginConfig => new plugins:RemoveHeadersPlugin(pluginConfig),
    [plugins:PLUGIN_ID_CORS_HEADERS]: pluginConfig => new plugins:CORSHeaderPlugin(pluginConfig),
    [plugins:PLUGIN_ID_NETWORK_CONTROL]: pluginConfig => new plugins:NetworkControlPlugin(pluginConfig)
};

isolated function initPlugin(config:PluginConfig pluginConfig, string basePath) returns plugins:Plugin|error {
    if !pluginMap.hasKey(pluginConfig.id) {
        return error("Plugin not found", id = pluginConfig.id, app_base_path = basePath);
    }

    PluginInitFunc pluginInitFunc = pluginMap.get(pluginConfig.id);
    plugins:Plugin|error plugin = pluginInitFunc(pluginConfig);
    if plugin is error {
        return error("Error initializing plugin", id = pluginConfig.id, app_base_path = basePath, cause = plugin);
    }

    return plugin;
}