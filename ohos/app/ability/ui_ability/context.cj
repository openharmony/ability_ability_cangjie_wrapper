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

package ohos.app.ability.ui_ability

import ohos.app.ability.BaseContext
import ohos.app.ability.context_constant.*
import ohos.ffi.*
import ohos.resource_manager.*
import ohos.bundle.bundle_manager.*
import ohos.application.event_hub.*
import ohos.labels.*

foreign {
    func FfiContextGetContext(id: Int64, contextType: Int32): CPointer<Unit>

    func FfiContextGetApplicationInfo(id: Int64, contextType: Int32): RetApplicationInfoV2

    func FfiContextGetFilesDir(id: Int64, contextType: Int32): CString

    func FfiContextGetCacheDir(id: Int64, contextType: Int32): CString

    func FfiContextGetTempDir(id: Int64, contextType: Int32): CString

    func FfiContextGetResourceDir(id: Int64, contextType: Int32): CString

    func FfiContextGetDatabaseDir(id: Int64, contextType: Int32): CString

    func FfiContextGetPreferencesDir(id: Int64, contextType: Int32): CString

    func FfiContextGetBundleCodeDir(id: Int64, contextType: Int32): CString

    func FfiContextGetDistributedFilesDir(id: Int64, contextType: Int32): CString

    func FfiContextGetCloudFileDir(id: Int64, contextType: Int32): CString

    func FfiContextGetArea(id: Int64, contextType: Int32): Int32

    func FfiContextSwitchArea(id: Int64, mode: Int32): Unit

    func FfiContextGetApplicationContext(): Int64

    func FfiContextGetGroupDir(id: Int64, contextType: Int32, groupId: CString): CString

    func FfiContextCreateModuleContext(id: Int64, contextType: Int32, moduleName: CString): Int64
}

class ContextImpl {}

/**
 * The Context module, inherited frome BaseContext, provides context for abilities or applications, including
 * access to application-specific resources.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public open class Context <: BaseContext {
    private var resourceManager_: ?ResourceManager = None
    private var applicationInfo_: ?ApplicationInfo = None
    private var processName_: ?String = None
    private static var applicationContext_: ?ApplicationContext = None
    private var eventHub: EventHub = EventHub()
    private let impl_: ContextImpl = ContextImpl()

    init(id: Int64) {
        super(id, true)
    }

    /**
     * Object for resource management.
     *
     * @returns { ResourceManager } Returns the Object for resource management.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop resourceManager: ResourceManager {
        get() {
            match (resourceManager_) {
                case Some(v) => v
                case _ =>
                    let ctx = unsafe { FfiContextGetContext(getID(), 0) }
                    resourceManager_ = ResourceManager.getResourceManager(ctx)
                    resourceManager_.getOrThrow()
            }
        }
    }

    /**
     * Application information.
     *
     * @returns { ApplicationInfo } Returns the Application information.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop applicationInfo: ApplicationInfo {
        get() {
            match (applicationInfo_) {
                case Some(v) => v
                case _ => unsafe {
                    let retApplicationInfo = FfiContextGetApplicationInfo(getID(), 0)
                    applicationInfo_ = ApplicationInfo(retApplicationInfo)
                    retApplicationInfo.free()
                    return applicationInfo_.getOrThrow()
                }
            }
        }
    }

    /**
     * File directory.
     *
     * @returns { String } Returns the file directory.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop filesDir: String {
        get() {
            var filesDir_ = ""
            unsafe {
                let cString = FfiContextGetFilesDir(getID(), 0)
                filesDir_ = cString.toString()
                LibC.free(cString)
            }
            return filesDir_
        }
    }

    /**
     * Encryption level of the directory.
     *
     * @returns { AreaMode } Returns the encryption level of the directory.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public mut prop area: AreaMode {
        get() {
            let areaCode = unsafe {
                FfiContextGetArea(getID(), 0)
            }
            return AreaMode.parse(areaCode)
        }
        set(value) {
            let modeValue = value.getValue()
            unsafe {
                FfiContextSwitchArea(getID(), modeValue)
            }
        }
    }
}
