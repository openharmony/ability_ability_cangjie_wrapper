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

package ohos.app.ability.want_agent

import ohos.labels.{APILevel, Hide}
import ohos.app.ability.want.{Want, WantHandle, WantValueType, mapToJsonObject}
import ohos.app.ability.ability_utils.{ERROR_CODE_INNER, INVALID_PARA, getErrorMsg}
import ohos.business_exception.BusinessException
import ohos.ffi.{RemoteDataLite, releaseFFIData, safeMalloc, CArrI32, SUCCESS_CODE}
import ohos.encoding.json.{jsonObjectWrapper}

import std.deriving.Derive
import std.collection.HashMap

/**
 * Obtains a WantAgent object.
 *
 * @param { WantAgentInfo } info - Information about the WantAgent object to obtain.
 * @returns { WantAgent } Returns the created WantAgent.
 * @throws { BusinessException } 16000007 - Service busy. There are concurrent tasks. Try again later.
 * @throws { BusinessException } 16000151 - Invalid wantAgent object.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core",
    throwexception: true,
    workerthread: true
]
public func getWantAgent(info: WantAgentInfo): WantAgent {
    unsafe {
        var code: Int32 = 0
        let cInfo = info.toCJWantAgentInfo()
        let id = FfiWantAgentGetWantAgent(cInfo, inout code)
        cInfo.free()
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, getErrorMsg(code))
        }
        return WantAgent(id)
    }
}

/**
 * WantAgent object.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class WantAgent <: RemoteDataLite {
    protected init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }
}

/**
 * Provides the information required for triggering a WantAgent.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class WantAgentInfo {
    /**
     * An array of all Wants for starting abilities or sending common events. Only Wants can be displayed.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var wants: Array<Want>

    /**
     * Type of the action specified in a Want.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var actionType: OperationType

    /**
     * Request code defined by the user.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var requestCode: Int32

    /**
     * An array of flags for using the WantAgent.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var actionFlags: Array<WantAgentFlags>

    /**
     * Extra information about how the Want starts an ability.
     * If there is no extra information to set, this constant can be left empty.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var extraInfos: HashMap<String, WantValueType>

    @!Hide
    public var userId: Int32 = -1

    /**
     * WantAgentInfo constructor.
     *
     * @param { Array<Want> } wants - An array of all Wants for starting abilities or sending common events.
     * @param { Int32 } requestCode - Request code defined by the user.
     * @param { OperationType } [ actionType ] - Type of the action specified in a Want.
     * @param { Array<WantAgentFlags> } [ actionFlags ] - An array of flags for using the WantAgent.
     * @param { HashMap<String, WantValueType> } [ extraInfos ] - Extra information about how the Want starts an ability.
     */
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
        this.wants = wants
        this.actionType = actionType
        this.requestCode = requestCode
        this.actionFlags = actionFlags
        this.extraInfos = extraInfos
    }

    unsafe func toCJWantAgentInfo(): CJWantAgentInfo {
        let infoJsonObject = mapToJsonObject(extraInfos)
        if (wants.size == 0) {
            throw BusinessException(INVALID_PARA, getErrorMsg(INVALID_PARA))
        }
        let cArrayWantHandlePtr = LibC.malloc<WantHandle>(count: 1)
        if (cArrayWantHandlePtr.isNull()) {
            throw BusinessException(ERROR_CODE_INNER, getErrorMsg(ERROR_CODE_INNER))
        }
        let handle = wants[0].createWantHandle()
        cArrayWantHandlePtr.write(0, handle)
        let cWantArr = CJWantArr(cArrayWantHandlePtr, 1)
        let cActionFlags = if (actionFlags.size == 0) {
            CArrI32(CPointer<Int32>(), 0)
        } else {
            let cArrayI32Ptr = safeMalloc<Int32>(
                actionFlags.size,
                {
                    =>
                    Want.releaseWantHandle(handle)
                    LibC.free<WantHandle>(cArrayWantHandlePtr)
                }
            )
            for (i in 0..actionFlags.size) {
                cArrayI32Ptr.write(i, actionFlags[i].getValue())
            }
            CArrI32(cArrayI32Ptr, actionFlags.size)
        }
        let cExtraInfos: CString
        try {
            cExtraInfos = LibC.mallocCString(jsonObjectWrapper(infoJsonObject).toString())
        } catch (e: Exception) {
            Want.releaseWantHandle(handle)
            LibC.free<WantHandle>(cArrayWantHandlePtr)
            if (cActionFlags.size != 0) {
                LibC.free<Int32>(cActionFlags.head)
            }
            throw e
        }
        return CJWantAgentInfo(cWantArr, actionType.getValue(), requestCode, cActionFlags, cExtraInfos)
    }
}

