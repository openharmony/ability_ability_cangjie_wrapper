/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.application.event_hub

import ohos.labels.APILevel
import ohos.hilog.HilogChannel

import std.collection.{HashMap, ArrayList}
import std.reflect.{TypeInfo, ClassTypeInfo}
import std.sync.ReadWriteLock

let EVENT_HUB_LOG = HilogChannel(0, 0xD002223, "CJ_EVENT_HUB")

/**
 * The event center of a context, support the subscription and publication of events.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class EventHub {
    private var allEvents = HashMap<String, ArrayList<(TypeInfo, Object)>>()
    private let rwLock = ReadWriteLock(fair: true)
    protected init() {}

    /**
     * Subscribe to an event.
     *
     * @param { String } event - Indicates the event.
     * @param { EventObserver<T> } callback - Indicates the callback.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func on<T>(event: String, callback: EventObserver<T>): Unit {
        synchronized(rwLock.writeLock) {
            match (allEvents.get(event)) {
                case Some(array) => 
                    for (item in array) {
                        if (refEq(callback, item[1])) {
                            EVENT_HUB_LOG.warn("The callback has already been registered.")
                            return
                        }
                    }
                    array.add((TypeInfo.of<T>(), callback))
                case None =>
                    let arrayList = ArrayList<(TypeInfo, Object)>()
                    arrayList.add((TypeInfo.of<T>(), callback))
                    allEvents.add(event, arrayList)
            }
        }
    }

    /**
     * Unsubscribe from an event.
     *
     * @param { String } event - Indicates the event.
     * @param { ?EventObserver<T> } [ callback ] - Indicates the callback.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off<T>(event: String, callback: ?EventObserver<T>): Unit {
        synchronized(rwLock.writeLock) {
            match (allEvents.get(event)) {
                case Some(array) =>
                    match (callback) {
                        case Some(cb) => removeByObject(array, cb)
                        case None => removeByTypeInfo<T>(array)
                    }
                case None => EVENT_HUB_LOG.warn("The event does not exist when unregistering.")
            }
        }
    }

    /**
     * Unsubscribe from an event.
     *
     * @param { String } event - Indicates the event.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off(event: String): Unit {
        synchronized(rwLock.writeLock) {
            if (allEvents.remove(event).isNone()) {
                EVENT_HUB_LOG.warn("The event does not exist when unregistering.")
            }
        }
    }

    /**
     * Trigger the event callbacks.
     *
     * @param { String } event - Indicates the event.
     * @param { T } data - Indicates the callback arguments.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func emit<T>(event: String, data: T): Unit {
        synchronized(rwLock.readLock) {
            match (allEvents.get(event)) {
                case Some(array) =>
                    let typeInfo = TypeInfo.of<T>()
                    var hasCallback = false
                    for (item in array) {
                        if (typeInfo == item[0]) {
                            ClassTypeInfo.of(item[1]).getInstanceFunctions("invoke")[0].apply(item[1], data)
                            hasCallback = true
                        }
                    }
                    if (!hasCallback) {
                        EVENT_HUB_LOG.warn("No relative callback exists.")
                    }
                case None => EVENT_HUB_LOG.warn("The event does not exist when emitting.")
            }
        }
    }
}

/**
 * The callback for eventhub events.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class EventObserver<T> {
    let callback: (T) -> Unit

    /**
     * EventObserver constructor.
     *
     * @param { (T) -> Unit } callback - The callback function.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public init(callback: (T) -> Unit) {
        this.callback = callback
    }

    /**
     * Invokes the callback function.
     *
     * @param { T } data - Indicates the callback arguments.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func invoke(data: T): Unit {
        callback(data)
    }
}

func removeByObject(list: ArrayList<(TypeInfo, Object)>, item: Object): Unit {
    var index = -1
    for (i in 0..list.size) {
        if (refEq(item, list[i][1])) {
            index = i
            break
        }
    }
    if (index == -1) {
        EVENT_HUB_LOG.warn("The callback has not been registered.")
        return
    }
    list.remove(at: index)
}

func removeByTypeInfo<T>(list: ArrayList<(TypeInfo, Object)>): Unit {
    var hasType = false
    let typeInfo = TypeInfo.of<T>()
    for (i in 0..list.size) {
        if (typeInfo == list[i][0]) {
            list.remove(at: i)
            hasType = true
        }
    }
    if (!hasType) {
        EVENT_HUB_LOG.warn("The callback has not been registered.")
    }
}
