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

package ohos.app.ability.want_agent

import ohos.app.ability.want.{Want, WantHandle}
import ohos.ffi.CArrI32

foreign func FfiWantAgentGetWantAgent(info: CJWantAgentInfo, errCode: CPointer<Int32>): Int64

@C
struct CJWantArr {
    CJWantArr(
        let head: CPointer<WantHandle>,
        let size: Int64
    ) {}
}

@C
struct CJWantAgentInfo {
    CJWantAgentInfo(
        let wants: CJWantArr,
        let actionType: Int32,
        let requestCode: Int32,
        let actionFlags: CArrI32,
        let extraInfos: CString
    ) {}

    unsafe func free(): Unit {
        Want.releaseWantHandle(wants.head.read(0))
        LibC.free<WantHandle>(wants.head)
        if (actionFlags.size != 0) {
            LibC.free<Int32>(actionFlags.head)
        }
        LibC.free(extraInfos)
    }
}