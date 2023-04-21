import ballerina/io;
import ballerina/regex;

// Define the endpoint URLs as a map (we may need to read this from a config file)
public map<string> endpointUrls = {
    "/admin/sniff.jsp": "https://run.mocky.io/v3/6613f69c-65cf-44d4-b29c-7887f21cfd59",
    "/api/npx-service": "https://run.mocky.io/v3/84643c67-6ddb-4cf1-8141-f637154c9520",
    "/pmg/nxn-metrics": "https://run.mocky.io/v3/b6a301fc-64d8-497d-9138-058d8946bd70",
    "/app/nxn-resource-cache": "https://run.mocky.io/v3/34a9aeba-0b71-4fac-8451-b122c50cce45",
    "/api/nxn-navbar-service": "https://run.mocky.io/v3/8f5cd8a1-85ae-4d73-946b-59dda7ce5992"
};

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

public function findclosestBasePath(string[] paths, string[] storedPaths) returns string? {
    string basePath = "/";
    foreach string path in paths {
        basePath = basePath + path + "/";
    }

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
