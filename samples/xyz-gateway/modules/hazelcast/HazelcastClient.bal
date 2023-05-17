import ballerina/jballerina.java;

# Ballerina class mapping for the Java `com.hazelcast.client.HazelcastClient` class.
@java:Binding {'class: "com.hazelcast.client.HazelcastClient"}
public distinct isolated class HazelcastClient {

    *java:JObject;
    *Object;

    # The `handle` field that stores the reference to the `com.hazelcast.client.HazelcastClient` object.
    public final handle jObj;

    # The init function of the Ballerina class mapping the `com.hazelcast.client.HazelcastClient` Java class.
    #
    # + obj - The `handle` value containing the Java reference of the object.
    public function init(handle obj) {
        self.jObj = obj;
    }

    # The function to retrieve the string representation of the Ballerina class mapping the `com.hazelcast.client.HazelcastClient` Java class.
    #
    # + return - The `string` form of the Java object instance.
    public isolated function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }
    # The function that maps to the `equals` method of `com.hazelcast.client.HazelcastClient`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function 'equals(Object arg0) returns boolean {
        return com_hazelcast_client_HazelcastClient_equals(self.jObj, arg0.jObj);
    }

    # The function that maps to the `getClass` method of `com.hazelcast.client.HazelcastClient`.
    #
    # + return - The `Class` value returning from the Java mapping.
    public function getClass() returns Class {
        handle externalObj = com_hazelcast_client_HazelcastClient_getClass(self.jObj);
        Class newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `hashCode` method of `com.hazelcast.client.HazelcastClient`.
    #
    # + return - The `int` value returning from the Java mapping.
    public function hashCode() returns int {
        return com_hazelcast_client_HazelcastClient_hashCode(self.jObj);
    }

    # The function that maps to the `notify` method of `com.hazelcast.client.HazelcastClient`.
    public function notify() {
        com_hazelcast_client_HazelcastClient_notify(self.jObj);
    }

    # The function that maps to the `notifyAll` method of `com.hazelcast.client.HazelcastClient`.
    public function notifyAll() {
        com_hazelcast_client_HazelcastClient_notifyAll(self.jObj);
    }

    # The function that maps to the `wait` method of `com.hazelcast.client.HazelcastClient`.
    #
    # + return - The `InterruptedException` value returning from the Java mapping.
    public function 'wait() returns InterruptedException? {
        error|() externalObj = com_hazelcast_client_HazelcastClient_wait(self.jObj);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `wait` method of `com.hazelcast.client.HazelcastClient`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `InterruptedException` value returning from the Java mapping.
    public function wait2(int arg0) returns InterruptedException? {
        error|() externalObj = com_hazelcast_client_HazelcastClient_wait2(self.jObj, arg0);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `wait` method of `com.hazelcast.client.HazelcastClient`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + return - The `InterruptedException` value returning from the Java mapping.
    public function wait3(int arg0, int arg1) returns InterruptedException? {
        error|() externalObj = com_hazelcast_client_HazelcastClient_wait3(self.jObj, arg0, arg1);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

}

# The function that maps to the `getAllHazelcastClients` method of `com.hazelcast.client.HazelcastClient`.
#
# + return - The `Collection` value returning from the Java mapping.
public function HazelcastClient_getAllHazelcastClients() returns Collection {
    handle externalObj = com_hazelcast_client_HazelcastClient_getAllHazelcastClients();
    Collection newObj = new (externalObj);
    return newObj;
}

# The function that maps to the `getHazelcastClientByName` method of `com.hazelcast.client.HazelcastClient`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
# + return - The `HazelcastInstance` value returning from the Java mapping.
public function HazelcastClient_getHazelcastClientByName(string arg0) returns HazelcastInstance {
    handle externalObj = com_hazelcast_client_HazelcastClient_getHazelcastClientByName(java:fromString(arg0));
    HazelcastInstance newObj = new (externalObj);
    return newObj;
}

# The function that maps to the `getOrCreateHazelcastClient` method of `com.hazelcast.client.HazelcastClient`.
#
# + return - The `HazelcastInstance` value returning from the Java mapping.
public function HazelcastClient_getOrCreateHazelcastClient() returns HazelcastInstance {
    handle externalObj = com_hazelcast_client_HazelcastClient_getOrCreateHazelcastClient();
    HazelcastInstance newObj = new (externalObj);
    return newObj;
}

# The function that maps to the `getOrCreateHazelcastClient` method of `com.hazelcast.client.HazelcastClient`.
#
# + arg0 - The `ClientConfig` value required to map with the Java method parameter.
# + return - The `HazelcastInstance` value returning from the Java mapping.
public function HazelcastClient_getOrCreateHazelcastClient2(ClientConfig arg0) returns HazelcastInstance {
    handle externalObj = com_hazelcast_client_HazelcastClient_getOrCreateHazelcastClient2(arg0.jObj);
    HazelcastInstance newObj = new (externalObj);
    return newObj;
}

# The function that maps to the `newHazelcastClient` method of `com.hazelcast.client.HazelcastClient`.
#
# + return - The `HazelcastInstance` value returning from the Java mapping.
public isolated function HazelcastClient_newHazelcastClient() returns HazelcastInstance {
    handle externalObj = com_hazelcast_client_HazelcastClient_newHazelcastClient();
    HazelcastInstance newObj = new (externalObj);
    return newObj;
}

# The function that maps to the `newHazelcastClient` method of `com.hazelcast.client.HazelcastClient`.
#
# + arg0 - The `ClientConfig` value required to map with the Java method parameter.
# + return - The `HazelcastInstance` value returning from the Java mapping.
public function HazelcastClient_newHazelcastClient2(ClientConfig arg0) returns HazelcastInstance {
    handle externalObj = com_hazelcast_client_HazelcastClient_newHazelcastClient2(arg0.jObj);
    HazelcastInstance newObj = new (externalObj);
    return newObj;
}

# The function that maps to the `newHazelcastFailoverClient` method of `com.hazelcast.client.HazelcastClient`.
#
# + return - The `HazelcastInstance` value returning from the Java mapping.
public function HazelcastClient_newHazelcastFailoverClient() returns HazelcastInstance {
    handle externalObj = com_hazelcast_client_HazelcastClient_newHazelcastFailoverClient();
    HazelcastInstance newObj = new (externalObj);
    return newObj;
}

# The function that maps to the `newHazelcastFailoverClient` method of `com.hazelcast.client.HazelcastClient`.
#
# + arg0 - The `ClientFailoverConfig` value required to map with the Java method parameter.
# + return - The `HazelcastInstance` value returning from the Java mapping.
public function HazelcastClient_newHazelcastFailoverClient2(ClientFailoverConfig arg0) returns HazelcastInstance {
    handle externalObj = com_hazelcast_client_HazelcastClient_newHazelcastFailoverClient2(arg0.jObj);
    HazelcastInstance newObj = new (externalObj);
    return newObj;
}

# The function that maps to the `setOutOfMemoryHandler` method of `com.hazelcast.client.HazelcastClient`.
#
# + arg0 - The `OutOfMemoryHandler` value required to map with the Java method parameter.
public function HazelcastClient_setOutOfMemoryHandler(OutOfMemoryHandler arg0) {
    com_hazelcast_client_HazelcastClient_setOutOfMemoryHandler(arg0.jObj);
}

# The function that maps to the `shutdown` method of `com.hazelcast.client.HazelcastClient`.
#
# + arg0 - The `HazelcastInstance` value required to map with the Java method parameter.
public function HazelcastClient_shutdown(HazelcastInstance arg0) {
    com_hazelcast_client_HazelcastClient_shutdown(arg0.jObj);
}

# The function that maps to the `shutdown` method of `com.hazelcast.client.HazelcastClient`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
public function HazelcastClient_shutdown2(string arg0) {
    com_hazelcast_client_HazelcastClient_shutdown2(java:fromString(arg0));
}

# The function that maps to the `shutdownAll` method of `com.hazelcast.client.HazelcastClient`.
public function HazelcastClient_shutdownAll() {
    com_hazelcast_client_HazelcastClient_shutdownAll();
}

function com_hazelcast_client_HazelcastClient_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: ["java.lang.Object"]
} external;

function com_hazelcast_client_HazelcastClient_getAllHazelcastClients() returns handle = @java:Method {
    name: "getAllHazelcastClients",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: []
} external;

function com_hazelcast_client_HazelcastClient_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: []
} external;

