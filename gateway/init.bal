import ballerina/http;

isolated class AppContext {
    private final string _basePath;
    private final string _endpointUrl;
    private final http:Client _httpClient;
    private final Plugin[] requestPlugins = [];
    private final Plugin[] responsePlugins = [];

    isolated function init(string basePath, string endpointUrl, http:Client httpClient) {
        self._basePath = basePath;
        self._endpointUrl = endpointUrl;
        self._httpClient = httpClient;
    }

    isolated function addRequestPlugin(Plugin plugin) {
        lock {
            self.requestPlugins.push(plugin);
        }
    }

    isolated function addResponsePlugin(Plugin plugin) {
        lock {
            self.responsePlugins.push(plugin);
        }
    }

    isolated function basePath() returns string {
        return self._basePath;
    }

    isolated function endpointUrl() returns string {
        return self._endpointUrl;
    }

    isolated function httpClient() returns http:Client {
        return self._httpClient;
    }

    isolated function requestPluginCount() returns int {
        lock {
            return self.requestPlugins.length();
        }
    }

   isolated function requestPlugin(int index) returns Plugin {
        lock {
            return self.requestPlugins[index];
        }
    }

    isolated function responsePluginCount() returns int {
        lock {
            return self.responsePlugins.length();
        }
    }

    isolated function responsePlugin(int index) returns Plugin {
        lock {
            return self.responsePlugins[index];
        }
    }
};

type PathSegmentNode record {|
    readonly string path;
    AppContext? app = ();
    table<PathSegmentNode> key(path) children = table [];
|};

final isolated map<PluginInitFunction> pluginRegistry = {};

isolated function createDispatchTable(
        readonly & table<ApplicationConfig> key(basePath) appConfigs,
        readonly & map<PluginInitFunction> registeredPlugins)
        returns table<PathSegmentNode> key(path)|error {

    map<AppContext> appContexts = check createAppContexts(appConfigs, registeredPlugins);
    table<PathSegmentNode> key(path) dispatchTable = table [];
    foreach var appContext in appContexts {
        string basePath = appContext.basePath();
        readonly & string[] paths = re `/`.split(basePath).cloneReadOnly();
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

isolated function createAppContexts(table<ApplicationConfig> key(basePath) appConfigs,
        map<PluginInitFunction> registeredPlugins) returns map<AppContext>|error {
    Plugin[] globalReqPlugins = check loadGlobalPlugins(requestPlugins, registeredPlugins);
    Plugin[] globalResPlugins = check loadGlobalPlugins(responsePlugins, registeredPlugins);

    // JBUG NPE - TODO Create issues
    // Plugin[] globalReqPlugins = from var pluginConfig in requestPlugins
    //     select check initPlugin(pluginConfig, basePath);
    // Plugin[] globalResPlugins = from var pluginConfig in responsePlugins
    //     select check initPlugin(pluginConfig, basePath);

    map<AppContext> appContexts = {};
    from var appConfig in appConfigs
    do {
        string basePath = appConfig.basePath;
        AppContext|error appContext = createAppContext(appConfig, globalReqPlugins, globalResPlugins, registeredPlugins);
        if appContext is error {
            return error("Error initializing application", basePath = basePath, cause = appContext);
        }
        appContexts[basePath] = appContext;
    };
    return appContexts;
}

isolated function createAppContext(ApplicationConfig appConfig, Plugin[] globalReqPlugins, Plugin[] globalResPlugins,
        map<PluginInitFunction> registeredPlugins) returns AppContext|error {
    var {basePath, endpointUrl} = appConfig;
    Plugin[] appReqPlugins = check loadAppPlugins(appConfig.requestPlugins, registeredPlugins, basePath);
    Plugin[] appResPlugins = check loadAppPlugins(appConfig.responsePlugins, registeredPlugins, basePath);
    appReqPlugins = [...globalReqPlugins, ...appReqPlugins];
    appResPlugins = [...globalResPlugins, ...appResPlugins];

    AppContext appContext = new(basePath, endpointUrl, httpClient = check createHttpClient(endpointUrl, basePath));
    foreach var plugin in appReqPlugins {
        appContext.addRequestPlugin(plugin);
    }
    foreach var plugin in appResPlugins {
        appContext.addResponsePlugin(plugin);
    }
    return appContext;
}

isolated function createHttpClient(string endpointUrl, string basePath) returns http:Client|error {
    http:Client|error httpClient = new (endpointUrl);
    if httpClient is error {
        return error("Error initializing application client", basePath = basePath,
            endpointUrl = endpointUrl, cause = httpClient);
    } else {
        return httpClient;
    }
}

isolated function loadGlobalPlugins(table<PluginConfig> key(id) pluginConfigs,
        map<PluginInitFunction> registeredPlugins) returns Plugin[]|error {
    Plugin[]|error plugins = loadPlugins(pluginConfigs, registeredPlugins);
    if plugins is error {
        return error("Error initializing global plugins", cause = plugins);
    } else {
        return plugins;
    }
}

isolated function loadAppPlugins(table<PluginConfig> key(id)? appPluginConfigs,
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

isolated function loadPlugins(table<PluginConfig> key(id) pluginConfigs,
        map<PluginInitFunction> registeredPlugins) returns Plugin[]|error {
    return from var pluginConfig in pluginConfigs
        select check initPlugin(pluginConfig, registeredPlugins);
}

isolated function initPlugin(PluginConfig pluginConfig, map<PluginInitFunction> registeredPlugins) returns Plugin|error {
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
