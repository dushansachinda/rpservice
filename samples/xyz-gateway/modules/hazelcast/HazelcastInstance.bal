import ballerina/jballerina.java;

# Ballerina class mapping for the Java `com.hazelcast.core.HazelcastInstance` interface.
@java:Binding {'class: "com.hazelcast.core.HazelcastInstance"}
public distinct isolated class HazelcastInstance {

    *java:JObject;

    # The `handle` field that stores the reference to the `com.hazelcast.core.HazelcastInstance` object.
    public final handle jObj;

    # The init function of the Ballerina class mapping the `com.hazelcast.core.HazelcastInstance` Java interface.
    #
    # + obj - The `handle` value containing the Java reference of the object.
    public isolated function init(handle obj) {
        self.jObj = obj;
    }

    # The function to retrieve the string representation of the Ballerina class mapping the `com.hazelcast.core.HazelcastInstance` Java interface.
    #
    # + return - The `string` form of the Java object instance.
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }
    # The function that maps to the `addDistributedObjectListener` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `DistributedObjectListener` value required to map with the Java method parameter.
    # + return - The `UUID` value returning from the Java mapping.
    public function addDistributedObjectListener(DistributedObjectListener arg0) returns UUID {
        handle externalObj = com_hazelcast_core_HazelcastInstance_addDistributedObjectListener(self.jObj, arg0.jObj);
        UUID newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `executeTransaction` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `TransactionalTask` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public function executeTransaction(TransactionalTask arg0) returns Object {
        handle externalObj = com_hazelcast_core_HazelcastInstance_executeTransaction(self.jObj, arg0.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `executeTransaction` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `TransactionOptions` value required to map with the Java method parameter.
    # + arg1 - The `TransactionalTask` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public function executeTransaction2(TransactionOptions arg0, TransactionalTask arg1) returns Object {
        handle externalObj = com_hazelcast_core_HazelcastInstance_executeTransaction2(self.jObj, arg0.jObj, arg1.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getCPSubsystem` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + return - The `CPSubsystem` value returning from the Java mapping.
    public function getCPSubsystem() returns CPSubsystem {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getCPSubsystem(self.jObj);
        CPSubsystem newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getCacheManager` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + return - The `ICacheManager` value returning from the Java mapping.
    public function getCacheManager() returns ICacheManager {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getCacheManager(self.jObj);
        ICacheManager newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getCardinalityEstimator` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `CardinalityEstimator` value returning from the Java mapping.
    public function getCardinalityEstimator(string arg0) returns CardinalityEstimator {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getCardinalityEstimator(self.jObj, java:fromString(arg0));
        CardinalityEstimator newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getClientService` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + return - The `ClientService` value returning from the Java mapping.
    public function getClientService() returns ClientService {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getClientService(self.jObj);
        ClientService newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getCluster` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + return - The `Cluster` value returning from the Java mapping.
    public function getCluster() returns Cluster {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getCluster(self.jObj);
        Cluster newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getConfig` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + return - The `Config` value returning from the Java mapping.
    public function getConfig() returns Config {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getConfig(self.jObj);
        Config newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getDistributedObject` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `string` value required to map with the Java method parameter.
    # + return - The `DistributedObject` value returning from the Java mapping.
    public function getDistributedObject(string arg0, string arg1) returns DistributedObject {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getDistributedObject(self.jObj, java:fromString(arg0), java:fromString(arg1));
        DistributedObject newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getDistributedObjects` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + return - The `Collection` value returning from the Java mapping.
    public function getDistributedObjects() returns Collection {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getDistributedObjects(self.jObj);
        Collection newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getDurableExecutorService` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `DurableExecutorService` value returning from the Java mapping.
    public function getDurableExecutorService(string arg0) returns DurableExecutorService {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getDurableExecutorService(self.jObj, java:fromString(arg0));
        DurableExecutorService newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getExecutorService` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `IExecutorService` value returning from the Java mapping.
    public function getExecutorService(string arg0) returns IExecutorService {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getExecutorService(self.jObj, java:fromString(arg0));
        IExecutorService newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getFlakeIdGenerator` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `FlakeIdGenerator` value returning from the Java mapping.
    public function getFlakeIdGenerator(string arg0) returns FlakeIdGenerator {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getFlakeIdGenerator(self.jObj, java:fromString(arg0));
        FlakeIdGenerator newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getJet` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + return - The `JetService` value returning from the Java mapping.
    public function getJet() returns JetService {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getJet(self.jObj);
        JetService newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getLifecycleService` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + return - The `LifecycleService` value returning from the Java mapping.
    public function getLifecycleService() returns LifecycleService {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getLifecycleService(self.jObj);
        LifecycleService newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getList` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `IList` value returning from the Java mapping.
    public function getList(string arg0) returns IList {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getList(self.jObj, java:fromString(arg0));
        IList newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getLocalEndpoint` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + return - The `Endpoint` value returning from the Java mapping.
    public function getLocalEndpoint() returns Endpoint {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getLocalEndpoint(self.jObj);
        Endpoint newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getLoggingService` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + return - The `LoggingService` value returning from the Java mapping.
    public function getLoggingService() returns LoggingService {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getLoggingService(self.jObj);
        LoggingService newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getMap` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `IMap` value returning from the Java mapping.
    public isolated function getMap(string arg0) returns IMap {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getMap(self.jObj, java:fromString(arg0));
        IMap newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getMultiMap` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `MultiMap` value returning from the Java mapping.
    public function getMultiMap(string arg0) returns MultiMap {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getMultiMap(self.jObj, java:fromString(arg0));
        MultiMap newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getName` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + return - The `string` value returning from the Java mapping.
    public function getName() returns string {
        return java:toString(com_hazelcast_core_HazelcastInstance_getName(self.jObj)) ?: "";
    }

    # The function that maps to the `getPNCounter` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `PNCounter` value returning from the Java mapping.
    public function getPNCounter(string arg0) returns PNCounter {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getPNCounter(self.jObj, java:fromString(arg0));
        PNCounter newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getPartitionService` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + return - The `PartitionService` value returning from the Java mapping.
    public function getPartitionService() returns PartitionService {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getPartitionService(self.jObj);
        PartitionService newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getQueue` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `IQueue` value returning from the Java mapping.
    public function getQueue(string arg0) returns IQueue {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getQueue(self.jObj, java:fromString(arg0));
        IQueue newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getReliableTopic` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `ITopic` value returning from the Java mapping.
    public function getReliableTopic(string arg0) returns ITopic {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getReliableTopic(self.jObj, java:fromString(arg0));
        ITopic newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getReplicatedMap` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `ReplicatedMap` value returning from the Java mapping.
    public function getReplicatedMap(string arg0) returns ReplicatedMap {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getReplicatedMap(self.jObj, java:fromString(arg0));
        ReplicatedMap newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getRingbuffer` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Ringbuffer` value returning from the Java mapping.
    public function getRingbuffer(string arg0) returns Ringbuffer {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getRingbuffer(self.jObj, java:fromString(arg0));
        Ringbuffer newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getScheduledExecutorService` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `IScheduledExecutorService` value returning from the Java mapping.
    public function getScheduledExecutorService(string arg0) returns IScheduledExecutorService {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getScheduledExecutorService(self.jObj, java:fromString(arg0));
        IScheduledExecutorService newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getSet` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `ISet` value returning from the Java mapping.
    public function getSet(string arg0) returns ISet {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getSet(self.jObj, java:fromString(arg0));
        ISet newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getSplitBrainProtectionService` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + return - The `SplitBrainProtectionService` value returning from the Java mapping.
    public function getSplitBrainProtectionService() returns SplitBrainProtectionService {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getSplitBrainProtectionService(self.jObj);
        SplitBrainProtectionService newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getSql` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + return - The `SqlService` value returning from the Java mapping.
    public function getSql() returns SqlService {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getSql(self.jObj);
        SqlService newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getTopic` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `ITopic` value returning from the Java mapping.
    public function getTopic(string arg0) returns ITopic {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getTopic(self.jObj, java:fromString(arg0));
        ITopic newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getUserContext` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + return - The `ConcurrentMap` value returning from the Java mapping.
    public function getUserContext() returns ConcurrentMap {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getUserContext(self.jObj);
        ConcurrentMap newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getXAResource` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + return - The `HazelcastXAResource` value returning from the Java mapping.
    public function getXAResource() returns HazelcastXAResource {
        handle externalObj = com_hazelcast_core_HazelcastInstance_getXAResource(self.jObj);
        HazelcastXAResource newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `newTransactionContext` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + return - The `TransactionContext` value returning from the Java mapping.
    public function newTransactionContext() returns TransactionContext {
        handle externalObj = com_hazelcast_core_HazelcastInstance_newTransactionContext(self.jObj);
        TransactionContext newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `newTransactionContext` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `TransactionOptions` value required to map with the Java method parameter.
    # + return - The `TransactionContext` value returning from the Java mapping.
    public function newTransactionContext2(TransactionOptions arg0) returns TransactionContext {
        handle externalObj = com_hazelcast_core_HazelcastInstance_newTransactionContext2(self.jObj, arg0.jObj);
        TransactionContext newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `removeDistributedObjectListener` method of `com.hazelcast.core.HazelcastInstance`.
    #
    # + arg0 - The `UUID` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function removeDistributedObjectListener(UUID arg0) returns boolean {
        return com_hazelcast_core_HazelcastInstance_removeDistributedObjectListener(self.jObj, arg0.jObj);
    }

    # The function that maps to the `shutdown` method of `com.hazelcast.core.HazelcastInstance`.
    public function shutdown() {
        com_hazelcast_core_HazelcastInstance_shutdown(self.jObj);
    }

}

function com_hazelcast_core_HazelcastInstance_addDistributedObjectListener(handle receiver, handle arg0) returns handle = @java:Method {
    name: "addDistributedObjectListener",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["com.hazelcast.core.DistributedObjectListener"]
} external;

function com_hazelcast_core_HazelcastInstance_executeTransaction(handle receiver, handle arg0) returns handle = @java:Method {
    name: "executeTransaction",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["com.hazelcast.transaction.TransactionalTask"]
} external;

function com_hazelcast_core_HazelcastInstance_executeTransaction2(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "executeTransaction",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["com.hazelcast.transaction.TransactionOptions", "com.hazelcast.transaction.TransactionalTask"]
} external;

function com_hazelcast_core_HazelcastInstance_getCPSubsystem(handle receiver) returns handle = @java:Method {
    name: "getCPSubsystem",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: []
} external;

function com_hazelcast_core_HazelcastInstance_getCacheManager(handle receiver) returns handle = @java:Method {
    name: "getCacheManager",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: []
} external;

function com_hazelcast_core_HazelcastInstance_getCardinalityEstimator(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getCardinalityEstimator",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_core_HazelcastInstance_getClientService(handle receiver) returns handle = @java:Method {
    name: "getClientService",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: []
} external;

function com_hazelcast_core_HazelcastInstance_getCluster(handle receiver) returns handle = @java:Method {
    name: "getCluster",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: []
} external;

function com_hazelcast_core_HazelcastInstance_getConfig(handle receiver) returns handle = @java:Method {
    name: "getConfig",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: []
} external;

function com_hazelcast_core_HazelcastInstance_getDistributedObject(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "getDistributedObject",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["java.lang.String", "java.lang.String"]
} external;

function com_hazelcast_core_HazelcastInstance_getDistributedObjects(handle receiver) returns handle = @java:Method {
    name: "getDistributedObjects",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: []
} external;

function com_hazelcast_core_HazelcastInstance_getDurableExecutorService(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getDurableExecutorService",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_core_HazelcastInstance_getExecutorService(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getExecutorService",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_core_HazelcastInstance_getFlakeIdGenerator(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getFlakeIdGenerator",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_core_HazelcastInstance_getJet(handle receiver) returns handle = @java:Method {
    name: "getJet",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: []
} external;

function com_hazelcast_core_HazelcastInstance_getLifecycleService(handle receiver) returns handle = @java:Method {
    name: "getLifecycleService",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: []
} external;

function com_hazelcast_core_HazelcastInstance_getList(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getList",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_core_HazelcastInstance_getLocalEndpoint(handle receiver) returns handle = @java:Method {
    name: "getLocalEndpoint",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: []
} external;

function com_hazelcast_core_HazelcastInstance_getLoggingService(handle receiver) returns handle = @java:Method {
    name: "getLoggingService",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: []
} external;

isolated function com_hazelcast_core_HazelcastInstance_getMap(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getMap",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_core_HazelcastInstance_getMultiMap(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getMultiMap",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_core_HazelcastInstance_getName(handle receiver) returns handle = @java:Method {
    name: "getName",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: []
} external;

function com_hazelcast_core_HazelcastInstance_getPNCounter(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getPNCounter",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_core_HazelcastInstance_getPartitionService(handle receiver) returns handle = @java:Method {
    name: "getPartitionService",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: []
} external;

function com_hazelcast_core_HazelcastInstance_getQueue(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getQueue",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_core_HazelcastInstance_getReliableTopic(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getReliableTopic",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_core_HazelcastInstance_getReplicatedMap(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getReplicatedMap",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_core_HazelcastInstance_getRingbuffer(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getRingbuffer",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_core_HazelcastInstance_getScheduledExecutorService(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getScheduledExecutorService",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_core_HazelcastInstance_getSet(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getSet",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_core_HazelcastInstance_getSplitBrainProtectionService(handle receiver) returns handle = @java:Method {
    name: "getSplitBrainProtectionService",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: []
} external;

function com_hazelcast_core_HazelcastInstance_getSql(handle receiver) returns handle = @java:Method {
    name: "getSql",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: []
} external;

function com_hazelcast_core_HazelcastInstance_getTopic(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getTopic",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_core_HazelcastInstance_getUserContext(handle receiver) returns handle = @java:Method {
    name: "getUserContext",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: []
} external;

function com_hazelcast_core_HazelcastInstance_getXAResource(handle receiver) returns handle = @java:Method {
    name: "getXAResource",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: []
} external;

function com_hazelcast_core_HazelcastInstance_newTransactionContext(handle receiver) returns handle = @java:Method {
    name: "newTransactionContext",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: []
} external;

function com_hazelcast_core_HazelcastInstance_newTransactionContext2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "newTransactionContext",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["com.hazelcast.transaction.TransactionOptions"]
} external;

function com_hazelcast_core_HazelcastInstance_removeDistributedObjectListener(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "removeDistributedObjectListener",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: ["java.util.UUID"]
} external;

function com_hazelcast_core_HazelcastInstance_shutdown(handle receiver) = @java:Method {
    name: "shutdown",
    'class: "com.hazelcast.core.HazelcastInstance",
    paramTypes: []
} external;


