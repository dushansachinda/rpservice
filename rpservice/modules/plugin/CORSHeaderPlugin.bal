import ballerina/log;


public function corsProcess(string name) returns string {
    log:printInfo("response, CORSHeaderPlugin!");
    if !(name is "") {
        return "CORSHeaderPlugin, " + name;
    }
    return "Hello, World!";
}
