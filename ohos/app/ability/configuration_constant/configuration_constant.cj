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

package ohos.app.ability.configuration_constant

import ohos.labels.APILevel
import ohos.business_exception.BusinessException

import std.deriving.Derive

const ERROR_CODE_INNER: Int32 = 16000050

/**
 * Color mode.
 */
@Derive[ToString, Equatable]
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityBase"
]
public enum ColorMode {
    /**
     * The color mode is not set.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ColorModeNotSet
    /**
     * Dark mode.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ColorModeDark
    /**
     * Light mode.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ColorModeLight
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case ColorModeNotSet => -1
                case ColorModeDark => 0
                case ColorModeLight => 1
                case _ => throw BusinessException(ERROR_CODE_INNER, "Internal error.")
            }
        }
    }

    static func parse(value: Int32): ColorMode {
        match (value) {
            case 0 => ColorModeDark
            case 1 => ColorModeLight
            case _ => ColorModeNotSet
        }
    }
}

/**
 * Screen direction.
 */
@Derive[ToString, Equatable]
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityBase"
]
public enum Direction {
    /**
     * The direction is not set.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    DirectionNotSet
    /**
     * Vertical direction.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    DirectionVertical
    /**
     * Vertical direction.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    DirectionHorizontal
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case DirectionNotSet => -1
                case DirectionVertical => 0
                case DirectionHorizontal => 1
                case _ => throw BusinessException(ERROR_CODE_INNER, "Internal error.")
            }
        }
    }

    static func parse(value: Int32): Direction {
        match (value) {
            case 0 => DirectionVertical
            case 1 => DirectionHorizontal
            case _ => DirectionNotSet
        }
    }
}

/**
 * Screen density
 */
@Derive[ToString, Equatable]
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityBase"
]
public enum ScreenDensity {
    /**
     * The screen pixel density is not set.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ScreenDensityNotSet
    /**
     * Screen pixel density is 'SDPI'
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ScreenDensitySdpi
    /**
     * Screen pixel density is 'MDPI'
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ScreenDensityMdpi
    /**
     * Screen pixel density is 'LDPI'
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ScreenDensityLdpi
    /**
     * Screen pixel density is 'XLDPI'
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ScreenDensityXldpi
    /**
     * Screen pixel density is 'XXLDPI'
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ScreenDensityXxldpi
    /**
     * Screen pixel density is 'XXXLDPI'
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    ScreenDensityXxxldpi
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case ScreenDensityNotSet => 0
                case ScreenDensitySdpi => 120
                case ScreenDensityMdpi => 160
                case ScreenDensityLdpi => 240
                case ScreenDensityXldpi => 320
                case ScreenDensityXxldpi => 480
                case ScreenDensityXxxldpi => 640
                case _ => throw BusinessException(ERROR_CODE_INNER, "Internal error.")
            }
        }
    }

    static func parse(value: Int32): ScreenDensity {
        match (value) {
            case 120 => ScreenDensitySdpi
            case 160 => ScreenDensityMdpi
            case 240 => ScreenDensityLdpi
            case 320 => ScreenDensityXldpi
            case 480 => ScreenDensityXxldpi
            case 640 => ScreenDensityXxxldpi
            case _ => ScreenDensityNotSet
        }
    }
}
