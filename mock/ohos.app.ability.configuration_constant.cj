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

package ohos.app.ability.configuration_constant

import ohos.business_exception.BusinessException
import ohos.labels.APILevel

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityBase"
]
public enum ColorMode {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ColorModeNotSet
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ColorModeDark
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ColorModeLight
    | ...
}

extend ColorMode <: ToString {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public func toString(): String {
        return String()
    }
}

extend ColorMode <: Equatable<ColorMode> {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public operator func ==(other: ColorMode): Bool {
        return true
    }

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public operator func !=(other: ColorMode): Bool {
        return true
    }
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityBase"
]
public enum Direction {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    DirectionNotSet
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    DirectionVertical
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    DirectionHorizontal
    | ...
}

extend Direction <: ToString {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public func toString(): String {
        return String()
    }
}

extend Direction <: Equatable<Direction> {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public operator func ==(other: Direction): Bool {
        return true
    }

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public operator func !=(other: Direction): Bool {
        return true
    }
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityBase"
]
public enum ScreenDensity {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ScreenDensityNotSet
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ScreenDensitySdpi
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ScreenDensityMdpi
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ScreenDensityLdpi
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ScreenDensityXldpi
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ScreenDensityXxldpi
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ScreenDensityXxxldpi
    | ...
}

extend ScreenDensity <: ToString {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public func toString(): String {
        return String()
    }
}

extend ScreenDensity <: Equatable<ScreenDensity> {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public operator func ==(other: ScreenDensity): Bool {
        return true
    }

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public operator func !=(other: ScreenDensity): Bool {
        return true
    }
}
