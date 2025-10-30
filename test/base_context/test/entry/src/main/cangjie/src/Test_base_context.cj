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
import kit.AbilityKit.{Context, AreaMode, ApplicationInfo, AbilityStageContext, WantValueType}
import kit.AbilityKit.*
import std.collection.HashMap
import stdx.encoding.json.*
import ohos.base.*
import kit.PerformanceAnalysisKit.Hilog
import kit.TestKit.{AbilityDelegator, AbilityDelegatorRegistry}

@Test
class Test_base_context {
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_filesDir() {
        var filesDir = getAbilityContext().filesDir
        Hilog.info(0, "cangjie", "abilityContext filesDir:${filesDir}")
        @Expect(filesDir, "/data/storage/el2/base/haps/entry/files")
        filesDir = getAbilityStageContext().filesDir
        Hilog.info(0, "cangjie", "abilityStageContext filesDir:${filesDir}")
        @Expect(filesDir, "/data/storage/el2/base/haps/entry/files")
        filesDir = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir
        Hilog.info(0, "cangjie", "appContext filesDir:${filesDir}")
        @Expect(filesDir, "/data/storage/el2/base/files")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func area() {
        var filesDir = getAbilityContext().filesDir
        Hilog.info(0, "cangjie", "abilityContext filesDir:${filesDir}")
        @Expect(filesDir, "/data/storage/el2/base/haps/entry/files")
        var area = getAbilityContext().area
        @Expect(area, El2)
        getAbilityContext().area = El3
        area = getAbilityContext().area
        @Expect(area, El3)
        filesDir = getAbilityContext().filesDir
        Hilog.info(0, "cangjie", "abilityContext filesDir:${filesDir}")
        @Expect(filesDir, "/data/storage/el3/base/haps/entry/files")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode() {
        let enumArray: Array<AreaMode> = [
            AreaMode.El1,
            AreaMode.El2,
            AreaMode.El3,
            AreaMode.El4,
            AreaMode.El5]
        let strArray: Array<String> = [
            "AreaMode.El1",
            "AreaMode.El2",
            "AreaMode.El3",
            "AreaMode.El4",
            "AreaMode.El5"]
        for (i in 0..enumArray.size) {
            @Expect(enumArray[i] == enumArray[i] )
            @Expect(enumArray[i].toString() == strArray[i])
            @Expect(enumArray[i] != enumArray[(i + 1) % enumArray.size])
        }
    }


    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_applicationInfo() {
        Hilog.info(0, "cangjie", "abilityContext applicationInfo:${getAbilityContext().applicationInfo.codePath}")
        @Expect(getAbilityContext().applicationInfo.codePath, "/data/app/el1/bundle/public/com.example.myapplication")
        Hilog.info(0, "cangjie", "abilityStageContext applicationInfo:${getAbilityStageContext().applicationInfo.codePath}")
        @Expect(getAbilityStageContext().applicationInfo.codePath, "/data/app/el1/bundle/public/com.example.myapplication")
        Hilog.info(0, "cangjie",
            "appContext applicationInfo:${AbilityDelegatorRegistry.getAbilityDelegator().getAppContext().applicationInfo.codePath}")
        @Expect(AbilityDelegatorRegistry.getAbilityDelegator().getAppContext().applicationInfo.codePath, "/data/app/el1/bundle/public/com.example.myapplication")
        let appInfo: ApplicationInfo = getAbilityContext().applicationInfo
        Hilog.info(0, "cangjie",
            "abilityContext applicationInfo:${AbilityDelegatorRegistry.getAbilityDelegator().getAppContext().applicationInfo.name}")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resourceManager() {
        var rmgr = getAbilityContext().resourceManager

        rmgr = getAbilityStageContext().resourceManager

        rmgr = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_wantConstant() {
        @Expect(Params.ABILITY_BACK_TO_OTHER_MISSION_STACK, "ability.params.backToOtherMissionStack")
        @Expect(Params.ABILITY_RECOVERY_RESTART, "ohos.ability.params.abilityRecoveryRestart")
        @Expect(Params.CONTENT_TITLE_KEY, "ohos.extra.param.key.contentTitle")
        @Expect(Params.SHARE_ABSTRACT_KEY, "ohos.extra.param.key.shareAbstract")
        @Expect(Params.SHARE_URL_KEY, "ohos.extra.param.key.shareUrl")
        @Expect(Params.SUPPORT_CONTINUE_PAGE_STACK_KEY, "ohos.extra.param.key.supportContinuePageStack")
        @Expect(Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY, "ohos.extra.param.key.supportContinueSourceExit")

        @Expect(Flags.FLAG_AUTH_READ_URI_PERMISSION, 0x00000001)
        @Expect(Flags.FLAG_AUTH_WRITE_URI_PERMISSION, 0x00000002)
        @Expect(Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION, 0x00000040)
        @Expect(Flags.FLAG_INSTALL_ON_DEMAND, 0x00000800)
        @Expect(Flags.FLAG_START_WITHOUT_TIPS, 0x40000000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_wantValue() {
        var wantType = Int64Value(2)
        wantType = Float64Value(2.0)
        wantType = StringValue("2.0")
        wantType = BoolValue(false)
        wantType = ArrayValue([StringValue("2.0")])

        let valueMap = HashMap<String, WantValueType>()
        valueMap.add("mykey1", StringValue("hehehe"))
        valueMap.add("mykey2", Int64Value(333))
        let valueMap1 = HashMap<String, WantValueType>()
        valueMap1.add("mykey4", StringValue("5"))
        let valueStringArr: Array<WantValueType> = [StringValue("a"), StringValue("b"), StringValue("c")]
        valueMap1.add("stringArr", ArrayValue(valueStringArr))
        valueMap1.add("INFO", HashMapValue(valueMap))
        let valueIntArr: Array<WantValueType> = [Int64Value(333), Int64Value(333), Int64Value(333)]
        valueMap1.add("IntArr", ArrayValue(valueIntArr))
        let want = Want(deviceId: "",
            bundleName: "",
            abilityName: "",
            moduleName: "",
            flags: 0,
            uri: "",
            action: "",
            entities: [],
            wantType: "",
            parameters: valueMap1,
            fds: HashMap<String, Int32>())

        @Expect(want.deviceId, "")
        @Expect(want.bundleName, "")
        @Expect(want.abilityName, "")
        @Expect(want.moduleName, "")
        @Expect(want.flags, 0)
        @Expect(want.action, "")
        @Expect(want.entities, [])
        @Expect(want.wantType, "")
        let map = want.parameters
    }
}
