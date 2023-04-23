import rpservice.plugin;
import ballerina/io;
import rpservice.util;

public type RequestConfig record {
    string id;
    string basePath?;
    RequestPlugin[] requestPlugin;
    ResponsePlugin[] responsePlugin;
};

public type RequestPlugin record {
    string id;
    Config config?;
};

public type ResponsePlugin record {
    string id;
    Config config?;
};

public type Config record {
    string appId?;
    string src?;
    string height?;
    string width?;
};

public type ResourceConfig record {
    string id;
    string basePath?;
    RequestPlugin[] requestPlugin;
    ResponsePlugin[] responsePlugin;
};

map<RequestConfig> pluginMap = {};
map<ResponsePlugin> resPluginMap = {};
map<plugin:Plugin> pluginModuleMap = {};

public function getPlugin(string basePath) returns RequestConfig? {
    RequestConfig? requestConfig = pluginMap[basePath];
    return requestConfig;
}

public function getPluginModule(string pluginName) returns plugin:Plugin? {
    plugin:Plugin? plugin = pluginModuleMap[pluginName];
    return plugin;
}


public function readplugin() returns json|error {
    string fileContent = check io:fileReadString("resources/api-config.json");
    json pluginChainJson = check fileContent.fromJsonString();
    io:print("reading file ->", pluginChainJson);
    return pluginChainJson;
}

function init() returns error? {
    util:readProperties();
    json[] resultAr = check readplugin().ensureType();
    buildRequestPlugin(resultAr);
    loadPlugin();
    io:println("property map init #", util:propertiesMap);
    io:println("-------------------------------------");
    io:println("pluginMap init #", pluginMap);
}

public function loadPlugin() {
    plugin:AddAccessTokenPlugin addAccessTokenPlugin = new;
    plugin:AddStandardNDPHeadersPlugin addStandardNDPHeadersPlugin = new;
    plugin:SMLevelCheckerPlugin smLevelCheckerPlugin = new;
    plugin:NetworkControlPlugin networkControlPlugin = new;
    plugin:UserShellInjector userShellInjector = new;
    plugin:IntropJavaPlugin intropJavaPlugin = new;

    pluginModuleMap["AddAccessTokenPlugin"] = addAccessTokenPlugin;
    pluginModuleMap["AddStandardNDPHeadersPlugin"] = addStandardNDPHeadersPlugin;
    pluginModuleMap["SMLevelCheckerPlugin"] = smLevelCheckerPlugin;
    pluginModuleMap["NetworkControlPlugin"] = networkControlPlugin;
    pluginModuleMap["userShellInjector"] = userShellInjector;
    pluginModuleMap["IntropJavaPlugin"] = intropJavaPlugin;
}

public function buildRequestPlugin(json[] resultAr) {
    RequestPlugin[] defaulReqConfigs = [];
    ResponsePlugin[] defaulResConfigs = [];
    foreach var resconfig in resultAr {
        RequestConfig requestConfigs = check resconfig.cloneWithType(RequestConfig);
        if (requestConfigs.basePath != ()) {
            pluginMap[<string>requestConfigs.basePath] = requestConfigs;
        } else {
            defaulReqConfigs.push(...requestConfigs.requestPlugin);
            defaulResConfigs.push(...requestConfigs.responsePlugin);
        }
    } on fail var e {
        io:println("error in buildRequestPlugin", e);
    }
    //add default configs to all
    foreach var key in pluginMap.keys() {
        RequestConfig requestConfig = pluginMap.get(key);
        requestConfig.requestPlugin.push(...defaulReqConfigs);
        requestConfig.responsePlugin.push(...defaulResConfigs);
        pluginMap[key] = requestConfig;
    }
}
