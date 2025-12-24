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

package ohos.app.ability.configuration

import ohos.labels.{Hide, APILevel}
import ohos.app.ability.configuration_constant.{ColorMode, Direction, ScreenDensity}

/**
 * configuration item.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityBase"
]
public class Configuration {
    /**
     * Indicates the current language of the application.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var language: String

    /**
     * Indicates the current colorMode of the application.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var colorMode: ColorMode

    /**
     * Indicates the screen direction of the current device.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var direction: Direction

    /**
     * Indicates the screen density of the current device.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var screenDensity: ScreenDensity

    /**
     * Indicates the displayId of the current device.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var displayId: Int32

    /**
     * Indicates whether a pointer type device has connected.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var hasPointerDevice: Bool

    /**
     * Indicates the font id.
     */
    @!Hide
    public var fontId: String = ""

    /**
     * Indicates the font size scale.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var fontSizeScale: Float64

    /**
     * Indicates the font weight scale.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var fontWeightScale: Float64

    /**
     * Indicates the mobile country code.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var mcc: String

    /**
     * Indicates the mobile network code.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var mnc: String
    
    @!Hide
    var locale: Locale = Locale()

    protected init(
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

@C
protected struct CConfiguration {
    protected CConfiguration(
        var language: CString,
        var colorMode: Int32,
        var direction: Int32,
        var screenDensity: Int32,
        var displayId: Int32,
        var hasPointerDevice: Bool,
        var fontSizeScale: Float64,
        var fontWeightScale: Float64,
        var mcc: CString,
        var mnc: CString
    ) {}

    protected init() {
        language = CString(CPointer())
        colorMode = 0
        direction = 0
        screenDensity = 0
        displayId = 0
        hasPointerDevice = false
        fontSizeScale = 0.0
        fontWeightScale = 0.0
        mcc = CString(CPointer())
        mnc = CString(CPointer())
    }

    protected unsafe func free(): Unit {
        LibC.free(language)
        LibC.free(mcc)
        LibC.free(mnc)
    }
}

@C
protected struct CJConfiguration {
    protected CJConfiguration(
        let isValid: Bool,
        let language: CString,
        let colorMode: Int32,
        let direction: Int32,
        let screenDensity: Int32,
        let displayId: Int32
    ) {}
}

class Locale {
    init() {}
}