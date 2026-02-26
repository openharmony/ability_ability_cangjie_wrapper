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

package ohos.app.ability.app_manager

import ohos.app.ability.ability_utils.*
import ohos.bundle.bundle_manager.BundleType
import ohos.business_exception.BusinessException
import ohos.ffi.*
import ohos.labels.APILevel

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core",
    throwexception: true,
    workerthread: true
]
public func getRunningProcessInformation(): Array<ProcessInformation> {
    return Array()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class ProcessInformation {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var pid: Int32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var uid: Int32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var processName: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var bundleNames: Array<String>

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var state: ProcessState

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var bundleType: BundleType

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var appCloneIndex: ?Int32
    
    public init() {
        super()
        this.pid = 0
        this.uid = 0
        this.processName = String()
        this.bundleNames = Array()
        this.state = ProcessState.StateCreate
        this.bundleType = BundleType.App
        this.appCloneIndex = None
    }
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum ProcessState {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    StateCreate
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    StateForeground
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    StateActive
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    StateBackground
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    StateDestroy
    | ...
}

extend ProcessState <: ToString {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func toString(): String {
        return String()
    }
}

extend ProcessState <: Equatable<ProcessState> {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public operator func ==(other: ProcessState): Bool {
        return true
    }

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public operator func !=(other: ProcessState): Bool {
        return true
    }
}
