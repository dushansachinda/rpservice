import ballerina/io;
import ballerina/regex;


public map<string> propertiesMap = {};

public function readProperties() {
    //map<string> propertiesMap = {};
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


