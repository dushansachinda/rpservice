import rpservice.plugin;
import ballerina/log;

 map<int> ages = {
       // "invoke":  new plugin:CCORSHeaderPlugin()
    };

public function pluginChain(string path) returns string { 
    string cors= plugin:corsProcess(path);
    log:printInfo("cors: " + cors);
    string jwt = plugin:jwtProcess(path);
    log:printInfo("jwt: " + jwt);
    return "Hello, " + path + " " + cors + " " + jwt;
}
