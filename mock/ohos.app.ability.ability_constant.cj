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

package ohos.app.ability.ability_constant

import ohos.labels.*

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public class LaunchParam {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public var launchReason: LaunchReason

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public var lastExitReason: LastExitReason
    
    public init() {
        super()
        this.launchReason = LaunchReason.Unknown
        this.lastExitReason = LastExitReason.Unknown
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public enum LaunchReason {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    Unknown
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    StartAbility
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    Call
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    Continuation
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    AppRecovery
    | ...
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public enum LastExitReason {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    Unknown
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    Normal
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    CppCrash
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    AppFreeze
    | ...
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public enum OnContinueResult {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    Agree
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    Reject
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    Mismatch
    | ...
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public enum WindowMode {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    WindowModeFullscreen
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    WindowModeSplitPrimary
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    WindowModeSplitSecondary
    | ...
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public enum MemoryLevel {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    MemoryLevelModerate
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    MemoryLevelLow
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    MemoryLevelCritical
    | ...
}

extend MemoryLevel <: ToString {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public func toString(): String {
        return String()
    }
}

extend MemoryLevel <: Equatable<MemoryLevel> {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public operator func ==(other: MemoryLevel): Bool {
        return true
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public operator func !=(other: MemoryLevel): Bool {
        return true
    }
}