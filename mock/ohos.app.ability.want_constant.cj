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

package ohos.app.ability.want_constant

import ohos.labels.APILevel

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
public class Params {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public static const ABILITY_BACK_TO_OTHER_MISSION_STACK: String = "ability.params.backToOtherMissionStack"

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public static const ABILITY_RECOVERY_RESTART: String = "ohos.ability.params.abilityRecoveryRestart"

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public static const CONTENT_TITLE_KEY: String = "ohos.extra.param.key.contentTitle"

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public static const SHARE_ABSTRACT_KEY: String = "ohos.extra.param.key.shareAbstract"

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public static const SHARE_URL_KEY: String = "ohos.extra.param.key.shareUrl"

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public static const SUPPORT_CONTINUE_PAGE_STACK_KEY: String = "ohos.extra.param.key.supportContinuePageStack"

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public static const SUPPORT_CONTINUE_SOURCE_EXIT_KEY: String = "ohos.extra.param.key.supportContinueSourceExit"
    
    public init() {
        super()
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
public class Flags {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public static const FLAG_AUTH_READ_URI_PERMISSION: UInt32 = 0x00000001

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public static const FLAG_AUTH_WRITE_URI_PERMISSION: UInt32 = 0x00000002

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public static const FLAG_AUTH_PERSISTABLE_URI_PERMISSION: UInt32 = 0x00000040

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public static const FLAG_INSTALL_ON_DEMAND: UInt32 = 0x00000800

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public static const FLAG_START_WITHOUT_TIPS: UInt32 = 0x40000000
    
    public init() {
        super()
    }
}