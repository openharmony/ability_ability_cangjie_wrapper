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

/**
 * Created on 2025/01/07
 */
package ohos_app_cangjie_entry

import std.unittest.testmacro.*
import kit.AbilityKit.{ErrorManager, ErrorManagerEvent, ErrorObserver}
import ohos.base.UIThread
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.base.*
import ohos.business_exception.*

let observer = ErrorObserver(
    {_ =>}, onException: {_=>}
)

var id: Int32 = 0

@Test
class Test_error_manager {

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_error_manager_on() {
        try {
            id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        } catch (e: BusinessException) {
            @Expect(e.code, 401)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_error_manager_on_not_main_thread() {
        try {
            id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        } catch (e: BusinessException) {
            @Expect(e.code, 16200001)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_error_manager_off() {
        spawn (UIThread) {
            try {
                ErrorManager.off(ErrorManagerEvent.Error, id)
            } catch (e: BusinessException) {
                @Expect(false)
            }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_error_manager_off_not_main_thread() {
        try {
            ErrorManager.off(ErrorManagerEvent.Error, id)
        } catch (e: BusinessException) {
            @Expect(e.code, 16000003)
        }
    }
}
