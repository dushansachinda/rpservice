import ballerinax/gateway;
import ballerina/http;

listener http:Listener httpListener = check new (9090);

public function main() returns error? {
    gateway:registerPlugin(PLUGIN_ID_ADD_ACCESS_TOKEN, pluginConfig => new AddAccessTokenPlugin(pluginConfig));
    gateway:registerPlugin(PLUGIN_ID_ADD_HEADERS, pluginConfig => new AddHeadersPlugin(pluginConfig));
    gateway:registerPlugin(PLUGIN_ID_CORS_HEADERS, pluginConfig => new CORSHeaderPlugin(pluginConfig));
    gateway:registerPlugin(PLUGIN_ID_NETWORK_CONTROL, pluginConfig => new NetworkControlPlugin(pluginConfig));
    gateway:registerPlugin(PLUGIN_ID_REMOVE_HEADERS, pluginConfig => new RemoveHeadersPlugin(pluginConfig));

    check gateway:'start(httpListener);
}
