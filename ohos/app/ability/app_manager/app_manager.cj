/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

package ohos.app.ability.app_manager

import ohos.labels.APILevel
import ohos.bundle.bundle_manager.BundleType
import ohos.app.ability.ability_utils.{checkCodeAndThrow, ERROR_CODE_INNER}
import ohos.business_exception.BusinessException

import std.deriving.Derive

/**
 * Get information about the current process.
 *
 * @returns { Array<ProcessInformation> } Returns the array of ProcessInformation.
 * @throws { BusinessException } 16000050 - Internal error.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core",
    throwexception: true,
    workerthread: true
]
public func getRunningProcessInformation(): Array<ProcessInformation> {
    var code: Int32 = 0
    unsafe {
        let res = FfiAppMgrGetRunningProcessInformation(inout code)
        checkCodeAndThrow(code)
        let processInformations = res.toArrProcessInformation()
        res.free()
        return processInformations
    }
}

/**
 * The class of an process information.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class ProcessInformation {
    /**
     * Process id.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var pid: Int32

    /**
     * User id.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var uid: Int32

    /**
     * The name of the process.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var processName: String

    /**
     * An array of the bundleNames running in the process.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var bundleNames: Array<String>

    /**
     * The process state.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var state: ProcessState

    /**
     * The bundle type of the process.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var bundleType: BundleType

    /**
     * The process state.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var appCloneIndex: ?Int32

    init(
        pid: Int32,
        uid: Int32,
        processName: String,
        bundleNames: Array<String>,
        state: ProcessState,
        bundleType: BundleType,
        appCloneIndex: Int32
    ) {
        this.pid = pid
        this.uid = uid
        this.processName = processName
        this.bundleNames = bundleNames
        this.state = state
        this.bundleType = bundleType
        this.appCloneIndex = appCloneIndex
    }
}

/**
 * Enum for the process state.
 */
@Derive[ToString, Equatable]
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum ProcessState {
    /**
     * The state that the process is in when it is being created.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    StateCreate
    /**
     * The state in which the process is in when it switches to the foreground.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    StateForeground
    /**
     * The state in which the process is in focus.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    StateActive
    /**
     * The state in which a process is invisible in the background.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    StateBackground
    /**
     * The state that the process is in when it is destroyed.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    StateDestroy
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case StateCreate => 0
                case StateForeground => 1
                case StateActive => 2
                case StateBackground => 3
                case StateDestroy => 4
                case _ => throw BusinessException(ERROR_CODE_INNER, "Internal error.")
            }
        }
    }

    static func parse(value: Int32): ProcessState {
        match (value) {
            case 0 => StateCreate
            case 1 => StateForeground
            case 2 => StateActive
            case 3 => StateBackground
            case 4 => StateDestroy
            case _ => throw BusinessException(ERROR_CODE_INNER, "Internal error.")
        }
    }
}

