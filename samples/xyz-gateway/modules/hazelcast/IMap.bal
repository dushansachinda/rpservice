import ballerina/jballerina.java;
import ballerina/jballerina.java.arrays as jarrays;

# Ballerina class mapping for the Java `com.hazelcast.map.IMap` interface.
@java:Binding {'class: "com.hazelcast.map.IMap"}
public distinct class IMap {

    *java:JObject;

    # The `handle` field that stores the reference to the `com.hazelcast.map.IMap` object.
    public final handle jObj;

    # The init function of the Ballerina class mapping the `com.hazelcast.map.IMap` Java interface.
    #
    # + obj - The `handle` value containing the Java reference of the object.
    public isolated function init(handle obj) {
        self.jObj = obj;
    }

    # The function to retrieve the string representation of the Ballerina class mapping the `com.hazelcast.map.IMap` Java interface.
    #
    # + return - The `string` form of the Java object instance.
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }
    # The function that maps to the `addEntryListener` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `MapListener` value required to map with the Java method parameter.
    # + arg1 - The `boolean` value required to map with the Java method parameter.
    # + return - The `UUID` value returning from the Java mapping.
    public function addEntryListener(MapListener arg0, boolean arg1) returns UUID {
        handle externalObj = com_hazelcast_map_IMap_addEntryListener(self.jObj, arg0.jObj, arg1);
        UUID newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `addEntryListener` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `MapListener` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `boolean` value required to map with the Java method parameter.
    # + return - The `UUID` value returning from the Java mapping.
    public function addEntryListener2(MapListener arg0, Object arg1, boolean arg2) returns UUID {
        handle externalObj = com_hazelcast_map_IMap_addEntryListener2(self.jObj, arg0.jObj, arg1.jObj, arg2);
        UUID newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `addEntryListener` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `MapListener` value required to map with the Java method parameter.
    # + arg1 - The `Predicate` value required to map with the Java method parameter.
    # + arg2 - The `boolean` value required to map with the Java method parameter.
    # + return - The `UUID` value returning from the Java mapping.
    public function addEntryListener3(MapListener arg0, Predicate arg1, boolean arg2) returns UUID {
        handle externalObj = com_hazelcast_map_IMap_addEntryListener3(self.jObj, arg0.jObj, arg1.jObj, arg2);
        UUID newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `addEntryListener` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `MapListener` value required to map with the Java method parameter.
    # + arg1 - The `Predicate` value required to map with the Java method parameter.
    # + arg2 - The `Object` value required to map with the Java method parameter.
    # + arg3 - The `boolean` value required to map with the Java method parameter.
    # + return - The `UUID` value returning from the Java mapping.
    public function addEntryListener4(MapListener arg0, Predicate arg1, Object arg2, boolean arg3) returns UUID {
        handle externalObj = com_hazelcast_map_IMap_addEntryListener4(self.jObj, arg0.jObj, arg1.jObj, arg2.jObj, arg3);
        UUID newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `addIndex` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `IndexConfig` value required to map with the Java method parameter.
    public function addIndex(IndexConfig arg0) {
        com_hazelcast_map_IMap_addIndex(self.jObj, arg0.jObj);
    }

    # The function that maps to the `addIndex` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `IndexType` value required to map with the Java method parameter.
    # + arg1 - The `string[]` value required to map with the Java method parameter.
    # + return - The `error?` value returning from the Java mapping.
    public function addIndex2(IndexType arg0, string[] arg1) returns error? {
        com_hazelcast_map_IMap_addIndex2(self.jObj, arg0.jObj, check jarrays:toHandle(arg1, "java.lang.String"));
    }

    # The function that maps to the `addInterceptor` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `MapInterceptor` value required to map with the Java method parameter.
    # + return - The `string` value returning from the Java mapping.
    public function addInterceptor(MapInterceptor arg0) returns string {
        return java:toString(com_hazelcast_map_IMap_addInterceptor(self.jObj, arg0.jObj)) ?: "";
    }

    # The function that maps to the `addLocalEntryListener` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `MapListener` value required to map with the Java method parameter.
    # + return - The `UUID` value returning from the Java mapping.
    public function addLocalEntryListener(MapListener arg0) returns UUID {
        handle externalObj = com_hazelcast_map_IMap_addLocalEntryListener(self.jObj, arg0.jObj);
        UUID newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `addLocalEntryListener` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `MapListener` value required to map with the Java method parameter.
    # + arg1 - The `Predicate` value required to map with the Java method parameter.
    # + arg2 - The `boolean` value required to map with the Java method parameter.
    # + return - The `UUID` value returning from the Java mapping.
    public function addLocalEntryListener2(MapListener arg0, Predicate arg1, boolean arg2) returns UUID {
        handle externalObj = com_hazelcast_map_IMap_addLocalEntryListener2(self.jObj, arg0.jObj, arg1.jObj, arg2);
        UUID newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `addLocalEntryListener` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `MapListener` value required to map with the Java method parameter.
    # + arg1 - The `Predicate` value required to map with the Java method parameter.
    # + arg2 - The `Object` value required to map with the Java method parameter.
    # + arg3 - The `boolean` value required to map with the Java method parameter.
    # + return - The `UUID` value returning from the Java mapping.
    public function addLocalEntryListener3(MapListener arg0, Predicate arg1, Object arg2, boolean arg3) returns UUID {
        handle externalObj = com_hazelcast_map_IMap_addLocalEntryListener3(self.jObj, arg0.jObj, arg1.jObj, arg2.jObj, arg3);
        UUID newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `addPartitionLostListener` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `MapPartitionLostListener` value required to map with the Java method parameter.
    # + return - The `UUID` value returning from the Java mapping.
    public function addPartitionLostListener(MapPartitionLostListener arg0) returns UUID {
        handle externalObj = com_hazelcast_map_IMap_addPartitionLostListener(self.jObj, arg0.jObj);
        UUID newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `aggregate` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Aggregator` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public function aggregate(Aggregator arg0) returns Object {
        handle externalObj = com_hazelcast_map_IMap_aggregate(self.jObj, arg0.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `aggregate` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Aggregator` value required to map with the Java method parameter.
    # + arg1 - The `Predicate` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public function aggregate2(Aggregator arg0, Predicate arg1) returns Object {
        handle externalObj = com_hazelcast_map_IMap_aggregate2(self.jObj, arg0.jObj, arg1.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `clear` method of `com.hazelcast.map.IMap`.
    public function clear() {
        com_hazelcast_map_IMap_clear(self.jObj);
    }

    # The function that maps to the `compute` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `BiFunction` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public function compute(Object arg0, BiFunction arg1) returns Object {
        handle externalObj = com_hazelcast_map_IMap_compute(self.jObj, arg0.jObj, arg1.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `computeIfAbsent` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Function` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public function computeIfAbsent(Object arg0, Function arg1) returns Object {
        handle externalObj = com_hazelcast_map_IMap_computeIfAbsent(self.jObj, arg0.jObj, arg1.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `computeIfPresent` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `BiFunction` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public function computeIfPresent(Object arg0, BiFunction arg1) returns Object {
        handle externalObj = com_hazelcast_map_IMap_computeIfPresent(self.jObj, arg0.jObj, arg1.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `containsKey` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function containsKey(Object arg0) returns boolean {
        return com_hazelcast_map_IMap_containsKey(self.jObj, arg0.jObj);
    }

    # The function that maps to the `containsValue` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function containsValue(Object arg0) returns boolean {
        return com_hazelcast_map_IMap_containsValue(self.jObj, arg0.jObj);
    }

    # The function that maps to the `delete` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    public function delete(Object arg0) {
        com_hazelcast_map_IMap_delete(self.jObj, arg0.jObj);
    }

    # The function that maps to the `destroy` method of `com.hazelcast.map.IMap`.
    public function destroy() {
        com_hazelcast_map_IMap_destroy(self.jObj);
    }

    # The function that maps to the `entrySet` method of `com.hazelcast.map.IMap`.
    #
    # + return - The `Set` value returning from the Java mapping.
    public function entrySet() returns Set {
        handle externalObj = com_hazelcast_map_IMap_entrySet(self.jObj);
        Set newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `entrySet` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Predicate` value required to map with the Java method parameter.
    # + return - The `Set` value returning from the Java mapping.
    public function entrySet2(Predicate arg0) returns Set {
        handle externalObj = com_hazelcast_map_IMap_entrySet2(self.jObj, arg0.jObj);
        Set newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `equals` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function 'equals(Object arg0) returns boolean {
        return com_hazelcast_map_IMap_equals(self.jObj, arg0.jObj);
    }

    # The function that maps to the `evict` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function evict(Object arg0) returns boolean {
        return com_hazelcast_map_IMap_evict(self.jObj, arg0.jObj);
    }

    # The function that maps to the `evictAll` method of `com.hazelcast.map.IMap`.
    public function evictAll() {
        com_hazelcast_map_IMap_evictAll(self.jObj);
    }

    # The function that maps to the `executeOnEntries` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `EntryProcessor` value required to map with the Java method parameter.
    # + return - The `Map` value returning from the Java mapping.
    public function executeOnEntries(EntryProcessor arg0) returns Map {
        handle externalObj = com_hazelcast_map_IMap_executeOnEntries(self.jObj, arg0.jObj);
        Map newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `executeOnEntries` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `EntryProcessor` value required to map with the Java method parameter.
    # + arg1 - The `Predicate` value required to map with the Java method parameter.
    # + return - The `Map` value returning from the Java mapping.
    public function executeOnEntries2(EntryProcessor arg0, Predicate arg1) returns Map {
        handle externalObj = com_hazelcast_map_IMap_executeOnEntries2(self.jObj, arg0.jObj, arg1.jObj);
        Map newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `executeOnKey` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `EntryProcessor` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public function executeOnKey(Object arg0, EntryProcessor arg1) returns Object {
        handle externalObj = com_hazelcast_map_IMap_executeOnKey(self.jObj, arg0.jObj, arg1.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `executeOnKeys` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Set` value required to map with the Java method parameter.
    # + arg1 - The `EntryProcessor` value required to map with the Java method parameter.
    # + return - The `Map` value returning from the Java mapping.
    public function executeOnKeys(Set arg0, EntryProcessor arg1) returns Map {
        handle externalObj = com_hazelcast_map_IMap_executeOnKeys(self.jObj, arg0.jObj, arg1.jObj);
        Map newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `flush` method of `com.hazelcast.map.IMap`.
    public function 'flush() {
        com_hazelcast_map_IMap_flush(self.jObj);
    }

    # The function that maps to the `forEach` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `BiConsumer` value required to map with the Java method parameter.
    public function forEach(BiConsumer arg0) {
        com_hazelcast_map_IMap_forEach(self.jObj, arg0.jObj);
    }

    # The function that maps to the `forEach` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Consumer` value required to map with the Java method parameter.
    public function forEach2(Consumer arg0) {
        com_hazelcast_map_IMap_forEach2(self.jObj, arg0.jObj);
    }

    # The function that maps to the `forceUnlock` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    public function forceUnlock(Object arg0) {
        com_hazelcast_map_IMap_forceUnlock(self.jObj, arg0.jObj);
    }

    # The function that maps to the `get` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public function get(Object arg0) returns Object {
        handle externalObj = com_hazelcast_map_IMap_get(self.jObj, arg0.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getAll` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Set` value required to map with the Java method parameter.
    # + return - The `Map` value returning from the Java mapping.
    public function getAll(Set arg0) returns Map {
        handle externalObj = com_hazelcast_map_IMap_getAll(self.jObj, arg0.jObj);
        Map newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getAsync` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `CompletionStage` value returning from the Java mapping.
    public function getAsync(Object arg0) returns CompletionStage {
        handle externalObj = com_hazelcast_map_IMap_getAsync(self.jObj, arg0.jObj);
        CompletionStage newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getDestroyContextForTenant` method of `com.hazelcast.map.IMap`.
    #
    # + return - The `DestroyEventContext` value returning from the Java mapping.
    public function getDestroyContextForTenant() returns DestroyEventContext {
        handle externalObj = com_hazelcast_map_IMap_getDestroyContextForTenant(self.jObj);
        DestroyEventContext newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getEntryView` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `EntryView` value returning from the Java mapping.
    public function getEntryView(Object arg0) returns EntryView {
        handle externalObj = com_hazelcast_map_IMap_getEntryView(self.jObj, arg0.jObj);
        EntryView newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getLocalMapStats` method of `com.hazelcast.map.IMap`.
    #
    # + return - The `LocalMapStats` value returning from the Java mapping.
    public function getLocalMapStats() returns LocalMapStats {
        handle externalObj = com_hazelcast_map_IMap_getLocalMapStats(self.jObj);
        LocalMapStats newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getName` method of `com.hazelcast.map.IMap`.
    #
    # + return - The `string` value returning from the Java mapping.
    public function getName() returns string {
        return java:toString(com_hazelcast_map_IMap_getName(self.jObj)) ?: "";
    }

    # The function that maps to the `getOrDefault` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public function getOrDefault(Object arg0, Object arg1) returns Object {
        handle externalObj = com_hazelcast_map_IMap_getOrDefault(self.jObj, arg0.jObj, arg1.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getPartitionKey` method of `com.hazelcast.map.IMap`.
    #
    # + return - The `string` value returning from the Java mapping.
    public function getPartitionKey() returns string {
        return java:toString(com_hazelcast_map_IMap_getPartitionKey(self.jObj)) ?: "";
    }

    # The function that maps to the `getQueryCache` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `QueryCache` value returning from the Java mapping.
    public function getQueryCache(string arg0) returns QueryCache {
        handle externalObj = com_hazelcast_map_IMap_getQueryCache(self.jObj, java:fromString(arg0));
        QueryCache newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getQueryCache` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `MapListener` value required to map with the Java method parameter.
    # + arg2 - The `Predicate` value required to map with the Java method parameter.
    # + arg3 - The `boolean` value required to map with the Java method parameter.
    # + return - The `QueryCache` value returning from the Java mapping.
    public function getQueryCache2(string arg0, MapListener arg1, Predicate arg2, boolean arg3) returns QueryCache {
        handle externalObj = com_hazelcast_map_IMap_getQueryCache2(self.jObj, java:fromString(arg0), arg1.jObj, arg2.jObj, arg3);
        QueryCache newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getQueryCache` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `Predicate` value required to map with the Java method parameter.
    # + arg2 - The `boolean` value required to map with the Java method parameter.
    # + return - The `QueryCache` value returning from the Java mapping.
    public function getQueryCache3(string arg0, Predicate arg1, boolean arg2) returns QueryCache {
        handle externalObj = com_hazelcast_map_IMap_getQueryCache3(self.jObj, java:fromString(arg0), arg1.jObj, arg2);
        QueryCache newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getServiceName` method of `com.hazelcast.map.IMap`.
    #
    # + return - The `string` value returning from the Java mapping.
    public function getServiceName() returns string {
        return java:toString(com_hazelcast_map_IMap_getServiceName(self.jObj)) ?: "";
    }

    # The function that maps to the `hashCode` method of `com.hazelcast.map.IMap`.
    #
    # + return - The `int` value returning from the Java mapping.
    public function hashCode() returns int {
        return com_hazelcast_map_IMap_hashCode(self.jObj);
    }

    # The function that maps to the `isEmpty` method of `com.hazelcast.map.IMap`.
    #
    # + return - The `boolean` value returning from the Java mapping.
    public function isEmpty() returns boolean {
        return com_hazelcast_map_IMap_isEmpty(self.jObj);
    }

    # The function that maps to the `isEmpty` method of `com.hazelcast.map.IMap`.
    #
    # + return - The `boolean` value returning from the Java mapping.
    public function isEmpty2() returns boolean {
        return com_hazelcast_map_IMap_isEmpty2(self.jObj);
    }

    # The function that maps to the `isLocked` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function isLocked(Object arg0) returns boolean {
        return com_hazelcast_map_IMap_isLocked(self.jObj, arg0.jObj);
    }

    # The function that maps to the `iterator` method of `com.hazelcast.map.IMap`.
    #
    # + return - The `Iterator` value returning from the Java mapping.
    public function iterator() returns Iterator {
        handle externalObj = com_hazelcast_map_IMap_iterator(self.jObj);
        Iterator newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `iterator` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `Iterator` value returning from the Java mapping.
    public function iterator2(int arg0) returns Iterator {
        handle externalObj = com_hazelcast_map_IMap_iterator2(self.jObj, arg0);
        Iterator newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `keySet` method of `com.hazelcast.map.IMap`.
    #
    # + return - The `Set` value returning from the Java mapping.
    public isolated function keySet() returns Set {
        handle externalObj = com_hazelcast_map_IMap_keySet(self.jObj);
        Set newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `keySet` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Predicate` value required to map with the Java method parameter.
    # + return - The `Set` value returning from the Java mapping.
    public function keySet2(Predicate arg0) returns Set {
        handle externalObj = com_hazelcast_map_IMap_keySet2(self.jObj, arg0.jObj);
        Set newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `loadAll` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `boolean` value required to map with the Java method parameter.
    public function loadAll(boolean arg0) {
        com_hazelcast_map_IMap_loadAll(self.jObj, arg0);
    }

    # The function that maps to the `loadAll` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Set` value required to map with the Java method parameter.
    # + arg1 - The `boolean` value required to map with the Java method parameter.
    public function loadAll2(Set arg0, boolean arg1) {
        com_hazelcast_map_IMap_loadAll2(self.jObj, arg0.jObj, arg1);
    }

    # The function that maps to the `localKeySet` method of `com.hazelcast.map.IMap`.
    #
    # + return - The `Set` value returning from the Java mapping.
    public function localKeySet() returns Set {
        handle externalObj = com_hazelcast_map_IMap_localKeySet(self.jObj);
        Set newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `localKeySet` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Predicate` value required to map with the Java method parameter.
    # + return - The `Set` value returning from the Java mapping.
    public function localKeySet2(Predicate arg0) returns Set {
        handle externalObj = com_hazelcast_map_IMap_localKeySet2(self.jObj, arg0.jObj);
        Set newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `lock` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    public function 'lock(Object arg0) {
        com_hazelcast_map_IMap_lock(self.jObj, arg0.jObj);
    }

    # The function that maps to the `lock` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + arg2 - The `TimeUnit` value required to map with the Java method parameter.
    public function lock2(Object arg0, int arg1, TimeUnit arg2) {
        com_hazelcast_map_IMap_lock2(self.jObj, arg0.jObj, arg1, arg2.jObj);
    }

    # The function that maps to the `merge` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `BiFunction` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public function merge(Object arg0, Object arg1, BiFunction arg2) returns Object {
        handle externalObj = com_hazelcast_map_IMap_merge(self.jObj, arg0.jObj, arg1.jObj, arg2.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `project` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Projection` value required to map with the Java method parameter.
    # + return - The `Collection` value returning from the Java mapping.
    public function project(Projection arg0) returns Collection {
        handle externalObj = com_hazelcast_map_IMap_project(self.jObj, arg0.jObj);
        Collection newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `project` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Projection` value required to map with the Java method parameter.
    # + arg1 - The `Predicate` value required to map with the Java method parameter.
    # + return - The `Collection` value returning from the Java mapping.
    public function project2(Projection arg0, Predicate arg1) returns Collection {
        handle externalObj = com_hazelcast_map_IMap_project2(self.jObj, arg0.jObj, arg1.jObj);
        Collection newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `put` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public isolated function put(Object arg0, Object arg1) returns Object {
        handle externalObj = com_hazelcast_map_IMap_put(self.jObj, arg0.jObj, arg1.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `put` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `int` value required to map with the Java method parameter.
    # + arg3 - The `TimeUnit` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public function put2(Object arg0, Object arg1, int arg2, TimeUnit arg3) returns Object {
        handle externalObj = com_hazelcast_map_IMap_put2(self.jObj, arg0.jObj, arg1.jObj, arg2, arg3.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `put` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `int` value required to map with the Java method parameter.
    # + arg3 - The `TimeUnit` value required to map with the Java method parameter.
    # + arg4 - The `int` value required to map with the Java method parameter.
    # + arg5 - The `TimeUnit` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public function put3(Object arg0, Object arg1, int arg2, TimeUnit arg3, int arg4, TimeUnit arg5) returns Object {
        handle externalObj = com_hazelcast_map_IMap_put3(self.jObj, arg0.jObj, arg1.jObj, arg2, arg3.jObj, arg4, arg5.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `putAll` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Map` value required to map with the Java method parameter.
    public function putAll(Map arg0) {
        com_hazelcast_map_IMap_putAll(self.jObj, arg0.jObj);
    }

    # The function that maps to the `putAllAsync` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Map` value required to map with the Java method parameter.
    # + return - The `CompletionStage` value returning from the Java mapping.
    public function putAllAsync(Map arg0) returns CompletionStage {
        handle externalObj = com_hazelcast_map_IMap_putAllAsync(self.jObj, arg0.jObj);
        CompletionStage newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `putAsync` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `CompletionStage` value returning from the Java mapping.
    public function putAsync(Object arg0, Object arg1) returns CompletionStage {
        handle externalObj = com_hazelcast_map_IMap_putAsync(self.jObj, arg0.jObj, arg1.jObj);
        CompletionStage newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `putAsync` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `int` value required to map with the Java method parameter.
    # + arg3 - The `TimeUnit` value required to map with the Java method parameter.
    # + return - The `CompletionStage` value returning from the Java mapping.
    public function putAsync2(Object arg0, Object arg1, int arg2, TimeUnit arg3) returns CompletionStage {
        handle externalObj = com_hazelcast_map_IMap_putAsync2(self.jObj, arg0.jObj, arg1.jObj, arg2, arg3.jObj);
        CompletionStage newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `putAsync` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `int` value required to map with the Java method parameter.
    # + arg3 - The `TimeUnit` value required to map with the Java method parameter.
    # + arg4 - The `int` value required to map with the Java method parameter.
    # + arg5 - The `TimeUnit` value required to map with the Java method parameter.
    # + return - The `CompletionStage` value returning from the Java mapping.
    public function putAsync3(Object arg0, Object arg1, int arg2, TimeUnit arg3, int arg4, TimeUnit arg5) returns CompletionStage {
        handle externalObj = com_hazelcast_map_IMap_putAsync3(self.jObj, arg0.jObj, arg1.jObj, arg2, arg3.jObj, arg4, arg5.jObj);
        CompletionStage newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `putIfAbsent` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public function putIfAbsent(Object arg0, Object arg1) returns Object {
        handle externalObj = com_hazelcast_map_IMap_putIfAbsent(self.jObj, arg0.jObj, arg1.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `putIfAbsent` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `int` value required to map with the Java method parameter.
    # + arg3 - The `TimeUnit` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public function putIfAbsent2(Object arg0, Object arg1, int arg2, TimeUnit arg3) returns Object {
        handle externalObj = com_hazelcast_map_IMap_putIfAbsent2(self.jObj, arg0.jObj, arg1.jObj, arg2, arg3.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `putIfAbsent` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `int` value required to map with the Java method parameter.
    # + arg3 - The `TimeUnit` value required to map with the Java method parameter.
    # + arg4 - The `int` value required to map with the Java method parameter.
    # + arg5 - The `TimeUnit` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public function putIfAbsent3(Object arg0, Object arg1, int arg2, TimeUnit arg3, int arg4, TimeUnit arg5) returns Object {
        handle externalObj = com_hazelcast_map_IMap_putIfAbsent3(self.jObj, arg0.jObj, arg1.jObj, arg2, arg3.jObj, arg4, arg5.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `putTransient` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `int` value required to map with the Java method parameter.
    # + arg3 - The `TimeUnit` value required to map with the Java method parameter.
    public function putTransient(Object arg0, Object arg1, int arg2, TimeUnit arg3) {
        com_hazelcast_map_IMap_putTransient(self.jObj, arg0.jObj, arg1.jObj, arg2, arg3.jObj);
    }

    # The function that maps to the `putTransient` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `int` value required to map with the Java method parameter.
    # + arg3 - The `TimeUnit` value required to map with the Java method parameter.
    # + arg4 - The `int` value required to map with the Java method parameter.
    # + arg5 - The `TimeUnit` value required to map with the Java method parameter.
    public function putTransient2(Object arg0, Object arg1, int arg2, TimeUnit arg3, int arg4, TimeUnit arg5) {
        com_hazelcast_map_IMap_putTransient2(self.jObj, arg0.jObj, arg1.jObj, arg2, arg3.jObj, arg4, arg5.jObj);
    }

    # The function that maps to the `remove` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public function remove(Object arg0) returns Object {
        handle externalObj = com_hazelcast_map_IMap_remove(self.jObj, arg0.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `remove` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function remove2(Object arg0, Object arg1) returns boolean {
        return com_hazelcast_map_IMap_remove2(self.jObj, arg0.jObj, arg1.jObj);
    }

    # The function that maps to the `removeAll` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Predicate` value required to map with the Java method parameter.
    public function removeAll(Predicate arg0) {
        com_hazelcast_map_IMap_removeAll(self.jObj, arg0.jObj);
    }

    # The function that maps to the `removeAsync` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `CompletionStage` value returning from the Java mapping.
    public function removeAsync(Object arg0) returns CompletionStage {
        handle externalObj = com_hazelcast_map_IMap_removeAsync(self.jObj, arg0.jObj);
        CompletionStage newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `removeEntryListener` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `UUID` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function removeEntryListener(UUID arg0) returns boolean {
        return com_hazelcast_map_IMap_removeEntryListener(self.jObj, arg0.jObj);
    }

    # The function that maps to the `removeInterceptor` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function removeInterceptor(string arg0) returns boolean {
        return com_hazelcast_map_IMap_removeInterceptor(self.jObj, java:fromString(arg0));
    }

    # The function that maps to the `removePartitionLostListener` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `UUID` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function removePartitionLostListener(UUID arg0) returns boolean {
        return com_hazelcast_map_IMap_removePartitionLostListener(self.jObj, arg0.jObj);
    }

    # The function that maps to the `replace` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    public function replace(Object arg0, Object arg1) returns Object {
        handle externalObj = com_hazelcast_map_IMap_replace(self.jObj, arg0.jObj, arg1.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `replace` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function replace2(Object arg0, Object arg1, Object arg2) returns boolean {
        return com_hazelcast_map_IMap_replace2(self.jObj, arg0.jObj, arg1.jObj, arg2.jObj);
    }

    # The function that maps to the `replaceAll` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `BiFunction` value required to map with the Java method parameter.
    public function replaceAll(BiFunction arg0) {
        com_hazelcast_map_IMap_replaceAll(self.jObj, arg0.jObj);
    }

    # The function that maps to the `set` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    public function set(Object arg0, Object arg1) {
        com_hazelcast_map_IMap_set(self.jObj, arg0.jObj, arg1.jObj);
    }

    # The function that maps to the `set` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `int` value required to map with the Java method parameter.
    # + arg3 - The `TimeUnit` value required to map with the Java method parameter.
    public function set2(Object arg0, Object arg1, int arg2, TimeUnit arg3) {
        com_hazelcast_map_IMap_set2(self.jObj, arg0.jObj, arg1.jObj, arg2, arg3.jObj);
    }

    # The function that maps to the `set` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `int` value required to map with the Java method parameter.
    # + arg3 - The `TimeUnit` value required to map with the Java method parameter.
    # + arg4 - The `int` value required to map with the Java method parameter.
    # + arg5 - The `TimeUnit` value required to map with the Java method parameter.
    public function set3(Object arg0, Object arg1, int arg2, TimeUnit arg3, int arg4, TimeUnit arg5) {
        com_hazelcast_map_IMap_set3(self.jObj, arg0.jObj, arg1.jObj, arg2, arg3.jObj, arg4, arg5.jObj);
    }

    # The function that maps to the `setAll` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Map` value required to map with the Java method parameter.
    public function setAll(Map arg0) {
        com_hazelcast_map_IMap_setAll(self.jObj, arg0.jObj);
    }

    # The function that maps to the `setAllAsync` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Map` value required to map with the Java method parameter.
    # + return - The `CompletionStage` value returning from the Java mapping.
    public function setAllAsync(Map arg0) returns CompletionStage {
        handle externalObj = com_hazelcast_map_IMap_setAllAsync(self.jObj, arg0.jObj);
        CompletionStage newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `setAsync` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + return - The `CompletionStage` value returning from the Java mapping.
    public function setAsync(Object arg0, Object arg1) returns CompletionStage {
        handle externalObj = com_hazelcast_map_IMap_setAsync(self.jObj, arg0.jObj, arg1.jObj);
        CompletionStage newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `setAsync` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `int` value required to map with the Java method parameter.
    # + arg3 - The `TimeUnit` value required to map with the Java method parameter.
    # + return - The `CompletionStage` value returning from the Java mapping.
    public function setAsync2(Object arg0, Object arg1, int arg2, TimeUnit arg3) returns CompletionStage {
        handle externalObj = com_hazelcast_map_IMap_setAsync2(self.jObj, arg0.jObj, arg1.jObj, arg2, arg3.jObj);
        CompletionStage newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `setAsync` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `int` value required to map with the Java method parameter.
    # + arg3 - The `TimeUnit` value required to map with the Java method parameter.
    # + arg4 - The `int` value required to map with the Java method parameter.
    # + arg5 - The `TimeUnit` value required to map with the Java method parameter.
    # + return - The `CompletionStage` value returning from the Java mapping.
    public function setAsync3(Object arg0, Object arg1, int arg2, TimeUnit arg3, int arg4, TimeUnit arg5) returns CompletionStage {
        handle externalObj = com_hazelcast_map_IMap_setAsync3(self.jObj, arg0.jObj, arg1.jObj, arg2, arg3.jObj, arg4, arg5.jObj);
        CompletionStage newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `setTtl` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + arg2 - The `TimeUnit` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function setTtl(Object arg0, int arg1, TimeUnit arg2) returns boolean {
        return com_hazelcast_map_IMap_setTtl(self.jObj, arg0.jObj, arg1, arg2.jObj);
    }

    # The function that maps to the `size` method of `com.hazelcast.map.IMap`.
    #
    # + return - The `int` value returning from the Java mapping.
    public function size() returns int {
        return com_hazelcast_map_IMap_size(self.jObj);
    }

    # The function that maps to the `size` method of `com.hazelcast.map.IMap`.
    #
    # + return - The `int` value returning from the Java mapping.
    public function size2() returns int {
        return com_hazelcast_map_IMap_size2(self.jObj);
    }

    # The function that maps to the `spliterator` method of `com.hazelcast.map.IMap`.
    #
    # + return - The `Spliterator` value returning from the Java mapping.
    public function spliterator() returns Spliterator {
        handle externalObj = com_hazelcast_map_IMap_spliterator(self.jObj);
        Spliterator newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `submitToKey` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `EntryProcessor` value required to map with the Java method parameter.
    # + return - The `CompletionStage` value returning from the Java mapping.
    public function submitToKey(Object arg0, EntryProcessor arg1) returns CompletionStage {
        handle externalObj = com_hazelcast_map_IMap_submitToKey(self.jObj, arg0.jObj, arg1.jObj);
        CompletionStage newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `submitToKeys` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Set` value required to map with the Java method parameter.
    # + arg1 - The `EntryProcessor` value required to map with the Java method parameter.
    # + return - The `CompletionStage` value returning from the Java mapping.
    public function submitToKeys(Set arg0, EntryProcessor arg1) returns CompletionStage {
        handle externalObj = com_hazelcast_map_IMap_submitToKeys(self.jObj, arg0.jObj, arg1.jObj);
        CompletionStage newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `tryLock` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function tryLock(Object arg0) returns boolean {
        return com_hazelcast_map_IMap_tryLock(self.jObj, arg0.jObj);
    }

    # The function that maps to the `tryLock` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + arg2 - The `TimeUnit` value required to map with the Java method parameter.
    # + return - The `boolean` or the `InterruptedException` value returning from the Java mapping.
    public function tryLock2(Object arg0, int arg1, TimeUnit arg2) returns boolean|InterruptedException {
        boolean|error externalObj = com_hazelcast_map_IMap_tryLock2(self.jObj, arg0.jObj, arg1, arg2.jObj);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        } else {
            return externalObj;
        }
    }

    # The function that maps to the `tryLock` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + arg2 - The `TimeUnit` value required to map with the Java method parameter.
    # + arg3 - The `int` value required to map with the Java method parameter.
    # + arg4 - The `TimeUnit` value required to map with the Java method parameter.
    # + return - The `boolean` or the `InterruptedException` value returning from the Java mapping.
    public function tryLock3(Object arg0, int arg1, TimeUnit arg2, int arg3, TimeUnit arg4) returns boolean|InterruptedException {
        boolean|error externalObj = com_hazelcast_map_IMap_tryLock3(self.jObj, arg0.jObj, arg1, arg2.jObj, arg3, arg4.jObj);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        } else {
            return externalObj;
        }
    }

    # The function that maps to the `tryPut` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `Object` value required to map with the Java method parameter.
    # + arg2 - The `int` value required to map with the Java method parameter.
    # + arg3 - The `TimeUnit` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function tryPut(Object arg0, Object arg1, int arg2, TimeUnit arg3) returns boolean {
        return com_hazelcast_map_IMap_tryPut(self.jObj, arg0.jObj, arg1.jObj, arg2, arg3.jObj);
    }

    # The function that maps to the `tryRemove` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + arg2 - The `TimeUnit` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function tryRemove(Object arg0, int arg1, TimeUnit arg2) returns boolean {
        return com_hazelcast_map_IMap_tryRemove(self.jObj, arg0.jObj, arg1, arg2.jObj);
    }

    # The function that maps to the `unlock` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    public function unlock(Object arg0) {
        com_hazelcast_map_IMap_unlock(self.jObj, arg0.jObj);
    }

    # The function that maps to the `values` method of `com.hazelcast.map.IMap`.
    #
    # + return - The `Collection` value returning from the Java mapping.
    public function values() returns Collection {
        handle externalObj = com_hazelcast_map_IMap_values(self.jObj);
        Collection newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `values` method of `com.hazelcast.map.IMap`.
    #
    # + arg0 - The `Predicate` value required to map with the Java method parameter.
    # + return - The `Collection` value returning from the Java mapping.
    public function values2(Predicate arg0) returns Collection {
        handle externalObj = com_hazelcast_map_IMap_values2(self.jObj, arg0.jObj);
        Collection newObj = new (externalObj);
        return newObj;
    }

}

function com_hazelcast_map_IMap_addEntryListener(handle receiver, handle arg0, boolean arg1) returns handle = @java:Method {
    name: "addEntryListener",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.map.listener.MapListener", "boolean"]
} external;

function com_hazelcast_map_IMap_addEntryListener2(handle receiver, handle arg0, handle arg1, boolean arg2) returns handle = @java:Method {
    name: "addEntryListener",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.map.listener.MapListener", "java.lang.Object", "boolean"]
} external;

function com_hazelcast_map_IMap_addEntryListener3(handle receiver, handle arg0, handle arg1, boolean arg2) returns handle = @java:Method {
    name: "addEntryListener",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.map.listener.MapListener", "com.hazelcast.query.Predicate", "boolean"]
} external;

function com_hazelcast_map_IMap_addEntryListener4(handle receiver, handle arg0, handle arg1, handle arg2, boolean arg3) returns handle = @java:Method {
    name: "addEntryListener",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.map.listener.MapListener", "com.hazelcast.query.Predicate", "java.lang.Object", "boolean"]
} external;

function com_hazelcast_map_IMap_addIndex(handle receiver, handle arg0) = @java:Method {
    name: "addIndex",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.config.IndexConfig"]
} external;

function com_hazelcast_map_IMap_addIndex2(handle receiver, handle arg0, handle arg1) = @java:Method {
    name: "addIndex",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.config.IndexType", "[Ljava.lang.String;"]
} external;

function com_hazelcast_map_IMap_addInterceptor(handle receiver, handle arg0) returns handle = @java:Method {
    name: "addInterceptor",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.map.MapInterceptor"]
} external;

function com_hazelcast_map_IMap_addLocalEntryListener(handle receiver, handle arg0) returns handle = @java:Method {
    name: "addLocalEntryListener",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.map.listener.MapListener"]
} external;

function com_hazelcast_map_IMap_addLocalEntryListener2(handle receiver, handle arg0, handle arg1, boolean arg2) returns handle = @java:Method {
    name: "addLocalEntryListener",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.map.listener.MapListener", "com.hazelcast.query.Predicate", "boolean"]
} external;

function com_hazelcast_map_IMap_addLocalEntryListener3(handle receiver, handle arg0, handle arg1, handle arg2, boolean arg3) returns handle = @java:Method {
    name: "addLocalEntryListener",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.map.listener.MapListener", "com.hazelcast.query.Predicate", "java.lang.Object", "boolean"]
} external;

function com_hazelcast_map_IMap_addPartitionLostListener(handle receiver, handle arg0) returns handle = @java:Method {
    name: "addPartitionLostListener",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.map.listener.MapPartitionLostListener"]
} external;

function com_hazelcast_map_IMap_aggregate(handle receiver, handle arg0) returns handle = @java:Method {
    name: "aggregate",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.aggregation.Aggregator"]
} external;

function com_hazelcast_map_IMap_aggregate2(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "aggregate",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.aggregation.Aggregator", "com.hazelcast.query.Predicate"]
} external;

function com_hazelcast_map_IMap_clear(handle receiver) = @java:Method {
    name: "clear",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_compute(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "compute",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.util.function.BiFunction"]
} external;

function com_hazelcast_map_IMap_computeIfAbsent(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "computeIfAbsent",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.util.function.Function"]
} external;

function com_hazelcast_map_IMap_computeIfPresent(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "computeIfPresent",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.util.function.BiFunction"]
} external;

function com_hazelcast_map_IMap_containsKey(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "containsKey",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object"]
} external;

function com_hazelcast_map_IMap_containsValue(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "containsValue",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object"]
} external;

function com_hazelcast_map_IMap_delete(handle receiver, handle arg0) = @java:Method {
    name: "delete",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object"]
} external;

function com_hazelcast_map_IMap_destroy(handle receiver) = @java:Method {
    name: "destroy",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_entrySet(handle receiver) returns handle = @java:Method {
    name: "entrySet",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_entrySet2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "entrySet",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.query.Predicate"]
} external;

function com_hazelcast_map_IMap_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object"]
} external;

function com_hazelcast_map_IMap_evict(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "evict",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object"]
} external;

function com_hazelcast_map_IMap_evictAll(handle receiver) = @java:Method {
    name: "evictAll",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_executeOnEntries(handle receiver, handle arg0) returns handle = @java:Method {
    name: "executeOnEntries",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.map.EntryProcessor"]
} external;

function com_hazelcast_map_IMap_executeOnEntries2(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "executeOnEntries",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.map.EntryProcessor", "com.hazelcast.query.Predicate"]
} external;

function com_hazelcast_map_IMap_executeOnKey(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "executeOnKey",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "com.hazelcast.map.EntryProcessor"]
} external;

function com_hazelcast_map_IMap_executeOnKeys(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "executeOnKeys",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.util.Set", "com.hazelcast.map.EntryProcessor"]
} external;

function com_hazelcast_map_IMap_flush(handle receiver) = @java:Method {
    name: "flush",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_forEach(handle receiver, handle arg0) = @java:Method {
    name: "forEach",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.util.function.BiConsumer"]
} external;

function com_hazelcast_map_IMap_forEach2(handle receiver, handle arg0) = @java:Method {
    name: "forEach",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.util.function.Consumer"]
} external;

function com_hazelcast_map_IMap_forceUnlock(handle receiver, handle arg0) = @java:Method {
    name: "forceUnlock",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object"]
} external;

function com_hazelcast_map_IMap_get(handle receiver, handle arg0) returns handle = @java:Method {
    name: "get",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object"]
} external;

function com_hazelcast_map_IMap_getAll(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getAll",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.util.Set"]
} external;

function com_hazelcast_map_IMap_getAsync(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getAsync",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object"]
} external;

function com_hazelcast_map_IMap_getDestroyContextForTenant(handle receiver) returns handle = @java:Method {
    name: "getDestroyContextForTenant",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_getEntryView(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getEntryView",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object"]
} external;

function com_hazelcast_map_IMap_getLocalMapStats(handle receiver) returns handle = @java:Method {
    name: "getLocalMapStats",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_getName(handle receiver) returns handle = @java:Method {
    name: "getName",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_getOrDefault(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "getOrDefault",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object"]
} external;

function com_hazelcast_map_IMap_getPartitionKey(handle receiver) returns handle = @java:Method {
    name: "getPartitionKey",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_getQueryCache(handle receiver, handle arg0) returns handle = @java:Method {
    name: "getQueryCache",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_map_IMap_getQueryCache2(handle receiver, handle arg0, handle arg1, handle arg2, boolean arg3) returns handle = @java:Method {
    name: "getQueryCache",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.String", "com.hazelcast.map.listener.MapListener", "com.hazelcast.query.Predicate", "boolean"]
} external;

function com_hazelcast_map_IMap_getQueryCache3(handle receiver, handle arg0, handle arg1, boolean arg2) returns handle = @java:Method {
    name: "getQueryCache",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.String", "com.hazelcast.query.Predicate", "boolean"]
} external;

function com_hazelcast_map_IMap_getServiceName(handle receiver) returns handle = @java:Method {
    name: "getServiceName",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_isEmpty(handle receiver) returns boolean = @java:Method {
    name: "isEmpty",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_isEmpty2(handle receiver) returns boolean = @java:Method {
    name: "isEmpty",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_isLocked(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isLocked",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object"]
} external;

function com_hazelcast_map_IMap_iterator(handle receiver) returns handle = @java:Method {
    name: "iterator",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_iterator2(handle receiver, int arg0) returns handle = @java:Method {
    name: "iterator",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["int"]
} external;

isolated function com_hazelcast_map_IMap_keySet(handle receiver) returns handle = @java:Method {
    name: "keySet",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_keySet2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "keySet",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.query.Predicate"]
} external;

function com_hazelcast_map_IMap_loadAll(handle receiver, boolean arg0) = @java:Method {
    name: "loadAll",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["boolean"]
} external;

function com_hazelcast_map_IMap_loadAll2(handle receiver, handle arg0, boolean arg1) = @java:Method {
    name: "loadAll",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.util.Set", "boolean"]
} external;

function com_hazelcast_map_IMap_localKeySet(handle receiver) returns handle = @java:Method {
    name: "localKeySet",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_localKeySet2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "localKeySet",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.query.Predicate"]
} external;

function com_hazelcast_map_IMap_lock(handle receiver, handle arg0) = @java:Method {
    name: "lock",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object"]
} external;

function com_hazelcast_map_IMap_lock2(handle receiver, handle arg0, int arg1, handle arg2) = @java:Method {
    name: "lock",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "long", "java.util.concurrent.TimeUnit"]
} external;

function com_hazelcast_map_IMap_merge(handle receiver, handle arg0, handle arg1, handle arg2) returns handle = @java:Method {
    name: "merge",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object", "java.util.function.BiFunction"]
} external;

function com_hazelcast_map_IMap_project(handle receiver, handle arg0) returns handle = @java:Method {
    name: "project",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.projection.Projection"]
} external;

function com_hazelcast_map_IMap_project2(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "project",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.projection.Projection", "com.hazelcast.query.Predicate"]
} external;

isolated function com_hazelcast_map_IMap_put(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "put",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object"]
} external;

function com_hazelcast_map_IMap_put2(handle receiver, handle arg0, handle arg1, int arg2, handle arg3) returns handle = @java:Method {
    name: "put",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object", "long", "java.util.concurrent.TimeUnit"]
} external;

function com_hazelcast_map_IMap_put3(handle receiver, handle arg0, handle arg1, int arg2, handle arg3, int arg4, handle arg5) returns handle = @java:Method {
    name: "put",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object", "long", "java.util.concurrent.TimeUnit", "long", "java.util.concurrent.TimeUnit"]
} external;

function com_hazelcast_map_IMap_putAll(handle receiver, handle arg0) = @java:Method {
    name: "putAll",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.util.Map"]
} external;

function com_hazelcast_map_IMap_putAllAsync(handle receiver, handle arg0) returns handle = @java:Method {
    name: "putAllAsync",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.util.Map"]
} external;

function com_hazelcast_map_IMap_putAsync(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "putAsync",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object"]
} external;

function com_hazelcast_map_IMap_putAsync2(handle receiver, handle arg0, handle arg1, int arg2, handle arg3) returns handle = @java:Method {
    name: "putAsync",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object", "long", "java.util.concurrent.TimeUnit"]
} external;

function com_hazelcast_map_IMap_putAsync3(handle receiver, handle arg0, handle arg1, int arg2, handle arg3, int arg4, handle arg5) returns handle = @java:Method {
    name: "putAsync",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object", "long", "java.util.concurrent.TimeUnit", "long", "java.util.concurrent.TimeUnit"]
} external;

function com_hazelcast_map_IMap_putIfAbsent(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "putIfAbsent",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object"]
} external;

function com_hazelcast_map_IMap_putIfAbsent2(handle receiver, handle arg0, handle arg1, int arg2, handle arg3) returns handle = @java:Method {
    name: "putIfAbsent",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object", "long", "java.util.concurrent.TimeUnit"]
} external;

function com_hazelcast_map_IMap_putIfAbsent3(handle receiver, handle arg0, handle arg1, int arg2, handle arg3, int arg4, handle arg5) returns handle = @java:Method {
    name: "putIfAbsent",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object", "long", "java.util.concurrent.TimeUnit", "long", "java.util.concurrent.TimeUnit"]
} external;

function com_hazelcast_map_IMap_putTransient(handle receiver, handle arg0, handle arg1, int arg2, handle arg3) = @java:Method {
    name: "putTransient",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object", "long", "java.util.concurrent.TimeUnit"]
} external;

function com_hazelcast_map_IMap_putTransient2(handle receiver, handle arg0, handle arg1, int arg2, handle arg3, int arg4, handle arg5) = @java:Method {
    name: "putTransient",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object", "long", "java.util.concurrent.TimeUnit", "long", "java.util.concurrent.TimeUnit"]
} external;

function com_hazelcast_map_IMap_remove(handle receiver, handle arg0) returns handle = @java:Method {
    name: "remove",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object"]
} external;

function com_hazelcast_map_IMap_remove2(handle receiver, handle arg0, handle arg1) returns boolean = @java:Method {
    name: "remove",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object"]
} external;

function com_hazelcast_map_IMap_removeAll(handle receiver, handle arg0) = @java:Method {
    name: "removeAll",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.query.Predicate"]
} external;

function com_hazelcast_map_IMap_removeAsync(handle receiver, handle arg0) returns handle = @java:Method {
    name: "removeAsync",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object"]
} external;

function com_hazelcast_map_IMap_removeEntryListener(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "removeEntryListener",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.util.UUID"]
} external;

function com_hazelcast_map_IMap_removeInterceptor(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "removeInterceptor",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.String"]
} external;

function com_hazelcast_map_IMap_removePartitionLostListener(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "removePartitionLostListener",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.util.UUID"]
} external;

function com_hazelcast_map_IMap_replace(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "replace",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object"]
} external;

function com_hazelcast_map_IMap_replace2(handle receiver, handle arg0, handle arg1, handle arg2) returns boolean = @java:Method {
    name: "replace",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object", "java.lang.Object"]
} external;

function com_hazelcast_map_IMap_replaceAll(handle receiver, handle arg0) = @java:Method {
    name: "replaceAll",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.util.function.BiFunction"]
} external;

function com_hazelcast_map_IMap_set(handle receiver, handle arg0, handle arg1) = @java:Method {
    name: "set",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object"]
} external;

function com_hazelcast_map_IMap_set2(handle receiver, handle arg0, handle arg1, int arg2, handle arg3) = @java:Method {
    name: "set",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object", "long", "java.util.concurrent.TimeUnit"]
} external;

function com_hazelcast_map_IMap_set3(handle receiver, handle arg0, handle arg1, int arg2, handle arg3, int arg4, handle arg5) = @java:Method {
    name: "set",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object", "long", "java.util.concurrent.TimeUnit", "long", "java.util.concurrent.TimeUnit"]
} external;

function com_hazelcast_map_IMap_setAll(handle receiver, handle arg0) = @java:Method {
    name: "setAll",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.util.Map"]
} external;

function com_hazelcast_map_IMap_setAllAsync(handle receiver, handle arg0) returns handle = @java:Method {
    name: "setAllAsync",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.util.Map"]
} external;

function com_hazelcast_map_IMap_setAsync(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "setAsync",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object"]
} external;

function com_hazelcast_map_IMap_setAsync2(handle receiver, handle arg0, handle arg1, int arg2, handle arg3) returns handle = @java:Method {
    name: "setAsync",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object", "long", "java.util.concurrent.TimeUnit"]
} external;

function com_hazelcast_map_IMap_setAsync3(handle receiver, handle arg0, handle arg1, int arg2, handle arg3, int arg4, handle arg5) returns handle = @java:Method {
    name: "setAsync",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object", "long", "java.util.concurrent.TimeUnit", "long", "java.util.concurrent.TimeUnit"]
} external;

function com_hazelcast_map_IMap_setTtl(handle receiver, handle arg0, int arg1, handle arg2) returns boolean = @java:Method {
    name: "setTtl",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "long", "java.util.concurrent.TimeUnit"]
} external;

function com_hazelcast_map_IMap_size(handle receiver) returns int = @java:Method {
    name: "size",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_size2(handle receiver) returns int = @java:Method {
    name: "size",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_spliterator(handle receiver) returns handle = @java:Method {
    name: "spliterator",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_submitToKey(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "submitToKey",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "com.hazelcast.map.EntryProcessor"]
} external;

function com_hazelcast_map_IMap_submitToKeys(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "submitToKeys",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.util.Set", "com.hazelcast.map.EntryProcessor"]
} external;

function com_hazelcast_map_IMap_tryLock(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "tryLock",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object"]
} external;

function com_hazelcast_map_IMap_tryLock2(handle receiver, handle arg0, int arg1, handle arg2) returns boolean|error = @java:Method {
    name: "tryLock",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "long", "java.util.concurrent.TimeUnit"]
} external;

function com_hazelcast_map_IMap_tryLock3(handle receiver, handle arg0, int arg1, handle arg2, int arg3, handle arg4) returns boolean|error = @java:Method {
    name: "tryLock",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "long", "java.util.concurrent.TimeUnit", "long", "java.util.concurrent.TimeUnit"]
} external;

function com_hazelcast_map_IMap_tryPut(handle receiver, handle arg0, handle arg1, int arg2, handle arg3) returns boolean = @java:Method {
    name: "tryPut",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "java.lang.Object", "long", "java.util.concurrent.TimeUnit"]
} external;

function com_hazelcast_map_IMap_tryRemove(handle receiver, handle arg0, int arg1, handle arg2) returns boolean = @java:Method {
    name: "tryRemove",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object", "long", "java.util.concurrent.TimeUnit"]
} external;

function com_hazelcast_map_IMap_unlock(handle receiver, handle arg0) = @java:Method {
    name: "unlock",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["java.lang.Object"]
} external;

function com_hazelcast_map_IMap_values(handle receiver) returns handle = @java:Method {
    name: "values",
    'class: "com.hazelcast.map.IMap",
    paramTypes: []
} external;

function com_hazelcast_map_IMap_values2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "values",
    'class: "com.hazelcast.map.IMap",
    paramTypes: ["com.hazelcast.query.Predicate"]
} external;

