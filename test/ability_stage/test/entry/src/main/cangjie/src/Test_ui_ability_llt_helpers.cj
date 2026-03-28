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

package ohos_app_cangjie_entry

import ohos.app.ability.ui_ability.{UIAbility, UIAbilityContext, Context, AbilityStageContext, ApplicationContext}
import ohos.app.ability.want.Want
import ohos.app.ability.ability_constant.LaunchParam
import ohos.ark_interop.*
import ohos.window.WindowStage

class TestUIAbility <: UIAbility {
    var onCreateCalled = false
    var onDestroyCalled = false
    var onForegroundCalled = false
    var onBackgroundCalled = false
    var onWindowStageCreateCalled = false
    var onWindowStageDestroyCalled = false
    var onNewWantCalled = false
    var lastWant: ?Want = None
    var lastLaunchParam: ?LaunchParam = None

    public open func onCreate(want: Want, launchParam: LaunchParam): Unit {
        onCreateCalled = true
        lastWant = want
        lastLaunchParam = launchParam
    }

    public open func onDestroy(): Unit {
        onDestroyCalled = true
    }

    public open func onForeground(): Unit {
        onForegroundCalled = true
    }

    public open func onBackground(): Unit {
        onBackgroundCalled = true
    }

    public open func onWindowStageCreate(windowStage: WindowStage): Unit {
        onWindowStageCreateCalled = true
    }

    public open func onWindowStageDestroy(): Unit {
        onWindowStageDestroyCalled = true
    }

    public open func onNewWant(want: Want, launchParam: LaunchParam): Unit {
        onNewWantCalled = true
        lastWant = want
        lastLaunchParam = launchParam
    }
}

func getTestAbility(): TestUIAbility {
    return TestUIAbility()
}
