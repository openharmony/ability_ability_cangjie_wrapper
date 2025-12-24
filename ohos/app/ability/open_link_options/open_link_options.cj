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

package ohos.app.ability.open_link_options

import std.collection.HashMap
import ohos.app.ability.want.{mapToJsonObject, WantValueType}
import ohos.app.ability.completion_handler.CompletionHandler
import ohos.encoding.json.jsonObjectWrapper
import ohos.labels.{APILevel, Hide}

/**
 * Define the available options for openLink API.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class OpenLinkOptions {
    /**
     * Open the URL only if the URL is a valid app linking and
     * there is an installed app capable of opening that URL.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var appLinkingOnly: Bool

    /**
     * OpenLinkOptions parameters in the form of custom key-value pairs.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var parameters: HashMap<String, WantValueType>

    @!Hide
    var completionHandler: ?CompletionHandler = None

    @!Hide
    var hideFailureTipDialog: Bool = false

    /**
     * OpenLinkOptions constructor.
     *
     * @param { Bool } [ appLinkingOnly ] - Whether the URL is a valid app linking.
     * @param { HashMap<String, WantValueType> } [ parameters ] - OpenLinkOptions parameters in the form of custom key-value pairs.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public init(appLinkingOnly!: Bool = false, parameters!: HashMap<String, WantValueType> = HashMap<String, WantValueType>()) {
        this.appLinkingOnly = appLinkingOnly
        this.parameters = parameters
    }
}

unsafe protected func toCJOpenLinkOptions(option: ?OpenLinkOptions): CJOpenLinkOptions {
    if (let Some(v) <- option) {
        let paramJsonObj = mapToJsonObject(v.parameters)
        return CJOpenLinkOptions(true, v.appLinkingOnly, LibC.mallocCString(jsonObjectWrapper(paramJsonObj).toString()))
    } else {
        return CJOpenLinkOptions(false, false, CString(CPointer<UInt8>()))
    }
}

@C
protected struct CJOpenLinkOptions {
    protected CJOpenLinkOptions(
        let hasValue: Bool,
        let appLinkingOnly: Bool,
        let parameters: CString
    ) {}

    protected unsafe func free() {
        LibC.free(parameters)
    }
}
