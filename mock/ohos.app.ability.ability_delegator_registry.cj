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

package ohos.app.ability.ability_delegator_registry

import ohos.app.ability.ability_stage.AbilityStage
import ohos.app.ability.ui_ability.{Context, UIAbility}
import ohos.app.ability.want.Want
import ohos.labels.APILevel
import std.collection.HashMap

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public enum AbilityLifecycleState {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    Uninitialized
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    Create
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    Foreground
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    Background
    | @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    Destroy
    | ...
}

extend AbilityLifecycleState <: ToString {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public func toString(): String {
        return String()
    }
}

extend AbilityLifecycleState <: Equatable<AbilityLifecycleState> {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public operator func ==(other: AbilityLifecycleState): Bool {
        return true
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public operator func !=(other: AbilityLifecycleState): Bool {
        return true
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public class AbilityDelegatorRegistry {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public static func getAbilityDelegator(): AbilityDelegator {
        return AbilityDelegator()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public static func getArguments(): AbilityDelegatorArgs {
        return AbilityDelegatorArgs()
    }
    
    public init() {
        super()
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public class ShellCmdResult {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public mut prop exitCode: Int32 {
        
        get() {
            return 0
        }
        
        set(_) {}
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public mut prop stdResult: String {
        
        get() {
            return String()
        }
        
        set(_) {}
    }
    
    public init() {
        super()
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public class AbilityDelegator {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", throwexception: true, workerthread: true]
    public func startAbility(want: Want): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", workerthread: true]
    public func executeShellCommand(cmd: String, timeoutSecs!: Int64 = 0): ShellCmdResult {
        return ShellCmdResult()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public func getAppContext(): Context {
        return Context()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", workerthread: true]
    public func finishTest(msg: String, code: Int64): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", throwexception: true, workerthread: true]
    public func addAbilityMonitor(monitor: AbilityMonitor): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", throwexception: true, workerthread: true]
    public func removeAbilityMonitor(monitor: AbilityMonitor): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", throwexception: true, workerthread: true]
    public func waitAbilityMonitor(monitor: AbilityMonitor, timeout!: Int64 = 5000): UIAbility {
        return UIAbility()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", throwexception: true, workerthread: true]
    public func addAbilityStageMonitor(monitor: AbilityStageMonitor): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", throwexception: true, workerthread: true]
    public func removeAbilityStageMonitor(monitor: AbilityStageMonitor): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", throwexception: true, workerthread: true]
    public func waitAbilityStageMonitor(monitor: AbilityStageMonitor, timeout!: Int64 = 5000): AbilityStage {
        return AbilityStage()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", workerthread: true]
    public func print(msg: String): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public func getAbilityState(ability: UIAbility): AbilityLifecycleState {
        return AbilityLifecycleState.Uninitialized
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", throwexception: true, workerthread: true]
    public func getCurrentTopAbility(): UIAbility {
        return UIAbility()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", throwexception: true, workerthread: true]
    public func doAbilityForeground(ability: UIAbility): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", throwexception: true, workerthread: true]
    public func doAbilityBackground(ability: UIAbility): Unit {
        return ()
    }
    
    public init() {
        super()
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public class AbilityDelegatorArgs {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public mut prop bundleName: String {
        
        get() {
            return String()
        }
        
        set(_) {}
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public mut prop parameters: HashMap<String, String> {
        
        get() {
            return HashMap()
        }
        
        set(_) {}
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public mut prop testCaseNames: String {
        
        get() {
            return String()
        }
        
        set(_) {}
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public mut prop testRunnerClassName: String {
        
        get() {
            return String()
        }
        
        set(_) {}
    }
    
    public init() {
        super()
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public class AbilityMonitor {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public var abilityName: String

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public var moduleName: String

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public var onAbilityCreate: ?(UIAbility) -> Unit

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public var onAbilityForeground: ?(UIAbility) -> Unit

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public var onAbilityBackground: ?(UIAbility) -> Unit

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public var onAbilityDestroy: ?(UIAbility) -> Unit

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public var onWindowStageCreate: ?(UIAbility) -> Unit

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public var onWindowStageRestore: ?(UIAbility) -> Unit

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public var onWindowStageDestroy: ?(UIAbility) -> Unit

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public init(
        abilityName: String,
        moduleName!: String = "",
        onAbilityCreate!: ?(UIAbility) -> Unit = None,
        onAbilityForeground!: ?(UIAbility) -> Unit = None,
        onAbilityBackground!: ?(UIAbility) -> Unit = None,
        onAbilityDestroy!: ?(UIAbility) -> Unit = None,
        onWindowStageCreate!: ?(UIAbility) -> Unit = None,
        onWindowStageRestore!: ?(UIAbility) -> Unit = None,
        onWindowStageDestroy!: ?(UIAbility) -> Unit = None
    ) {
        super()
        this.abilityName = String()
        this.moduleName = String()
        this.onAbilityCreate = None
        this.onAbilityForeground = None
        this.onAbilityBackground = None
        this.onAbilityDestroy = None
        this.onWindowStageCreate = None
        this.onWindowStageRestore = None
        this.onWindowStageDestroy = None
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public class AbilityStageMonitor {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public var moduleName: String

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public var srcEntrance: String

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public init(
        moduleName: String,
        srcEntrance: String
    ) {
        super()
        this.moduleName = String()
        this.srcEntrance = String()
    }
}