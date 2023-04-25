import ballerina/http;

type Application record {|
    readonly string basePath;
    string endpointUrl;
    http:Client httpClient;
    Plugin[] requestPlugins;
    Plugin[] responsePlugins;
|};

type PathSegmentNode record {|
    readonly string path;
    Application? app = ();
    table<PathSegmentNode> key(path) children = table [];
|};

table<Application> key(basePath) appContexts = table [];
table<PathSegmentNode> key(path) dispatchTable = table [];

// function init() returns error? {
//     do {
//         appContexts = check createApps(apps);
//         dispatchTable = check initDispatchTable(appContexts);
//     } on fail error e {
//         return error("Error initializing gateway", cause = e);
//     }
// }

function createApps(table<ApplicationConfig> key(basePath) appConfigs) returns table<Application> key(basePath)|error {
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

function createApp(ApplicationConfig appConfig) returns Application|error {
    http:Client|error httpClient = new (appConfig.endpointUrl);
    if httpClient is error {
        return error("Error initializing application client", basePath = appConfig.basePath, endpointUrl = appConfig.endpointUrl, cause = httpClient);
    }
    Plugin[] requestPlugins = check loadPlugins(appConfig.requestPlugins, appConfig.basePath);
    Plugin[] responsePlugins = check loadPlugins(appConfig.responsePlugins, appConfig.basePath);
    return let var {basePath, endpointUrl} = appConfig in {
            basePath,
            endpointUrl,
            httpClient,
            requestPlugins,
            responsePlugins
        };
}

function loadPlugins(table<PluginConfig> key(id)? pluginConfigs, string basePath) returns Plugin[]|error {
    if pluginConfigs is () {
        return [];
    }

    return from var pluginConfig in pluginConfigs
        select check initPlugin(pluginConfig, basePath);
}

function initPlugin(PluginConfig pluginConfig, string basePath) returns Plugin|error {
    if !registeredPlugins.hasKey(pluginConfig.id) {
        return error("Plugin not found", id = pluginConfig.id, app_base_path = basePath);
    }

    PluginInitFunction pluginInitFunc = registeredPlugins.get(pluginConfig.id);
    Plugin|error plugin = pluginInitFunc(pluginConfig);
    if plugin is error {
        return error("Error initializing plugin", id = pluginConfig.id, app_base_path = basePath, cause = plugin);
    }

    return plugin;
}

public type PluginInitFunction function (PluginConfig pluginConfig) returns Plugin|error;

final map<PluginInitFunction> registeredPlugins = {};

public function registerPlugin(string pluginId, PluginInitFunction pluginInitFunction) {
    registeredPlugins[pluginId] = pluginInitFunction;
}

public function 'start(http:Listener httpListener) returns error? {
    do {
        appContexts = check createApps(apps);
        dispatchTable = check initDispatchTable(appContexts);
    } on fail error e {
        return error("Error initializing gateway", cause = e);
    }

    check httpListener.attach(gatewayService);
    check httpListener.'start();
}
