## Gateway

A gateway is a service designed to manage and improve traffic to and from web applications and apis by performing various functions such as load balancing, SSL/TLS offloading, security, traffic shaping, and caching.

This repository includes a sample gateway written in Ballerina that can be customized to route and handle one or more applications and apis. Additionally, it offers the capability to execute policy agents for each request and response, which can be configured as plugins within the gateway. This enables fine-grained control over traffic and the enforcement of policies based on specific attributes of each request and response.

### Build and run the gateway
You need to use Ballerina 2201.5.0 (Swan Lake Update 5) or higher version to run the program. 

```
% cd gateway
% bal pack;bal push --repository=local
% cd ../xyz-gateway
% bal run
Compiling source
        xyz/xyz_gateway:0.1.0

Running executable

```

#### Sample URLs
Try out the gateway with following sample commands. 

```
curl localhost:9090/api/nxn-entitlement-service/
curl localhost:9090/api/nxn-entitlement-service/metrics
curl localhost:9090/api/nxn-navbar
curl localhost:9090/app/nxn-resource-cache
```

### Implementation Notes
- [`gateway`](gateway) - directory contains the `ballerinax/gateway` library package. 
- [`xyz-gateway`](xyz-gateway) - directory contains a sample gateway written using `ballerinax/gateway` library.

#### Gateway API 

```ballerina
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

    check gateway:'start(httpListener);
}
```

### TODO
- Refactor the codebase with custom Ballerina error types.
- Improve error handling and logic througout the codebase.
- Get rid of concurrency related warnings