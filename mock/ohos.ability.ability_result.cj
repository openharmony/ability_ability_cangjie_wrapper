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

package ohos.ability.ability_result

import ohos.app.ability.want.*
import ohos.labels.*
import std.collection.*

@!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
public class AbilityResult {
    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public var resultCode: Int32

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public var want: Want

    @!APILevel[since: "22", syscap: "SystemCapability.Ability.AbilityBase"]
    public init(resultCode: Int32, want!: Want = Want()) {
        super()
        this.resultCode = 0
        this.want = want
    }
}
