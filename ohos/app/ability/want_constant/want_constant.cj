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

package ohos.app.ability.want_constant

import std.deriving.Derive
import ohos.labels.{APILevel, Hide}
import ohos.business_exception.BusinessException

const ERROR_CODE_INNER: Int32 = 16000050

/**
 * The constant for params of the want
 *
 */
@Derive[ToString, Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Ability.AbilityBase"
]
public enum Params {
    /**
     * Indicates the ability in this want can back to the current top ability even though they are not in the same
     * mission stack
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    AbilityBackToOtherMissionStack
    |
    /**
     * Indicates the param of ability failure restart recovery identification
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    AbilityRecoveryRestart
    |
    /**
     * Indicates the param of extra content title
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ContentTitleKey
    |
    /**
     * Indicates the param of extra shared abstract
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ShareAbstractKey
    |
    /**
     * Indicates the param of extra shareURL
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ShareUrlKey
    |
    /**
     * Indicates the param of extra support continue page stack.
     * The default value of the param is true,
     * and the system will automatically flow the page stack information by default.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    SupportContinuePageStackKey
    |
    /**
     * Indicates the param of extra stop source ability on continue.
     * The default value of the param is true,
     * and the system will exit the source application by default.
     *
     * SUPPORT_CONTINUE_SOURCE_EXIT_KEY = 'ohos.extra.param.key.supportContinueSourceExit'
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    SupportContinueSourceExitKey
    |
    @!Hide
    DlpParamsSandbox
    |
    @!Hide
    DlpParamsBundleName
    |
    @!Hide
    DlpParamsModuleName
    |
    @!Hide
    DlpParamsAbilityName
    |
    @!Hide
    DlpParamsIndex
    |
    @!Hide
    HideSensitiveType
    |
    @!Hide
    AssertFaultSessionId
    |
    @!Hide
    ShowModeKey
    |
    @!Hide
    ParamsStream
    |
    @!Hide
    AppCloneIndexKey
    |
    @!Hide
    CallerRequestCode
    |
    @!Hide
    PagePath
    |
    @!Hide
    RouterName
    |
    @!Hide
    PageSourceFile
    |
    @!Hide
    BuildFunction
    |
    @!Hide
    SubPackageName
    |
    @!Hide
    AppInstanceKey
    |
    @!Hide
    CreateAppInstanceKey
    |
    @!Hide
    CallerAppCloneIndex
    |
    @!Hide
    LaunchReasonMessage
    |
    @!Hide
    DestinationPluginAbility
    |
    @!Hide
    AppLaunchTrustlist
    |
    @!Hide
    AbilityUnifiedDataKey
    |
    @!Hide
    AtomicServiceShareRouter
    | ...

    /**
     * get the corresponding mapping value.
     *
     * @returns { String } Returns the corresponding mapping value.
     * @throws { BusinessExecption } 16000050 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public func getValue(): String {
        match (this) {
            case AbilityBackToOtherMissionStack => "ability.params.backToOtherMissionStack"
            case AbilityRecoveryRestart => "ohos.ability.params.abilityRecoveryRestart"
            case ContentTitleKey => "ohos.extra.param.key.contentTitle"
            case ShareAbstractKey => "ohos.extra.param.key.shareAbstract"
            case ShareUrlKey => "ohos.extra.param.key.shareUrl"
            case SupportContinuePageStackKey => "ohos.extra.param.key.supportContinuePageStack"
            case SupportContinueSourceExitKey => "ohos.extra.param.key.supportContinueSourceExit"
            case _ => throw BusinessException(ERROR_CODE_INNER, "Internal error.")
        }
    }
}

/**
 * Used to indicate how Want is handled.
 *
 */
@Derive[ToString, Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Ability.AbilityBase"
]
public enum Flags {
    /**
     * Indicates the grant to perform read operations on the URI.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    FlagAuthReadUriPermission
    |
    /**
     * Indicates the grant to perform write operations on the URI.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    FlagAuthWriteUriPermission
    |
    /**
     * Indicates the grant for possible persisting on the URI.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    FlagAuthPersistableUriPermission
    |
    /**
     * Install the specified ability if it's not installed.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    FlagInstallOnDemand
    |
    /**
     * Indicates that if implicit start ability couldn't match any application, no tip dialog will be pulled up.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    FlagStartWithoutTips
    |
    @!Hide
    FlagAbilityOnCollaborate
    | ...

    /**
     * get the corresponding mapping value.
     *
     * @returns { UInt32 } Returns the corresponding mapping value.
     * @throws { BusinessException } 16000050 - Internal error.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public func getValue(): UInt32 {
        match (this) {
            case FlagAuthReadUriPermission => 0x00000001
            case FlagAuthWriteUriPermission => 0x00000002
            case FlagAuthPersistableUriPermission => 0x00000040
            case FlagInstallOnDemand => 0x00000800
            case FlagStartWithoutTips => 0x40000000
            case _ => throw BusinessException(ERROR_CODE_INNER, "Internal error.")
        }
    }
}
