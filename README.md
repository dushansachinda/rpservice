## Application Gateway

An application gateway is a service designed to manage and improve traffic to and from web applications by performing various functions such as load balancing, SSL/TLS offloading, security, traffic shaping, and caching.

This repository includes a sample application gateway written in Ballerina that can be customized to route and handle one or more applications. Additionally, it offers the capability to execute policy agents for each request and response, which can be configured as plugins within the gateway. This enables fine-grained control over traffic and the enforcement of policies based on specific attributes of each request and response.

### Build and run the gateway
You need to use Ballerina 2201.5.0 (Swan Lake Update 5) or higher version to run the program. 

```
% bal run
Compiling source
        xyz/gateway:0.1.0

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
- [`modules/config`](modules/config/config.bal) - module contains a set of `configurable` variables to configure the gateway. 
- [`modules/plugins`](modules/plugins/plugin_type.bal) - modules contains the current list of sample policy agents implemented as plugins
- [`service.bal`](service.bal) - contains the main HTTP service that forward requests to configured application endpoints. 
- [`interceptors.bal`](interceptors.bal) - contains a pair of request and response interceptors. They intercept HTTP requests and responses respectively and execute the the plugin chain configured for the application.
- [`gateway.bal`](gateway.bal) - initializes the getway to support configured applications with their plugin chains
- [`plugins.bal`](plugins.bal) - initialzes the plugins

### TODO
- Refactor the codebase with custom Ballerina error types.
- Add logic to sample plugin implementations.
- Improve error handling and loggig througout the codebase.