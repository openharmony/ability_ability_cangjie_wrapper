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

import std.unittest.testmacro.*
import kit.AbilityKit.{MemoryLevel, Want, UIAbilityContext, LastExitReason, OnContinueResult, ResultCode,
    LaunchReason, LaunchParam}
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.base.*
//import ohos.business_exception.{BusinessException, AsyncCallback}
import kit.TestKit.AbilityDelegatorRegistry
import kit.AbilityKit.UIAbility
import kit.ArkUI.{WindowStage}
import kit.AbilityKit.StartOptions
import kit.AbilityKit.WindowMode
import kit.AbilityKit.AbilityResult
import stdx.encoding.json.*
import std.collection.HashMap
import kit.AbilityKit.RequestResult
import kit.AbilityKit.Params
import kit.AbilityKit.Flags
import kit.PerformanceAnalysisKit.Hilog
import ohos.business_exception.*
import std.runtime.gc

@Test
class Test_ui_ability_context {
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_interop() {
        let uiabilityCtxInterOp = getUIAbilityContextInterOp()
        let abilityStageCtxInterOp = getAbilityStageContextInterOp()
        let ctxInterOp = getContextInterOp()
        @Expect(uiabilityCtxInterOp.filesDir, "/data/storage/el2/base/haps/entry/files")
        @Expect(abilityStageCtxInterOp.filesDir, "/data/storage/el2/base/haps/entry/files")
        @Expect(ctxInterOp.filesDir, "/data/storage/el2/base/haps/entry/files")
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_ability_prop() {
        let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
        sleepFor(2.second)
        let ability = delegator.getCurrentTopAbility()
        let want = ability.lastRequestWant
        Hilog.info(0, "CangjieTest", "modulename is : ${want.moduleName}")
        @Expect(want.moduleName, "entry")
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_AbilityContext_startAbility() {
        let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let oldAbility = delegator.getCurrentTopAbility()
        sleepFor(2.second)
        Hilog.info(0, "CangjieTest", "getCurrentTopAbility")
        let abilityContext = getAbilityContext()
        let want = Want(bundleName: "com.example.myapplication", abilityName: "TestAbility")
        Hilog.info(0, "CangjieTest", "getAbilityContext")
        abilityContext.startAbility(want)
        sleepFor(2.second)
        let ability = delegator.getCurrentTopAbility()
        Hilog.info(0, "CangjieTest", "currentTopAbility is ${ability.launchWant.abilityName}")
        var testAbilityContext = getTestUIAbilityContext()
        Hilog.info(0, "CangjieTest", "testAbility isTerminating: ${testAbilityContext.isTerminating()}")
        getTestUIAbilityContext().terminateSelf()
        Hilog.info(0, "CangjieTest", "testAbility isTerminating: ${testAbilityContext.isTerminating()}")
        sleepFor(2.second)

        let options = StartOptions(windowMode: WindowMode.WindowModeSplitPrimary)
        abilityContext.startAbility(want, options: options)
        sleepFor(2.second)
        testAbilityContext = getTestUIAbilityContext()
        getTestUIAbilityContext().terminateSelf()
        sleepFor(2.second)
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_AbilityContext_startAbilityForResult() {
        let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let oldAbility = delegator.getCurrentTopAbility()
        sleepFor(2 * Duration.second)
        Hilog.info(0, "CangjieTest", "currentTopAbility is ${oldAbility.launchWant.abilityName}")
        let abilityContext = getAbilityContext()
        let want = Want(bundleName: "com.example.myapplication", abilityName: "TestAbilityTwo")
        abilityContext.startAbilityForResult(want, {
            asyncerror, result =>
            if (asyncerror.isSome()) {
                let error = asyncerror.getOrThrow()
                Hilog.info(0, "CangjieTest", "errorcode is ${error.code}")
            }
            delegator.print(result.getOrThrow().resultCode.toString())
            Hilog.info(0, "CangjieTest", "abilityresult code is ${result.getOrThrow().resultCode}")
        })
        sleepFor(2 * Duration.second)

        let ability = delegator.getCurrentTopAbility()
        Hilog.info(0, "CangjieTest", "currentTopAbility is ${ability.launchWant.abilityName}")
        let result = AbilityResult(101, want: want)
        getTestAbilityTwoContext().terminateSelfWithResult(result)
        Hilog.info(0, "CangjieTest", "result code is ${result.resultCode}")
        sleepFor(2 * Duration.second)
        let options = StartOptions(windowMode: WindowMode.WindowModeSplitPrimary)
        abilityContext.startAbilityForResult(want, options, {
            asyncerror, result =>
            if (asyncerror.isSome()) {
                let error = asyncerror.getOrThrow()
                Hilog.info(0, "CangjieTest", "errorcode is ${error.code}")
            }
            delegator.print(result.getOrThrow().resultCode.toString())
            Hilog.info(0, "CangjieTest", "abilityresult code is ${result.getOrThrow().resultCode}")
        })
        sleepFor(2 * Duration.second)
        getTestAbilityTwoContext().terminateSelf()
        sleepFor(2 * Duration.second)
    }


    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_enumCheck() {
        Hilog.info(0, "CangjieTest", MemoryLevel.MemoryLevelLow.toString())
        let memoryLevel = MemoryLevel.MemoryLevelLow
        var isTrue = memoryLevel == MemoryLevel.MemoryLevelCritical
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_startAbility1() {
        sleepFor(100 * Duration.millisecond)
        try {
            let uiAbilityContext: UIAbilityContext = getAbilityContext()
            let want = Want(bundleName: "com.example.myapplication", abilityName: "EntryAbility")
            let opt = StartOptions(windowMode: WindowMode.WindowModeSplitPrimary)
            uiAbilityContext.startAbility(want, options: opt)
        } catch (e: Exception) {
            Hilog.info(0, "CangjieTest", "test_startAbility1 exception")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_startAbility2() {
        sleepFor(100 * Duration.millisecond)
        try {
            let uiAbilityContext: UIAbilityContext = getAbilityContext()
            let want = Want(bundleName: "com.example.myapplication", abilityName: "EntryAbility")
            let opt = StartOptions(windowMode: WindowMode.WindowModeFullscreen)
            uiAbilityContext.startAbility(want, options: opt)
        } catch (e: Exception) {
            Hilog.info(0, "CangjieTest", "test_startAbility2 exception")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_startAbility3() {
        sleepFor(100 * Duration.millisecond)
        try {
            let uiAbilityContext: UIAbilityContext = getAbilityContext()
            let want = Want(bundleName: "com.example.myapplication", abilityName: "EntryAbility")
            let opt = StartOptions(windowMode: WindowMode.WindowModeSplitSecondary)
            uiAbilityContext.startAbility(want, options: opt)
        } catch (e: Exception) {
            Hilog.info(0, "CangjieTest", "test_startAbility3 exception")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_UIAbility() {
        let ability = UIAbility()
        let want = Want(bundleName: "com.example.myapplication", abilityName: "EntryAbility")
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_DialogRequestResult_two() {
        let context = getAbilityContext()
        let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
        sleepFor(1.second)
        let ability = delegator.getCurrentTopAbility()
        try {
            let dialog = context.requestDialogService(ability.launchWant, {
                err, result => if (err.isNone()) {
                    let dialog = result.getOrThrow()
                    let want = dialog.want
                    let resultCode = dialog.result
                } else {
                    Hilog.info(0, "CangjieTest", "error code is ${err.getOrThrow().code}")
                }
            })
        } catch (e: BusinessException) {
            Hilog.info(0, "CangjieTest", "test_DialogRequestResult: ${e}")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_LaunchReason() {
        let enumArray: Array<LaunchReason> = [
            LaunchReason.Unknown,
            LaunchReason.StartAbility,
            LaunchReason.Call,
            LaunchReason.Continuation,
            LaunchReason.AppRecovery]
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_LastExitReason() {
        let enumArray: Array<LastExitReason> = [
            LastExitReason.Unknown,
            LastExitReason.Normal,
            LastExitReason.CppCrash,
            LastExitReason.AppFreeze]
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_OnContinueResult() {
        let enumArray: Array<OnContinueResult> = [
            OnContinueResult.Agree,
            OnContinueResult.Reject,
            OnContinueResult.Mismatch]
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_WindowMode() {
        let enumArray: Array<WindowMode> = [
            WindowMode.WindowModeFullscreen,
            WindowMode.WindowModeSplitPrimary,
            WindowMode.WindowModeSplitSecondary]
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_MemoryLevel() {
        let enumArray: Array<MemoryLevel> = [
            MemoryLevel.MemoryLevelModerate,
            MemoryLevel.MemoryLevelLow,
            MemoryLevel.MemoryLevelCritical]
        let strArray: Array<String> = [
            "MemoryLevel.MemoryLevelModerate",
            "MemoryLevel.MemoryLevelLow",
            "MemoryLevel.MemoryLevelCritical"]
        for (i in 0..enumArray.size) {
            @Expect(enumArray[i] == enumArray[i])
            @Expect(enumArray[i].toString() == strArray[i])
            @Expect(enumArray[i] != enumArray[(i + 1) % enumArray.size])
        }
    }


    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_ResultCode() {
        let enumArray: Array<ResultCode> = [
            ResultCode.ResultOk,
            ResultCode.ResultCancel]
    }
}
