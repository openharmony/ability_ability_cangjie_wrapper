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

package ohos.application.error_observer

import ohos.labels.*

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public class ErrorObject {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public let name: String

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public let message: String

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public let stack: Option<String>
    
    public init() {
        super()
        this.name = String()
        this.message = String()
        this.stack = None
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
public class ErrorObserver {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public var onUnhandledException: (String) -> Unit

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public var onException: Option<(ErrorObject) -> Unit>

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityRuntime.Core"]
    public init(
        onUnhandledException: (String) -> Unit,
        onException!: Option<(ErrorObject) -> Unit> = None
    ) {
        super()
        this.onUnhandledException = {p0 =>  ()}
        this.onException = None
    }
}