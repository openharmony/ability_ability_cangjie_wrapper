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
 * Created on 2024/1/29
 */
package ohos_app_cangjie_entry

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.base.*
import std.convert.*
import kit.AbilityKit.*
import kit.TestKit.*
import std.runtime.gc
import kit.PerformanceAnalysisKit.Hilog

@Test
class Test_ability_delegator {
    override func afterAll(): Unit {
        gc(heavy: true)
        sleepFor(Duration.second)
    }
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_delegator_changeAbilityState() {
        let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
        sleepFor(1.second)
        let monitor = AbilityMonitor(
            "EntryAbility",
            onAbilityForeground: {
                ability => delegator.print("call onAbilityForeground success!")
            }
        )
        delegator.addAbilityMonitor(monitor)
        let ability = delegator.getCurrentTopAbility()
        @Expect(ability.launchWant.abilityName, "EntryAbility")
        delegator.doAbilityBackground(ability)
        sleepFor(1.second)
        var state = delegator.getAbilityState(ability)
        delegator.removeAbilityMonitor(monitor)
        @Expect(state, AbilityLifecycleState.Background)
        delegator.doAbilityForeground(ability)
        sleepFor(1.second)
        state = delegator.getAbilityState(ability)
        @Expect(state, AbilityLifecycleState.Foreground)
        let result = delegator.executeShellCommand("ls", timeoutSecs: 1)
        delegator.print(result.stdResult)
        sleepFor(1.second)
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_delegator_startNewAbility() {
        let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let entryAbility = delegator.getCurrentTopAbility()
        @Expect(entryAbility.launchWant.abilityName, "EntryAbility")
        let ret = delegator.getAbilityState(entryAbility)
        @Expect(ret, AbilityLifecycleState.Foreground)
        let want = Want(bundleName: "com.example.myapplication", abilityName: "TestAbility")
        spawn {
            let monitor1 = AbilityMonitor(
                "TestAbility",
                onAbilityCreate: {
                    ability =>
                    sleepFor(2.second)
                    delegator.print("call onAbilityCreate success!")
                    let state = delegator.getAbilityState(ability)
                    @Expect(state, AbilityLifecycleState.Create)
                    Hilog.info(0, "CangjieTest", "ability state is: ${state}")
                },
                onAbilityForeground: {
                    ability =>
                    delegator.print("call onAbilityForeground success!")
                    let state = delegator.getAbilityState(ability)
                    @Expect(state, AbilityLifecycleState.Foreground)
                    Hilog.info(0, "CangjieTest", "ability state is: ${state}")
                },
                onAbilityBackground: {
                    ability =>
                    delegator.print("call onAbilityBackground success!")
                    let state = delegator.getAbilityState(ability)
                    @Expect(state, AbilityLifecycleState.Background)
                    Hilog.info(0, "CangjieTest", "ability state is: ${state}")
                },
                onAbilityDestroy: {
                    ability =>
                    delegator.print("call onAbilityDestroy success!")
                    let state = delegator.getAbilityState(ability)
                    Hilog.info(0, "CangjieTest", "ability state is: ${state}")
                },
                onWindowStageCreate: {
                    ability =>
                    delegator.print("call onWindowStageCreate success!")
                    let state = delegator.getAbilityState(ability)
                    Hilog.info(0, "CangjieTest", "ability state is: ${state}")
                },
                onWindowStageRestore: {
                    ability =>
                    delegator.print("call onWindowStageRestore success!")
                    let state = delegator.getAbilityState(ability)
                    Hilog.info(0, "CangjieTest", "ability state is: ${state}")
                },
                onWindowStageDestroy: {
                    ability =>
                    delegator.print("call onWindowStageRestore success!")
                    let state = delegator.getAbilityState(ability)
                    Hilog.info(0, "CangjieTest", "ability state is: ${state}")
                }
            )
            let ability = delegator.waitAbilityMonitor(monitor1)
            delegator.print("waitAbilityMonitor called")
        }
        spawn {
            let monitor2 = AbilityMonitor(
                "TestAbility",
                onAbilityCreate: {
                    ability => delegator.print("call onAbilityCreate success!")
                },
                onAbilityForeground: {
                    ability => delegator.print("call onAbilityForeground success!")
                },
                onAbilityBackground: {
                    ability => delegator.print("call onAbilityBackground success!")
                },
                onAbilityDestroy: {
                    ability => delegator.print("call onAbilityDestroy success!")
                },
                onWindowStageCreate: {
                    ability =>
                    delegator.print("call onWindowStageCreate success!")
                },
                onWindowStageRestore: {
                    ability =>
                    delegator.print("call onWindowStageRestore success!")
                },
                onWindowStageDestroy: {
                    ability =>
                    delegator.print("call onWindowStageRestore success!")
                }
            )
            let ability = delegator.waitAbilityMonitor(monitor2, timeout: 2000)
            delegator.print("waitAbilityMonitorwith time called")
        }

        let stageMonitor = AbilityStageMonitor("entry", "")
        delegator.addAbilityStageMonitor(stageMonitor)
        delegator.removeAbilityStageMonitor(stageMonitor)
        delegator.startAbility(want).get()

        waitForEventWithName("TestAbilityStarted", timeOut: 10.second) {_ =>}
        let testAbility = delegator.getCurrentTopAbility()
        @Expect(testAbility.launchWant.abilityName, "TestAbility")
        testAbility.context.terminateSelf()
        sleepFor(5.second)
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_enum_AbilityLifecycleState() {
        let enumArray: Array<AbilityLifecycleState> = [
            AbilityLifecycleState.Uninitialized,
            AbilityLifecycleState.Create,
            AbilityLifecycleState.Foreground,
            AbilityLifecycleState.Background,
            AbilityLifecycleState.Destroy]
        let strArray: Array<String> = [
            "AbilityLifecycleState.Uninitialized",
            "AbilityLifecycleState.Create",
            "AbilityLifecycleState.Foreground",
            "AbilityLifecycleState.Background",
            "AbilityLifecycleState.Destroy"]
        for (i in 0..enumArray.size) {
            @Expect(enumArray[i].toString() == strArray[i])
            @Expect (enumArray[i] == enumArray[i])
            @Expect(enumArray[i] != enumArray[(i + 1) % enumArray.size])
        }
    }
}
