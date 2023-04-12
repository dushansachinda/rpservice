import ballerina/log;
# Returns the string `Hello` with the input string name.
#
# + name - name as a string
# + return - "Hello, " with the input string name
public function jwtProcess(string name) returns string {
    log:printInfo("response, JWT Plugin!");
    if !(name is "") {
        return "JWT Plugin, " + name;
    }
    return "JWT Plugin!";
}
