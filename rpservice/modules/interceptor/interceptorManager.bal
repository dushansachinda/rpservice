import ballerina/io;
import rpservice.plugin;
import ballerina/http;
import rpservice.util;
import ballerina/regex;

type RequestConfig record {
    string id;
    string basePath?;
    RequestPlugin[] requestPlugin;
    ResponsePlugin[] responsePlugin;
};

type RequestPlugin record {
    string id;
    Config config?;
};

type ResponsePlugin record {
    string id;
    Config config?;
};

type Config record {
    string appId?;
    string src?;
    string height?;
    string width?;
};

type ResourceConfig record {
    string id;
    string basePath?;
    RequestPlugin[] requestPlugin;
    ResponsePlugin[] responsePlugin;
};

map<RequestConfig> pluginMap = {};
map<ResponsePlugin> resPluginMap = {};
map<plugin:Plugin> pluginModuleMap = {};

function init() returns error? {
    util:readProperties();
    json[] resultAr = check readplugin().ensureType();
    buildRequestPlugin(resultAr);
    loadPlugin();
    io:println("property map init #", util:propertiesMap);
    io:println("-------------------------------------");
    io:println("pluginMap init #", pluginMap);
}

function buildRequestPlugin(json[] resultAr) {
    RequestPlugin[] defaulReqConfigs = [];
    foreach var resconfig in resultAr {
        RequestConfig requestConfigs = check resconfig.cloneWithType(RequestConfig);
        if (requestConfigs.basePath != ()) {
            pluginMap[<string>requestConfigs.basePath] = requestConfigs;
        } else {
            defaulReqConfigs.push(...requestConfigs.requestPlugin);
        }
    } on fail var e {
        io:println("error in buildRequestPlugin", e);
    }
    //add default configs to all
    foreach var key in pluginMap.keys() {
        RequestConfig requestConfig = pluginMap.get(key);
        requestConfig.requestPlugin.push(...defaulReqConfigs);
        pluginMap[key] = requestConfig;
    }
}


public function interceptRequest(http:Caller caller, http:Request req) returns boolean|error {
    string basePath = req.rawPath; //TODO deterime correct way to extract base path
    RequestConfig requestConfig = pluginMap.get(basePath);
    foreach RequestPlugin requestPlugin in requestConfig.requestPlugin {
        io:println("invoke interceptor request manager !!!!!!", requestPlugin.id);
        plugin:Plugin? plugin = pluginModuleMap[requestPlugin.id];
        if (plugin != ()) {
            io:println("call plugin ->", plugin);
            boolean|error pluginresponse = plugin.callReqPlugin(caller, req);
            if (pluginresponse is error) {
                return false;
            }
            if (pluginresponse is boolean) {
                if (pluginresponse == false) {
                    io:println("hit error plugin ->", plugin);
                    return false;
                }
            }
        }
    }
    return true;
}

public function interceptResponse(http:Caller caller, http:Request req) returns boolean {
    io:println("invoke  interceptor responsePlugin manager !!!!!!");
    string basePath = req.rawPath; //TODO deterime correct way to extract base path
    RequestConfig requestConfig = pluginMap.get(basePath);
    foreach ResponsePlugin responsePlugin in requestConfig.responsePlugin {
        io:println("invoke interceptor responsePlugin manager !!!!!!", responsePlugin.id);
        plugin:Plugin? plugin = pluginModuleMap[responsePlugin.id];
        if (plugin != ()) {
            io:println("call plugin  responsePlugin->", plugin);
            boolean|error pluginresponse = plugin.callResPlugin(caller, req);
            if (pluginresponse is error) {
                return false;
            }
            if (pluginresponse is boolean) {
                if (pluginresponse == false) {
                    io:println("hit error plugin ->", plugin);
                    return false;
                }
            }
        }
    }
    return true;
}

function readplugin() returns json|error {
    string fileContent = check io:fileReadString("resources/api-config.json");
    json pluginChainJson = check fileContent.fromJsonString();
    io:print("reading file ->", pluginChainJson);
    return pluginChainJson;
}

public function loadPlugin() {
    plugin:AddAccessTokenPlugin addAccessTokenPlugin = new;
    plugin:AddStandardNDPHeadersPlugin addStandardNDPHeadersPlugin = new;
    plugin:SMLevelCheckerPlugin smLevelCheckerPlugin = new;
    plugin:NetworkControlPlugin networkControlPlugin = new;
    plugin:UserShellInjector userShellInjector = new;

    pluginModuleMap["AddAccessTokenPlugin"] = addAccessTokenPlugin;
    pluginModuleMap["AddStandardNDPHeadersPlugin"] = addStandardNDPHeadersPlugin;
    pluginModuleMap["SMLevelCheckerPlugin"] = smLevelCheckerPlugin;
    pluginModuleMap["NetworkControlPlugin"] = networkControlPlugin;
    pluginModuleMap["userShellInjector"] = userShellInjector;
}

public map<string> propertiesMap = {};

public function readProperties() {
    map<string> propertiesMap = {};
    do {
        stream<string, io:Error?> lineStream = check io:fileReadLinesAsStream("resources/interceptor-config.properties");
        string[] propertyLines = check from string line in lineStream
            select line;
        foreach string line in propertyLines {
            if line.length() > 0 && !line.startsWith("#") {
                string[] keyValue = regex:split(line, "="); //line.split("=");
                //io:println("Key: ", keyValue[0], " Value: ", keyValue[1]);
                propertiesMap[keyValue[0]] = keyValue[1];
            }
        }
    } on fail var e {
        io:print("Error while reading properties file: ", e);
    }

}

