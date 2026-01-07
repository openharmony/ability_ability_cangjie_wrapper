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

package ohos.app.ability.ability_stage

import ohos.app.ability.ui_ability.*
import ohos.labels.*

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public open class AbilityStage {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public mut prop context: AbilityStageContext {
        
        get() {
            return AbilityStageContext()
        }
        
        set(_) {}
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public open func onCreate(): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public static func registerCreator(moduleName: String, creator: () -> AbilityStage): Unit {}

    public init() {
        super()
    }
}