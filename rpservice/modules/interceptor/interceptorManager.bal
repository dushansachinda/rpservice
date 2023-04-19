import ballerina/io;
import rpservice.plugin;
import ballerina/http;


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
map<plugin:Plugin> pluginModuleMap = {};

function init() returns error? {
    json[] resultAr = check readplugin().ensureType();
    foreach var resconfig in resultAr {
        RequestConfig requestConfigs = check resconfig.cloneWithType(RequestConfig);
        io:println("requestConfigs init #", requestConfigs);
        if(requestConfigs.basePath != ()){
            pluginMap[<string>requestConfigs.basePath] = requestConfigs;
        }    
    }
    loadPlugin();
}

public function interceptRequest(http:Caller caller, http:Request req) returns boolean {
    string basePath = req.rawPath;
    RequestConfig requestConfig  =check pluginMap.get(basePath);
    foreach RequestPlugin requestPlugin in requestConfig.requestPlugin {
         io:println("invoke interceptor request manager !!!!!!",requestPlugin.id) ;
         plugin:Plugin? plugin =  pluginModuleMap[requestPlugin.id];
         if(plugin != ()){
            boolean pluginresponse = plugin.callPlugin(caller,req);
         }
    }
    return true;
}

public function interceptResponse(http:Caller caller, http:Request req) returns boolean {
    io:println("invoke  interceptor response manager !!!!!!");
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
    plugin:AddStandardNDPHeadersPlugin  addStandardNDPHeadersPlugin= new;
    plugin:SMLevelCheckerPlugin  smLevelCheckerPlugin= new;

    pluginModuleMap["AddAccessTokenPlugin"] = addAccessTokenPlugin;
    pluginModuleMap["AddStandardNDPHeadersPlugin"] = addStandardNDPHeadersPlugin;
    pluginModuleMap["SMLevelCheckerPlugin"] = smLevelCheckerPlugin;
}

