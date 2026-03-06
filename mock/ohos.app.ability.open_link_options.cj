package ohos.app.ability.open_link_options

import ohos.app.ability.completion_handler.CompletionHandler
import ohos.app.ability.want.*
import ohos.labels.*
import std.collection.HashMap

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class OpenLinkOptions {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var appLinkingOnly: Bool

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var parameters: HashMap<String, WantValueType>

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public init(appLinkingOnly!: Bool = false,
        parameters!: HashMap<String, WantValueType> = HashMap<String, WantValueType>()) {
        super()
        this.appLinkingOnly = true
        this.parameters = HashMap()
    }
}