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

package ohos.app.ability.app_manager

import ohos.ffi.{CArrString}
import ohos.bundle.bundle_manager.BundleType

foreign func FfiAppMgrGetRunningProcessInformation(code: CPointer<Int32>): CArrProcessInformation

@C
struct CArrProcessInformation {
    CArrProcessInformation(
        let head: CPointer<CProcessInformation>,
        let size: Int64
    ) {}

    unsafe func toArrProcessInformation(): Array<ProcessInformation> {
        Array<ProcessInformation>(size) {
            i => head.read(i).toProcessInformation()
        }
    }

    unsafe func free() {
        for (i in 0..size) {
            head.read(i).free()
        }
        LibC.free<CProcessInformation>(head)
    }
}

@C
struct CProcessInformation {
    CProcessInformation(
        let pid: Int32,
        let uid: Int32,
        let processName: CString,
        let bundleNames: CArrString,
        let state: Int32,
        let bundleType: Int32,
        let appCloneIndex: Int32
    ) {}

    unsafe func toProcessInformation(): ProcessInformation {
        return ProcessInformation(
            pid,
            uid,
            processName.toString(),
            bundleNames.toStringArray(),
            ProcessState.parse(state),
            BundleType.parse(bundleType),
            appCloneIndex
        )
    }

    unsafe func free() {
        LibC.free(processName)
        bundleNames.free()
    }
}