function com_hazelcast_client_HazelcastClient_getHazelcastClientByName(handle arg0) returns handle = @java:Method {
    name: "getHazelcastClientByName",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_client_HazelcastClient_getOrCreateHazelcastClient() returns handle = @java:Method {
    name: "getOrCreateHazelcastClient",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: []
} external;

function com_hazelcast_client_HazelcastClient_getOrCreateHazelcastClient2(handle arg0) returns handle = @java:Method {
    name: "getOrCreateHazelcastClient",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: ["com.hazelcast.client.config.ClientConfig"]
} external;

function com_hazelcast_client_HazelcastClient_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: []
} external;

isolated function com_hazelcast_client_HazelcastClient_newHazelcastClient() returns handle = @java:Method {
    name: "newHazelcastClient",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: []
} external;

function com_hazelcast_client_HazelcastClient_newHazelcastClient2(handle arg0) returns handle = @java:Method {
    name: "newHazelcastClient",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: ["com.hazelcast.client.config.ClientConfig"]
} external;

function com_hazelcast_client_HazelcastClient_newHazelcastFailoverClient() returns handle = @java:Method {
    name: "newHazelcastFailoverClient",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: []
} external;

function com_hazelcast_client_HazelcastClient_newHazelcastFailoverClient2(handle arg0) returns handle = @java:Method {
    name: "newHazelcastFailoverClient",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: ["com.hazelcast.client.config.ClientFailoverConfig"]
} external;

function com_hazelcast_client_HazelcastClient_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: []
} external;

function com_hazelcast_client_HazelcastClient_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: []
} external;

function com_hazelcast_client_HazelcastClient_setOutOfMemoryHandler(handle arg0) = @java:Method {
    name: "setOutOfMemoryHandler",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: ["com.hazelcast.core.OutOfMemoryHandler"]
} external;

function com_hazelcast_client_HazelcastClient_shutdown(handle arg0) = @java:Method {
    name: "shutdown",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: ["com.hazelcast.core.HazelcastInstance"]
} external;

function com_hazelcast_client_HazelcastClient_shutdown2(handle arg0) = @java:Method {
    name: "shutdown",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_client_HazelcastClient_shutdownAll() = @java:Method {
    name: "shutdownAll",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: []
} external;

function com_hazelcast_client_HazelcastClient_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: []
} external;

function com_hazelcast_client_HazelcastClient_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: ["long"]
} external;

function com_hazelcast_client_HazelcastClient_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "com.hazelcast.client.HazelcastClient",
    paramTypes: ["long", "int"]
} external;


