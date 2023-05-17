import ballerinax/gateway;
import ballerina/http;

http:ListenerConfiguration listenerConfig = {};
listener http:Listener httpListener = check new (9090, listenerConfig);

public function main() returns error? {
    gateway:registerPlugin(PLUGIN_ID_ADD_ACCESS_TOKEN, pluginConfig => new AddAccessTokenPlugin(pluginConfig));
    gateway:registerPlugin(PLUGIN_ID_ADD_HEADERS, pluginConfig => new AddHeadersPlugin(pluginConfig));
    gateway:registerPlugin(PLUGIN_ID_CORS_HEADERS, pluginConfig => new CORSHeaderPlugin(pluginConfig));
    gateway:registerPlugin(PLUGIN_ID_NETWORK_CONTROL, pluginConfig => new NetworkControlPlugin(pluginConfig));
    gateway:registerPlugin(PLUGIN_ID_REMOVE_HEADERS, pluginConfig => new RemoveHeadersPlugin(pluginConfig));
    gateway:registerPlugin(PLUGIN_ID_ALWAYS_ABORT_PLUGIN, pluginConfig => new AlwaysAbortPlugin(pluginConfig));
    gateway:registerPlugin(PLUGIN_ID_HAZELCAST_MAP_CLIENT, pluginConfig => new HazelcastMapClientPlugin(pluginConfig));

    check gateway:'start(httpListener);
}