/**
 * Enumerates the flags for using a WantAgent.
 */
@Derive[ToString, Equatable]
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum WantAgentFlags {
    /**
     * Indicates that the WantAgent can be used only once.
     * This flag is valid only when OperationType is set to StartAbility, StartService or SendCommonEvent.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    OneTimeFlag
    /**
     * Indicates that exception is throwed if the WantAgent does not exist.
     * This flag is valid only when OperationType is set to StartAbility, StartService or SendCommonEvent.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    NoBuildFlag
    /**
     * Indicates that the existing WantAgent should be canceled before a new object is generated.
     * This flag is valid only when OperationType is set to StartAbility, StartService or SendCommonEvent.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    CancelPresentFlag
    /**
     * Indicates that the system only replaces the extra data of existing WantAgent with that of the new object.
     * This flag is valid only when OperationType is set to StartAbility, StartService or SendCommonEvent.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    UpdatePresentFlag
    /**
     * Indicates that the created WantAgent should be immutable.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ConstantFlag
    /**
     * Indicates that the current value of element can be replaced when the WantAgent is triggered.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ReplaceElement
    /**
     * Indicates that the current value of action can be replaced when the WantAgent is triggered.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ReplaceAction
    /**
     * Indicates that the current value of uri can be replaced when the WantAgent is triggered.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ReplaceUri
    /**
     * Indicates that the current value of entities can be replaced when the WantAgent is triggered.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ReplaceEntities
    /**
     * Indicates that the current value of packageName can be replaced when the WantAgent is triggered.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ReplaceBundle
    | ...

    func getValue(): Int32 {
        match (this) {
            case OneTimeFlag => 0
            case NoBuildFlag => 1
            case CancelPresentFlag => 2
            case UpdatePresentFlag => 3
            case ConstantFlag => 4
            case ReplaceElement => 5
            case ReplaceAction => 6
            case ReplaceUri => 7
            case ReplaceEntities => 8
            case ReplaceBundle => 9
            case _ => throw BusinessException(ERROR_CODE_INNER, "Internal error.")
        }
    }
}

/**
 * Identifies the operation for using a WantAgent, such as starting an ability or sending a common event.
 */
@Derive[ToString, Equatable]
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum OperationType {
    /**
     * Unknown operation.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    UnknownType
    /**
     * Starts an ability with a UI.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    StartAbility
    /**
     * Starts multiple abilities with a UI.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    StartAbilities
    /**
     * Starts an ability without a UI.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    StartService
    /**
     * Sends a common event.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    SendCommonEvent
    | ...

    func getValue(): Int32 {
        match (this) {
            case UnknownType => 0
            case StartAbility => 1
            case StartAbilities => 2
            case StartService => 3
            case SendCommonEvent => 4
            case _ => throw BusinessException(ERROR_CODE_INNER, "Internal error.")
        }
    }

    static func parse(code: Int32) {
        match (code) {
            case 1 => StartAbility
            case 2 => StartAbilities
            case 3 => StartService
            case 4 => SendCommonEvent
            case _ => UnknownType
        }
    }
}