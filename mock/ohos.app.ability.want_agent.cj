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

package ohos.app.ability.want_agent

import ohos.app.ability.ability_utils.*
import ohos.app.ability.want.*
import ohos.business_exception.BusinessException
import ohos.encoding.json.*
import ohos.ffi.*
import ohos.labels.*
import std.collection.HashMap

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core",
    throwexception: true,
    workerthread: true
]
public func getWantAgent(info: WantAgentInfo): WantAgent {
    return WantAgent()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class WantAgent {
    
    public init() {
        super()
    }
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class WantAgentInfo {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var wants: Array<Want>

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var actionType: OperationType

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var requestCode: Int32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var actionFlags: Array<WantAgentFlags>

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var extraInfos: HashMap<String, WantValueType>

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public init(
        wants: Array<Want>,
        requestCode: Int32,
        actionType!: OperationType = OperationType.UnknownType,
        actionFlags!: Array<WantAgentFlags> = Array<WantAgentFlags>(),
        extraInfos!: HashMap<String, WantValueType> = HashMap<String, WantValueType>()
    ) {
        super()
        this.wants = Array()
        this.actionType = OperationType.UnknownType
        this.requestCode = 0
        this.actionFlags = Array()
        this.extraInfos = HashMap()
    }
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum WantAgentFlags {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    OneTimeFlag
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    NoBuildFlag
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    CancelPresentFlag
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    UpdatePresentFlag
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ConstantFlag
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ReplaceElement
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ReplaceAction
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ReplaceUri
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ReplaceEntities
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ReplaceBundle
    | ...
}

extend WantAgentFlags <: ToString {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func toString(): String {
        return String()
    }
}

extend WantAgentFlags <: Equatable<WantAgentFlags> {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public operator func ==(other: WantAgentFlags): Bool {
        return true
    }

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public operator func !=(other: WantAgentFlags): Bool {
        return true
    }
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum OperationType {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    UnknownType
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    StartAbility
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    StartAbilities
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    SendCommonEvent
    | ...
}

extend OperationType <: ToString {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func toString(): String {
        return String()
    }
}

extend OperationType <: Equatable<OperationType> {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public operator func ==(other: OperationType): Bool {
        return true
    }

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public operator func !=(other: OperationType): Bool {
        return true
    }
}
