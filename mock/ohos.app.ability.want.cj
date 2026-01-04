/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

package ohos.app.ability.want

import ohos.labels.*
import std.collection.*
import ohos.encoding.json.*

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
public class Want {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public var deviceId: String

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public var bundleName: String

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public var abilityName: String

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public var moduleName: String

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public var flags: UInt32

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public var uri: String

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public var action: String

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public var entities: Array<String>

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public var dataType: String

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public var parameters: HashMap<String, WantValueType>

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase", throwexception: true]
    public init(
        deviceId!: String = "",
        bundleName!: String = "",
        abilityName!: String = "",
        moduleName!: String = "",
        flags!: UInt32 = 0,
        uri!: String = "",
        action!: String = "",
        entities!: Array<String> = [],
        dataType!: String = "",
        parameters!: HashMap<String, WantValueType> = HashMap<String, WantValueType>(),
        fds!: HashMap<String, Int32> = HashMap<String, Int32>()
    ) {
        super()
        this.deviceId = String()
        this.bundleName = String()
        this.abilityName = String()
        this.moduleName = String()
        this.flags = 0
        this.uri = String()
        this.action = String()
        this.entities = Array()
        this.dataType = String()
        this.parameters = HashMap()
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
public enum WantValueType {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"] Int64Value(Int64)
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"] Float64Value(Float64)
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"] StringValue(String)
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"] BoolValue(Bool)
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"] ArrayValue(Array<WantValueType>)
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"] HashMapValue(
        HashMap<String, WantValueType>)
    | ...
}

protected func mapToJsonObject(map: HashMap<String, WantValueType>): JsonObject {
    let paramMap = HashMap<String, JsonValue>()
    return JsonObject(paramMap)
}
