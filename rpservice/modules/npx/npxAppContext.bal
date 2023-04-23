import rpservice.plugin;
import ballerina/io;
import rpservice.util;
import ballerina/regex;

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

// Define the endpoint URLs as a map (we may need to read this from a config file)
 map<string> endpointUrls = {
    "/admin/sniff.jsp": "https://run.mocky.io/v3/6613f69c-65cf-44d4-b29c-7887f21cfd59",
    "/api/npx-service": "https://run.mocky.io/v3/84643c67-6ddb-4cf1-8141-f637154c9520",
    "/pmg/nxn-metrics": "https://run.mocky.io/v3/b6a301fc-64d8-497d-9138-058d8946bd70",
    "/app/nxn-resource-cache": "https://run.mocky.io/v3/34a9aeba-0b71-4fac-8451-b122c50cce45",
    "/api/nxn-navbar-service": "https://run.mocky.io/v3/8f5cd8a1-85ae-4d73-946b-59dda7ce5992"
};

//configurable map <string> endpoints = ?;


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
    io:println("-------------------------------------");
    // io:println("Config toml test #######", endpoints);
    // io:println("-------------------------------------");
}

public function getPlugin(string basePath) returns RequestConfig? {
    RequestConfig? requestConfig = pluginMap[basePath];
    return requestConfig;
}

public function getPluginModule(string pluginName) returns plugin:Plugin? {
    plugin:Plugin? plugin = pluginModuleMap[pluginName];
    return plugin;
}

public function getEndpointUrl(string basePath) returns string? {
    string? endpointUrl = endpointUrls[basePath];
    return endpointUrl;
}


public function readplugin() returns json|error {
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

public function findclosestBasePath(string[] paths) returns string? {
    string basePath = "/";
    foreach string path in paths {
        basePath = basePath + path + "/";
    }
    string[] storedPaths = endpointUrls.keys();
    string closestPath = "";
    int maxMatchCount = 0;
    foreach string storedPath in storedPaths {
        int currentMatchCount = countMatchingSegments(basePath, storedPath);
        if (currentMatchCount > maxMatchCount && basePath.startsWith(storedPath)) {
            maxMatchCount = currentMatchCount;
            closestPath = storedPath;
        }
    }
    return closestPath;
}

function countMatchingSegments(string basePath, string storedPath) returns int {
    string[] basePathSegments = regex:split(basePath, "/");
    string[] storedPathSegments = regex:split(storedPath, "/");
    int matchCount = 0;

    int minLength = basePathSegments.length() < storedPathSegments.length()
        ? basePathSegments.length()
        : storedPathSegments.length();

    int i = 0;
    foreach string basePathSegment in basePathSegments {
        if (i < minLength && basePathSegment == storedPathSegments[i]) {
            matchCount += 1;
        } else {
            break;
        }
        i += 1;
    }

    return matchCount;
}