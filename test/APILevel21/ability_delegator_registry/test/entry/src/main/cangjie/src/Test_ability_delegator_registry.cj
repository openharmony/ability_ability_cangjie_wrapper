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
 * Created on 2024/9/21
 */
package ohos_app_cangjie_entry

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.base.*
import kit.TestKit.*
import std.collection.*
import std.runtime.gc
import kit.PerformanceAnalysisKit.Hilog

@Test
class Test_ability_delegator_registry {
    override func afterAll(): Unit {
        gc(heavy: true)
        sleepFor(Duration.second)
    }
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_getArguments() {
        let delegatorRegistry = AbilityDelegatorRegistry()
        let args = AbilityDelegatorRegistry.getArguments()
        Hilog.info(0, "CangjieTest", "arg is ${args.bundleName}")
        Hilog.info(0, "CangjieTest", "arg is ${args.bundleName}")
        Hilog.info(0, "CangjieTest", "arg is ${args.testCaseNames}")
        Hilog.info(0, "CangjieTest", "arg is ${args.testCaseNames}")
        Hilog.info(0, "CangjieTest", "arg is ${args.testRunnerClassName}")
        Hilog.info(0, "CangjieTest", "arg is ${args.testRunnerClassName}")
        Hilog.info(0, "CangjieTest", "arg is ${args.parameters}")
        Hilog.info(0, "CangjieTest", "arg is ${args.parameters}")
        @Expect(args.bundleName, "com.example.myapplication")
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_setArguments() {
        let args = AbilityDelegatorRegistry.getArguments()
        args.bundleName = ""
        args.parameters = HashMap<String, String>()
        args.testCaseNames = ""
        args.testRunnerClassName = ""
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_waitMonitor() {
        let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
        try {
            delegator.waitAbilityStageMonitor(AbilityStageMonitor("moduleName", "srcEntrance"))
        } catch (e: Exception) {}
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_waitMonitor2() {
        let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
        try {
            delegator.waitAbilityStageMonitor(AbilityStageMonitor("moduleName", "srcEntrance"), timeout: 1000)
        } catch (e: Exception) {}
    }
}
