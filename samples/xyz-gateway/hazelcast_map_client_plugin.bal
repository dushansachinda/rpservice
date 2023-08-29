import ballerinax/gateway;
import xyz_gateway.hazelcast;
import ballerina/jballerina.java;
import ballerina/http;
import ballerina/log;

const PLUGIN_ID_HAZELCAST_MAP_CLIENT = "HazelcastMapClientPlugin";
const DISTRIBUTED_MAP_NAME = "distributedMapName";
const DEFULT_DISTRIBUTED_MAP_NAME = "my-distributed-map";

public isolated class HazelcastMapClientPlugin {
    *gateway:Plugin;
    private final gateway:PluginConfig pluginConfig;
    private final hazelcast:HazelcastInstance hz;
    private final string distributedMapName;

    public isolated function init(gateway:PluginConfig pluginConfig) returns error? {
        self.pluginConfig = pluginConfig;
        map<string> config = pluginConfig.config ?: {};
        self.distributedMapName = config["distributedMapName"] ?: DEFULT_DISTRIBUTED_MAP_NAME;

        // Start the Hazelcast Client and connect to an already running Hazelcast Cluster on 127.0.0.1
        self.hz = hazelcast:HazelcastClient_newHazelcastClient();
    }

    public isolated function processRequest(gateway:RequestPluginContext pluginCtx) returns gateway:PluginStatus {
        log:printDebug("Plugin processRequest invoked", plugin = PLUGIN_ID_HAZELCAST_MAP_CLIENT);

        // Get the Correlation ID from the request.
        string|http:HeaderNotFoundError corelationId = pluginCtx.httpRequest.getHeader(HEADER_CORELATION_ID_KEY);
        if corelationId is http:HeaderNotFoundError {
            // If the Correlation ID is not found, return a 500 response.
            log:printError("Correlation ID not found in the request", plugin = PLUGIN_ID_HAZELCAST_MAP_CLIENT);
            http:Response response = new;
            response.statusCode = 500;
            return <gateway:Abort>{httpResponse: response};
        }

        // Get the Distributed Map from Cluster.
        hazelcast:IMap distributedMap = self.hz.getMap(self.distributedMapName);

        // Put an entry to the Distributed Map.
        hazelcast:Object key = new (java:fromString(corelationId));
        hazelcast:Object value = new (java:fromString(pluginCtx.httpRequest.userAgent));
        _ = distributedMap.put(key, value);

        return gateway:PLUGIN_STATUS_CONTINUE;
    }

    public isolated function processResponse(gateway:ResponsePluginContext pluginCtx) returns gateway:PluginStatus {
        log:printDebug("Plugin processResponse invoked", plugin = PLUGIN_ID_HAZELCAST_MAP_CLIENT);

        // Get the Distributed Map from Cluster.
        hazelcast:IMap distributedMap = self.hz.getMap(self.distributedMapName);

        // Get all the keys from the Distributed Map.
        hazelcast:Set keySet = distributedMap.keySet();

        // Iterate over the keys and print them.
        hazelcast:Object[]|error array = keySet.toArray();
        if (array !is error) {
            from var obj in array
            do {
                log:printDebug("Key: " + obj.toString(), plugin = PLUGIN_ID_HAZELCAST_MAP_CLIENT);
            };
        }
        return gateway:PLUGIN_STATUS_CONTINUE;
    }
}
