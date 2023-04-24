import ballerina/http;
import gateway.config;
import gateway.plugins;

type Application record {|
    readonly string basePath;
    string endpointUrl;
    http:Client httpClient;
    plugins:Plugin[] requestPlugins;
    plugins:Plugin[] responsePlugins;
|};

type PathSegmentNode record {|
    readonly string path;
    Application? app = ();
    table<PathSegmentNode> key(path) children = table [];
|};

final table<Application> key(basePath) applications;
final table<PathSegmentNode> key(path) dispatchTable;

function init() returns error? {
    do {
        applications = check createApps(config:apps);
        dispatchTable = check initDispatchTable(applications);
    } on fail error e {
        return error("Error initializing gateway", cause = e);
    }
}

isolated function createApps(table<config:ApplicationConfig> key(basePath) appConfigs) returns table<Application> key(basePath)|error {
    table<Application> key(basePath) apps = table [];
    from var appConfig in appConfigs
    do {
        Application|error app = createApp(appConfig);
        if app is error {
            return error("Error initializing application", basePath = appConfig.basePath, cause = app);
        }
        apps.add(app);
    };
    return apps;
}

isolated function initDispatchTable(table<Application> key(basePath) applications) returns table<PathSegmentNode> key(path)|error {
    table<PathSegmentNode> key(path) dispatchTable = table [];
    foreach var app in applications {
        string[] paths = re `/`.split(app.basePath);
        paths = from var path in paths
            where path != ""
            select path;
        if paths.length() == 0 {
            return error("Invalid base path", basePath = app.basePath);
        }

        table<PathSegmentNode> key(path) currentDispatchTable = dispatchTable;
        PathSegmentNode currentPathSegment;
        foreach var path in paths {
            if currentDispatchTable.hasKey(path) {
                currentPathSegment = currentDispatchTable.get(path);
                currentDispatchTable = currentPathSegment.children;
            } else {
                currentPathSegment = {path: path};
                currentDispatchTable.add(currentPathSegment);
                currentDispatchTable = currentPathSegment.children;
            }
        }
        if currentPathSegment.app !is () {
            return error("Duplicate base path", basePath = app.basePath);
        }
        currentPathSegment.app = app;
    }
    return dispatchTable;
}

isolated function createApp(config:ApplicationConfig appConfig) returns Application|error {
    http:Client|error httpClient = new (appConfig.endpointUrl);
    if httpClient is error {
        return error("Error initializing application client", basePath = appConfig.basePath, endpointUrl = appConfig.endpointUrl, cause = httpClient);
    }
    plugins:Plugin[] requestPlugins = check loadPlugins(appConfig.requestPlugins, appConfig.basePath);
    plugins:Plugin[] responsePlugins = check loadPlugins(appConfig.responsePlugins, appConfig.basePath);
    return let var {basePath, endpointUrl} = appConfig in {
            basePath,
            endpointUrl,
            httpClient,
            requestPlugins,
            responsePlugins
        };
}

isolated function loadPlugins(table<config:PluginConfig> key(id)? pluginConfigs, string basePath) returns plugins:Plugin[]|error {
    if pluginConfigs is () {
        return [];
    }

    return from var pluginConfig in pluginConfigs
        select check initPlugin(pluginConfig, basePath);
}

function findApplication(http:RequestContext requestCtx) returns Application {
    // The following will never return an error. If it does, it is a developer error.
    string basePath = checkpanic requestCtx.getWithType(KEY_BASEPATH);
    return applications.get(basePath);
}

