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

package ohos.app.ability.configuration

import ohos.labels.{Hide, APILevel}
import ohos.app.ability.configuration_constant.{ColorMode, Direction, ScreenDensity}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityBase"
]
public class Configuration {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var language: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var colorMode: ColorMode

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var direction: Direction

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var screenDensity: ScreenDensity

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var displayId: Int32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var hasPointerDevice: Bool

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var fontSizeScale: Float64

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var fontWeightScale: Float64

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var mcc: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var mnc: String

    public init(
        language!: ?String = None,
        colorMode!: ?ColorMode = None,
        direction!: ?Direction = None,
        screenDensity!: ?ScreenDensity = None,
        displayId!: ?Int32 = None,
        hasPointerDevice!: ?Bool = None,
        fontSizeScale!: ?Float64 = None,
        fontWeightScale!: ?Float64 = None,
        mcc!: ?String = None,
        mnc!: ?String = None
    ) {
        this.language = language.getOrThrow()
        this.colorMode = colorMode.getOrThrow()
        this.direction = direction.getOrThrow()
        this.screenDensity = screenDensity.getOrThrow()
        this.displayId = displayId.getOrThrow()
        this.hasPointerDevice = hasPointerDevice.getOrThrow()
        this.fontSizeScale = fontSizeScale.getOrThrow()
        this.fontWeightScale = fontWeightScale.getOrThrow()
        this.mcc = mcc.getOrThrow()
        this.mnc = mnc.getOrThrow()
    }
}