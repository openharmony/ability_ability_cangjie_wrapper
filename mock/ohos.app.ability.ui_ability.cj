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

package ohos.app.ability.ui_ability

import ohos.ability.ability_result.*
import ohos.app.ability.BaseContext
import ohos.app.ability.ability_constant.*
import ohos.app.ability.configuration.*
import ohos.app.ability.context_constant.*
import ohos.app.ability.dialog_request.*
import ohos.app.ability.start_options.*
import ohos.app.ability.want.*
import ohos.ark_interop.*
import ohos.bundle.bundle_manager.*
import ohos.business_exception.AsyncCallback
import ohos.labels.*
import ohos.resource_manager.*
import ohos.window.*
import std.collection.*
import ohos.ark_interop_helper.*
import ohos.ffi.FFIData

type StageContext = CPointer<Unit>

protected func getStageContext(abilityContext: UIAbilityContext): StageContext {
    CPointer<Unit>()
}



@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.AbilityCore"]
abstract sealed class Ability <: FFIData {
    
    public init() {
        super()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.AbilityCore"]
    public static func registerCreator(name: String, creator: () -> Ability): Unit {}
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public class AbilityStageContext <: Context {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public var currentHapModuleInfo: HapModuleInfo
    
    public init() {
        super()
        this.currentHapModuleInfo = HapModuleInfo()
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public class ApplicationContext <: Context {
    
    public init() {
        super()
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public open class Context <: BaseContext {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public prop resourceManager: ResourceManager {
        
        get() {
            return ResourceManager()
        }
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public prop applicationInfo: ApplicationInfo {
        
        get() {
            return ApplicationInfo()
        }
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public prop filesDir: String {
        
        get() {
            return String()
        }
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public mut prop area: AreaMode {
        
        get() {
            return AreaMode.El1
        }
        
        set(_) {}
    }
    
    public init() {
        super()
    }
}

extend Context <: SystemObjectInteropTypeToJS {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public func toJSValue(context: JSContext): JSValue {
        return JSValue(context, napiValueToArkTsValue(CPointer<Unit>()))
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public func createUIAbilityContextFromJSValue(context: JSContext, input: JSValue): UIAbilityContext {
    return UIAbilityContext()
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public func createAbilityStageContextFromJSValue(context: JSContext, input: JSValue): AbilityStageContext {
    return AbilityStageContext()
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public func createApplicationContextFromJSValue(context: JSContext, input: JSValue): ApplicationContext {
    return ApplicationContext()
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public func createContextFromJSValue(context: JSContext, input: JSValue): Context {
    return Context()
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public interface SystemObjectInteropTypeToJS {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    func toJSValue(context: JSContext): JSValue
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.AbilityCore"]
public open class UIAbility <: Ability {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.AbilityCore"]
    public mut prop context: UIAbilityContext {
        
        get() {
            return UIAbilityContext()
        }
        
        set(_) {}
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.AbilityCore"]
    public mut prop launchWant: Want {
        
        get() {
            return Want(
                deviceId: String(),
                bundleName: String(),
                abilityName: String(),
                moduleName: String(),
                flags: 0,
                uri: String(),
                action: String(),
                entities: Array(),
                dataType: String(),
                parameters: HashMap(),
                fds: HashMap()
            )
        }
        
        set(_) {}
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.AbilityCore"]
    public mut prop lastRequestWant: Want {
        
        get() {
            return Want(
                deviceId: String(),
                bundleName: String(),
                abilityName: String(),
                moduleName: String(),
                flags: 0,
                uri: String(),
                action: String(),
                entities: Array(),
                dataType: String(),
                parameters: HashMap(),
                fds: HashMap()
            )
        }
        
        set(_) {}
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.AbilityCore"]
    public open func onCreate(want: Want, launchParam: LaunchParam): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.AbilityCore"]
    public open func onWindowStageCreate(windowStage: WindowStage): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.AbilityCore"]
    public open func onWindowStageDestroy(): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.AbilityCore"]
    public open func onDestroy(): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.AbilityCore"]
    public open func onForeground(): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.AbilityCore"]
    public open func onBackground(): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.AbilityCore"]
    public open func onNewWant(want: Want, launchParam: LaunchParam): Unit {
        return ()
    }
    
    public init() {
        super()
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public open class UIAbilityContext <: Context {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", throwexception: true, workerthread: true]
    public func startAbility(want: Want, options!: ?StartOptions = None): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", throwexception: true, workerthread: true]
    public func terminateSelf(): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", throwexception: true, workerthread: true]
    public func terminateSelfWithResult(parameter: AbilityResult): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", throwexception: true]
    public func isTerminating(): Bool {
        return true
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", throwexception: true]
    public func startAbilityForResult(want: Want, callback: AsyncCallback<AbilityResult>): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", throwexception: true]
    public func startAbilityForResult(want: Want, options: StartOptions, callback: AsyncCallback<AbilityResult>): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core", throwexception: true]
    public func requestDialogService(want: Want, result: AsyncCallback<RequestResult>): Unit {
        return ()
    }
    
    public init() {
        super()
    }
}