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
curl localhost:9090/api/xyz-entitlement-service/
curl localhost:9090/api/xyz-entitlement-service/metrics
curl localhost:9090/api/xyz-navbar
curl localhost:9090/app/xyz-resource-cache
```

### Implementation Notes
- [`gateway`](gateway) - directory contains the `ballerinax/gateway` library package. 
- [`xyz-gateway`](samples/xyz-gateway) - directory contains a sample gateway written using `ballerinax/gateway` library.

### Gateway API 

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

### Gateway Configuration
This gateway can be configured to support apps and api using a `TOML` file as follows. There exists a sample file called [`Config.toml`](samples/xyz-gateway/Config.toml) inside the [`xyz-gateway`](samples/xyz-gateway) directory. See [Configure Ballerina Programs](https://ballerina.io/learn/configure-ballerina-programs/configure-a-sample-ballerina-service/) for more details.

```toml
# API with no configured plugins 
[[ballerinax.gateway.apps]]
basePath = "/api/xyz-service"
endpointUrl = "https://run.mocky.io/v3/84643c67-6ddb-4cf1-8141-f637154c9520"

# Application with request plugins
[[ballerinax.gateway.apps]]
basePath = "/app/xyz-resource-cache"
endpointUrl = "https://run.mocky.io/v3/34a9aeba-0b71-4fac-8451-b122c50cce45"

[[ballerinax.gateway.apps.requestPlugins]]
id = "AddAccessTokenPlugin"

# API with request and response plugins
[[ballerinax.gateway.apps]]
basePath = "/api/xyz-entitlement-service"
endpointUrl = "https://run.mocky.io/v3/6613f69c-65cf-44d4-b29c-7887f21cfd59"

[[ballerinax.gateway.apps.requestPlugins]]
id = "NetworkControlPlugin"

[[ballerinax.gateway.apps.responsePlugins]]
id = "RemoveHeadersPlugin"

# Application with plugins having configs
[[ballerinax.gateway.apps]]
basePath = "/app/xyz-foo-bar"
endpointUrl = "https://run.mocky.io/v3/34a9aeba-0b71-4fac-8451-b122c50cce45"

[[ballerinax.gateway.apps.requestPlugins]]
id = "NetworkControlPlugin"
config = {level = "2"}

# Global request and response plugins
[[ballerinax.gateway.requestPlugins]]
id = "AddHeadersPlugin"
config = {appId = "xyz-app"}

[[ballerinax.gateway.responsePlugins]]
id = "RemoveHeadersPlugin"
config = {appId = "xyz-app"}
```

### TODO
- Refactor the codebase with custom Ballerina error types.
- Improve error handling and logic througout the codebase.
- Get rid of concurrency related warnings