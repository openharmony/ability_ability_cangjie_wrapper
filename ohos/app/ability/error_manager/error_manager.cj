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

package ohos.app.ability.error_manager

public import ohos.application.error_observer.*
import ohos.application.error_observer.*
import ohos.labels.*
import ohos.business_exception.BusinessException

foreign func FfiOHOSErrorManagerOn(eventType: CString, observer: CErrorObserver): RetDataI32

foreign func FfiOHOSErrorManagerOff(offType: CString, observerId: Int32): Int32

foreign func FfiOHOSErrorManagerLoopObserverOff(): Int32

const SUCCESS_CODE: Int32 = 0
const EXCEPTION_PARAMCHECK: Int32 = 401
const CALLER_ERROR: Int32 = 16200001
const PARAM_INVALID_ERR_MSG: String = "Parameter error: The timeout cannot be less than 0."
const CALLER_ERROR_ERR_MSG: String = "Caller error. Caller from non-main thread."

/**
* Error manager event type.
*/
@!APILevel[
    22,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum ErrorManagerEvent {
    /**
     * Error event.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    Error
    | ...

    func getValue(): String {
        match (this) {
            case Error => "error"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * This module provides the function of error manager.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class ErrorManager {
    protected init() {}
    /**
    * Register error observer.
    *
    * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
    * 2. Incorrect parameter types; 3. Parameter verification failed.
    * @throws { BusinessException } 16000003 - The specified ID does not exist.
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public static func on(eventType: ErrorManagerEvent, observer: ErrorObserver): Int32 {
        let eventTypeValue = eventType.getValue()
        if (eventTypeValue != "error") {
            throw BusinessException(EXCEPTION_PARAMCHECK, getErrorInfo(EXCEPTION_PARAMCHECK))
        }
        let cOnType = unsafe { LibC.mallocCString(eventTypeValue) }
        try {
            let cObserver = unsafe { CErrorObserver(observer) }
            let res = unsafe { FfiOHOSErrorManagerOn(cOnType, cObserver) }
            match {
                case res.code == SUCCESS_CODE => return res.data
                case _ =>
                    ABILITY_LOG.error(getErrorInfo(res.code))
                    throw BusinessException(res.code, getErrorInfo(res.code))
            }
        } finally {
            unsafe { LibC.free(cOnType) }
        }
    }

    /**
    * Unregister error observer.
    *
    * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
    * 2. Incorrect parameter types; 3. Parameter verification failed.
    * @throws { BusinessException } 16000003 - The specified ID does not exist.
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public static func off(eventType: ErrorManagerEvent, observerId: Int32): Unit {
        let eventTypeValue = eventType.getValue()
        if (eventTypeValue != "error") {
            throw BusinessException(EXCEPTION_PARAMCHECK, getErrorInfo(EXCEPTION_PARAMCHECK))
        }
        let cOffType = unsafe { LibC.mallocCString(eventTypeValue) }
        let res = unsafe { FfiOHOSErrorManagerOff(cOffType, observerId) }
        unsafe { LibC.free(cOffType) }
        match {
            case res == SUCCESS_CODE => return
            case _ =>
                ABILITY_LOG.error(getErrorInfo(res))
                throw BusinessException(res, getErrorInfo(res))
        }
    }
}
