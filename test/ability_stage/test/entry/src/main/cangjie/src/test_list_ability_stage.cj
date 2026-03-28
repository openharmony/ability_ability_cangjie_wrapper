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

package ohos_app_cangjie_entry

let _ = testsuite()

func testsuite(): Unit {
    registerTestSuite("Test_ability_stage", {=> Test_ability_stage()})
    registerTestSuite("TestAbilityConstantLlt", {=> TestAbilityConstantLlt()})
    registerTestSuite("TestAbilityResultLlt", {=> TestAbilityResultLlt()})
    registerTestSuite("TestAppRecoveryLltPart1", {=> TestAppRecoveryLltPart1()})
    registerTestSuite("TestBaseContextLlt", {=> TestBaseContextLlt()})
    registerTestSuite("TestContextConstantLltPart1", {=> TestContextConstantLltPart1()})
    registerTestSuite("TestDialogRequestLlt", {=> TestDialogRequestLlt()})
    registerTestSuite("TestDialogRequestLlt", {=> TestDialogRequestLlt()})
    registerTestSuite("TestErrorManagerLlt", {=> TestErrorManagerLlt()})
    registerTestSuite("TestErrorObserverLltPart1", {=> TestErrorObserverLltPart1()})
    registerTestSuite("TestErrorObserverLltPart2", {=> TestErrorObserverLltPart2()})
    registerTestSuite("TestErrorObjectLlt", {=> TestErrorObjectLlt()})
    registerTestSuite("TestStartOptionsLlt", {=> TestStartOptionsLlt()})
    registerTestSuite("TestWantConstantLltPart1", {=> TestWantConstantLltPart1()})
    registerTestSuite("TestWantLltPart1", {=> TestWantLltPart1()})
    registerTestSuite("TestWantLltPart2", {=> TestWantLltPart2()})
    registerTestSuite("TestWantLltPart3", {=> TestWantLltPart3()})
    registerTestSuite("TestWantInitLltPart1", {=> TestWantInitLltPart1()})
    registerTestSuite("TestWantInitLltPart2", {=> TestWantInitLltPart2()})
    registerTestSuite("TestWantInitLltPart3", {=> TestWantInitLltPart3()})
    registerTestSuite("TestUIAbilityLlt", {=> TestUIAbilityLlt()})
    registerTestSuite("TestContextLlt", {=> TestContextLlt()})
    registerTestSuite("TestAbilityStageLltPart1", {=> TestAbilityStageLltPart1()})
}
