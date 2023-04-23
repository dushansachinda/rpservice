import ballerina/io;
import rpservice.plugin;
import ballerina/http;
import rpservice.util;
import rpservice.npx;

public function interceptRequest(string[] paths, http:Caller caller, http:Request req) returns boolean|error {
    string? basePath = util:findclosestBasePath(paths); //TODO deterime correct way to extract base path
    npx:RequestConfig? requestConfig = npx:getPlugin(<string>basePath);
    if (requestConfig == ()) {
        return false;
    }
    foreach npx:RequestPlugin requestPlugin in requestConfig.requestPlugin {
        io:println("invoke interceptor request manager !!!!!!", requestPlugin.id);
        plugin:Plugin? plugin = npx:getPluginModule(requestPlugin.id);
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

public function interceptResponse(string[] paths, http:Caller caller, http:Request req) returns boolean {
    io:println("invoke  interceptor responsePlugin manager !!!!!!");
    string? basePath = util:findclosestBasePath(paths); //TODO deterime correct way to extract base path
    npx:RequestConfig? requestConfig = npx:getPlugin(<string>basePath);
    if (requestConfig == ()) {
        return false;
    }
    foreach npx:ResponsePlugin responsePlugin in requestConfig.responsePlugin {
        io:println("invoke interceptor responsePlugin manager !!!!!!", responsePlugin.id);
        plugin:Plugin? plugin = npx:getPluginModule(responsePlugin.id);
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

