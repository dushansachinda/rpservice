import ballerina/io;
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

function init() returns error? {
    json[] resultAr = check readplugin().ensureType();
    foreach var resconfig in resultAr {
        RequestConfig requestConfigs = check resconfig.cloneWithType(RequestConfig);
        io:println("requestConfigs init #", requestConfigs);
        if(requestConfigs.basePath != ()){
            pluginMap[<string>requestConfigs.basePath] = requestConfigs;
        }    
    }
}

public function interceptRequest(http:Caller caller, http:Request req) returns boolean {
    string basePath = req.rawPath;
    RequestConfig requestConfig  =check pluginMap.get(basePath);
    io:println("invoke interceptor request manager !!!!!!",requestConfig) ;
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

public function main() {
    // This will not be executed because the init function returns an error.
    io:println("running main");
}
