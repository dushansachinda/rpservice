import ballerina/http;

type AppContext record {|
    readonly string basePath;
    string endpointUrl;
    http:Client httpClient;
    Plugin[] requestPlugins;
    Plugin[] responsePlugins;
|};

type PathSegmentNode record {|
    readonly string path;
    AppContext? app = ();
    table<PathSegmentNode> key(path) children = table [];
|};

final map<PluginInitFunction> pluginRegistry = {};

isolated function initDispatchTable(
        table<AppContext> key(basePath) appContexts) returns table<PathSegmentNode> key(path)|error {
    table<PathSegmentNode> key(path) dispatchTable = table [];
    foreach var appContext in appContexts {
        string basePath = appContext.basePath;
        string[] paths = re `/`.split(basePath);
        paths = from var path in paths
            where path != ""
            select path;
        if paths.length() == 0 {
            // TODO Should we allow an application with base path "/"?
            return error("Invalid base path", basePath = basePath);
        }

        check addAppToDispatchTable(paths, basePath, appContext, dispatchTable);
    }
    return dispatchTable;
}

isolated function addAppToDispatchTable(string[] paths, string basePath, AppContext appContext,
        table<PathSegmentNode> key(path) dispatchTable) returns error? {
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
        return error("Duplicate base path", basePath = basePath);
    }
    currentPathSegment.app = appContext;
}

function createAppContexts(table<ApplicationConfig> key(basePath) appConfigs,
        map<PluginInitFunction> registeredPlugins) returns table<AppContext> key(basePath)|error {
    Plugin[] globalReqPlugins = check loadGlobalPlugins(requestPlugins, registeredPlugins);
    Plugin[] globalResPlugins = check loadGlobalPlugins(responsePlugins, registeredPlugins);

    // JBUG NPE - TODO Create issues
    // Plugin[] globalReqPlugins = from var pluginConfig in requestPlugins
    //     select check initPlugin(pluginConfig, basePath);
    // Plugin[] globalResPlugins = from var pluginConfig in responsePlugins
    //     select check initPlugin(pluginConfig, basePath);

    table<AppContext> key(basePath) apps = table [];
    from var appConfig in appConfigs
    do {
        string basePath = appConfig.basePath;
        AppContext|error app = createAppContext(appConfig, globalReqPlugins, globalResPlugins, registeredPlugins);
        if app is error {
            return error("Error initializing application", basePath = basePath, cause = app);
        }
        apps.add(app);
    };
    return apps;
}

function createAppContext(ApplicationConfig appConfig, Plugin[] globalReqPlugins, Plugin[] globalResPlugins,
        map<PluginInitFunction> registeredPlugins) returns AppContext|error {
    var {basePath, endpointUrl} = appConfig;
    Plugin[] appReqPlugins = check loadAppPlugins(appConfig.requestPlugins, registeredPlugins, basePath);
    Plugin[] appResPlugins = check loadAppPlugins(appConfig.responsePlugins, registeredPlugins, basePath);
    return {
        basePath,
        endpointUrl,
        httpClient: check createHttpClient(endpointUrl, basePath),
        requestPlugins: [...globalReqPlugins, ...appReqPlugins],
        responsePlugins: [...globalResPlugins, ...appResPlugins]
    };
}

function createHttpClient(string endpointUrl, string basePath) returns http:Client|error {
    http:Client|error httpClient = new (endpointUrl);
    if httpClient is error {
        return error("Error initializing application client", basePath = basePath,
            endpointUrl = endpointUrl, cause = httpClient);
    } else {
        return httpClient;
    }
}

function loadGlobalPlugins(table<PluginConfig> key(id) pluginConfigs,
        map<PluginInitFunction> registeredPlugins) returns Plugin[]|error {
    Plugin[]|error plugins = loadPlugins(pluginConfigs, registeredPlugins);
    if plugins is error {
        return error("Error initializing global plugins", cause = plugins);
    } else {
        return plugins;
    }
}

function loadAppPlugins(table<PluginConfig> key(id)? appPluginConfigs,
        map<PluginInitFunction> registeredPlugins, string basePath) returns Plugin[]|error {
    if appPluginConfigs is () {
        return [];
    }

    Plugin[]|error plugins = loadPlugins(appPluginConfigs, registeredPlugins);
    if plugins is error {
        return error("Error initializing application plugins", basePath = basePath, cause = plugins);
    } else {
        return plugins;
    }
}

function loadPlugins(table<PluginConfig> key(id) pluginConfigs,
        map<PluginInitFunction> registeredPlugins) returns Plugin[]|error {
    return from var pluginConfig in pluginConfigs
        select check initPlugin(pluginConfig, registeredPlugins);
}

function initPlugin(PluginConfig pluginConfig, map<PluginInitFunction> registeredPlugins) returns Plugin|error {
    if !registeredPlugins.hasKey(pluginConfig.id) {
        return error("Plugin not found", id = pluginConfig.id);
    }

    PluginInitFunction pluginInitFunc = registeredPlugins.get(pluginConfig.id);
    Plugin|error plugin = pluginInitFunc(pluginConfig);
    if plugin is error {
        return error("Error initializing plugin", id = pluginConfig.id, cause = plugin);
    }
    return plugin;
}
