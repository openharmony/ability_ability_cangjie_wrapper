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

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

import ohos.app.ability.want.*
import ohos.app.ability.want_constant.*
import std.collection.*

class WantConstantTestHelper {
    static func hasParam(want: Want, key: String): Bool {
        match (want.parameters.get(key)) {
            case Some(_) => true
            case None => false
        }
    }
}

@Test
class TestWantConstantLltPart1 {
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_AUTH_READ_URI_PERMISSION_value(): Unit {
        // 原始用例名: test_FLAG_AUTH_READ_URI_PERMISSION_value
        // 测试流程: 读取Flags.FLAG_AUTH_READ_URI_PERMISSION常量值
        // 预期结果: 返回UInt32类型，值为0x00000001（十进制1）
        @Expect(Flags.FLAG_AUTH_READ_URI_PERMISSION, 0x00000001)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_AUTH_READ_URI_PERMISSION_type(): Unit {
        // 原始用例名: test_FLAG_AUTH_READ_URI_PERMISSION_type
        // 测试流程: 验证Flags.FLAG_AUTH_READ_URI_PERMISSION的类型
        // 预期结果: 类型为UInt32
        let value: UInt32 = Flags.FLAG_AUTH_READ_URI_PERMISSION
        @Expect(value, Flags.FLAG_AUTH_READ_URI_PERMISSION)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_AUTH_READ_URI_PERMISSION_use_in_want(): Unit {
        // 原始用例名: test_FLAG_AUTH_READ_URI_PERMISSION_use_in_want
        // 测试流程: 将FLAG_AUTH_READ_URI_PERMISSION设置到Want.flags字段
        // 预期结果: 成功设置，接收方获得读取URI数据的临时权限
        let want = Want(flags: Flags.FLAG_AUTH_READ_URI_PERMISSION)
        @Expect(want.flags, Flags.FLAG_AUTH_READ_URI_PERMISSION)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_AUTH_READ_URI_PERMISSION_combine_with_write(): Unit {
        // 原始用例名: test_FLAG_AUTH_READ_URI_PERMISSION_combine_with_write
        // 测试流程: 将FLAG_AUTH_READ_URI_PERMISSION与FLAG_AUTH_WRITE_URI_PERMISSION进行按位或组合
        // 预期结果: 组合结果为0x00000003，同时授予读写权限
        let combined = Flags.FLAG_AUTH_READ_URI_PERMISSION | Flags.FLAG_AUTH_WRITE_URI_PERMISSION
        @Expect(combined, 0x00000003)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_AUTH_WRITE_URI_PERMISSION_value(): Unit {
        // 原始用例名: test_FLAG_AUTH_WRITE_URI_PERMISSION_value
        // 测试流程: 读取Flags.FLAG_AUTH_WRITE_URI_PERMISSION常量值
        // 预期结果: 返回UInt32类型，值为0x00000002（十进制2）
        @Expect(Flags.FLAG_AUTH_WRITE_URI_PERMISSION, 0x00000002)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_AUTH_WRITE_URI_PERMISSION_type(): Unit {
        // 原始用例名: test_FLAG_AUTH_WRITE_URI_PERMISSION_type
        // 测试流程: 验证Flags.FLAG_AUTH_WRITE_URI_PERMISSION的类型
        // 预期结果: 类型为UInt32
        let value: UInt32 = Flags.FLAG_AUTH_WRITE_URI_PERMISSION
        @Expect(value, Flags.FLAG_AUTH_WRITE_URI_PERMISSION)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_AUTH_WRITE_URI_PERMISSION_use_in_want(): Unit {
        // 原始用例名: test_FLAG_AUTH_WRITE_URI_PERMISSION_use_in_want
        // 测试流程: 将FLAG_AUTH_WRITE_URI_PERMISSION设置到Want.flags字段
        // 预期结果: 成功设置，接收方获得写入URI数据的临时权限
        let want = Want(flags: Flags.FLAG_AUTH_WRITE_URI_PERMISSION)
        @Expect(want.flags, Flags.FLAG_AUTH_WRITE_URI_PERMISSION)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_AUTH_WRITE_URI_PERMISSION_combine_with_persistable(): Unit {
        // 原始用例名: test_FLAG_AUTH_WRITE_URI_PERMISSION_combine_with_persistable
        // 测试流程: 将FLAG_AUTH_WRITE_URI_PERMISSION与FLAG_AUTH_PERSISTABLE_URI_PERMISSION进行按位或组合
        // 预期结果: 组合结果为0x00000042，授予写入权限并允许持久化
        let combined = Flags.FLAG_AUTH_WRITE_URI_PERMISSION | Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION
        @Expect(combined, 0x00000042)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_AUTH_PERSISTABLE_URI_PERMISSION_value(): Unit {
        // 原始用例名: test_FLAG_AUTH_PERSISTABLE_URI_PERMISSION_value
        // 测试流程: 读取Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION常量值
        // 预期结果: 返回UInt32类型，值为0x00000040（十进制64）
        @Expect(Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION, 0x00000040)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_AUTH_PERSISTABLE_URI_PERMISSION_type(): Unit {
        // 原始用例名: test_FLAG_AUTH_PERSISTABLE_URI_PERMISSION_type
        // 测试流程: 验证Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION的类型
        // 预期结果: 类型为UInt32
        let value: UInt32 = Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION
        @Expect(value, Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_AUTH_PERSISTABLE_URI_PERMISSION_tablet_only(): Unit {
        // 原始用例名: test_FLAG_AUTH_PERSISTABLE_URI_PERMISSION_tablet_only
        // 测试流程: 在Tablet设备上将FLAG_AUTH_PERSISTABLE_URI_PERMISSION设置到Want.flags字段
        // 预期结果: 成功设置，接收方可以持久化该URI
        let want = Want(flags: Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION)
        @Expect(want.flags, Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_AUTH_PERSISTABLE_URI_PERMISSION_combine_with_read_write(): Unit {
        // 原始用例名: test_FLAG_AUTH_PERSISTABLE_URI_PERMISSION_combine_with_read_write
        // 测试流程: 将FLAG_AUTH_PERSISTABLE_URI_PERMISSION与FLAG_AUTH_READ_URI_PERMISSION和FLAG_AUTH_WRITE_URI_PERMISSION进行按位或组合
        // 预期结果: 组合结果为0x00000043，授予读写权限并允许持久化
        let combined = Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION |
            Flags.FLAG_AUTH_READ_URI_PERMISSION |
            Flags.FLAG_AUTH_WRITE_URI_PERMISSION
        @Expect(combined, 0x00000043)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_INSTALL_ON_DEMAND_value(): Unit {
        // 原始用例名: test_FLAG_INSTALL_ON_DEMAND_value
        // 测试流程: 读取Flags.FLAG_INSTALL_ON_DEMAND常量值
        // 预期结果: 返回UInt32类型，值为0x00000800（十进制2048）
        @Expect(Flags.FLAG_INSTALL_ON_DEMAND, 0x00000800)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_INSTALL_ON_DEMAND_type(): Unit {
        // 原始用例名: test_FLAG_INSTALL_ON_DEMAND_type
        // 测试流程: 验证Flags.FLAG_INSTALL_ON_DEMAND的类型
        // 预期结果: 类型为UInt32
        let value: UInt32 = Flags.FLAG_INSTALL_ON_DEMAND
        @Expect(value, Flags.FLAG_INSTALL_ON_DEMAND)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_INSTALL_ON_DEMAND_atomic_service_installed(): Unit {
        // 原始用例名: test_FLAG_INSTALL_ON_DEMAND_atomic_service_installed
        // 测试流程: 设置FLAG_INSTALL_ON_DEMAND后拉起已安装的原子化服务
        // 预期结果: 直接拉起原子化服务
        let want = Want(flags: Flags.FLAG_INSTALL_ON_DEMAND)
        @Expect(want.flags, Flags.FLAG_INSTALL_ON_DEMAND)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_INSTALL_ON_DEMAND_atomic_service_not_installed(): Unit {
        // 原始用例名: test_FLAG_INSTALL_ON_DEMAND_atomic_service_not_installed
        // 测试流程: 设置FLAG_INSTALL_ON_DEMAND后拉起未安装的原子化服务
        // 预期结果: 系统自动安装原子化服务后再拉起
        let want = Want(flags: Flags.FLAG_INSTALL_ON_DEMAND)
        @Expect(want.flags, Flags.FLAG_INSTALL_ON_DEMAND)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_INSTALL_ON_DEMAND_use_in_startAbility(): Unit {
        // 原始用例名: test_FLAG_INSTALL_ON_DEMAND_use_in_startAbility
        // 测试流程: 创建Want并设置flags为FLAG_INSTALL_ON_DEMAND，调用startAbility
        // 预期结果: 成功启动原子化服务，如未安装则自动安装后启动
        let want = Want(flags: Flags.FLAG_INSTALL_ON_DEMAND)
        @Expect(want.flags, Flags.FLAG_INSTALL_ON_DEMAND)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_START_WITHOUT_TIPS_value(): Unit {
        // 原始用例名: test_FLAG_START_WITHOUT_TIPS_value
        // 测试流程: 读取Flags.FLAG_START_WITHOUT_TIPS常量值
        // 预期结果: 返回UInt32类型，值为0x40000000（十进制1073741824）
        @Expect(Flags.FLAG_START_WITHOUT_TIPS, 0x40000000)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_START_WITHOUT_TIPS_type(): Unit {
        // 原始用例名: test_FLAG_START_WITHOUT_TIPS_type
        // 测试流程: 验证Flags.FLAG_START_WITHOUT_TIPS的类型
        // 预期结果: 类型为UInt32
        let value: UInt32 = Flags.FLAG_START_WITHOUT_TIPS
        @Expect(value, Flags.FLAG_START_WITHOUT_TIPS)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_START_WITHOUT_TIPS_no_match(): Unit {
        // 原始用例名: test_FLAG_START_WITHOUT_TIPS_no_match
        // 测试流程: 设置FLAG_START_WITHOUT_TIPS后通过隐式方式拉起应用，且没有匹配的应用
        // 预期结果: 不弹出提示弹窗
        let want = Want(flags: Flags.FLAG_START_WITHOUT_TIPS)
        @Expect(want.flags, Flags.FLAG_START_WITHOUT_TIPS)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_FLAG_START_WITHOUT_TIPS_implicit_start(): Unit {
        // 原始用例名: test_FLAG_START_WITHOUT_TIPS_implicit_start
        // 测试流程: 创建隐式Want并设置flags为FLAG_START_WITHOUT_TIPS，调用startAbility
        // 预期结果: 如无匹配应用，不显示暂无可用打开方式弹窗
        let want = Want(action: "ohos.want.action.view", flags: Flags.FLAG_START_WITHOUT_TIPS)
        @Expect(want.flags, Flags.FLAG_START_WITHOUT_TIPS)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ABILITY_BACK_TO_OTHER_MISSION_STACK_value(): Unit {
        // 原始用例名: test_ABILITY_BACK_TO_OTHER_MISSION_STACK_value
        // 测试流程: 读取Params.ABILITY_BACK_TO_OTHER_MISSION_STACK常量值
        // 预期结果: 返回String类型，值为"ability.params.backToOtherMissionStack"
        @Expect(Params.ABILITY_BACK_TO_OTHER_MISSION_STACK, "ability.params.backToOtherMissionStack")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ABILITY_BACK_TO_OTHER_MISSION_STACK_type(): Unit {
        // 原始用例名: test_ABILITY_BACK_TO_OTHER_MISSION_STACK_type
        // 测试流程: 验证Params.ABILITY_BACK_TO_OTHER_MISSION_STACK的类型
        // 预期结果: 类型为String
        let value: String = Params.ABILITY_BACK_TO_OTHER_MISSION_STACK
        @Expect(value, Params.ABILITY_BACK_TO_OTHER_MISSION_STACK)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ABILITY_BACK_TO_OTHER_MISSION_STACK_system_only(): Unit {
        // 原始用例名: test_ABILITY_BACK_TO_OTHER_MISSION_STACK_system_only
        // 测试流程: 三方应用在Want.parameters中设置ABILITY_BACK_TO_OTHER_MISSION_STACK参数
        // 预期结果: 参数不生效，仅系统设置有效
        let params = HashMap<String, WantValueType>()
        params.add(Params.ABILITY_BACK_TO_OTHER_MISSION_STACK, WantValueType.BoolValue(true))
        let want = Want(parameters: params)
        @Expect(WantConstantTestHelper.hasParam(want, Params.ABILITY_BACK_TO_OTHER_MISSION_STACK), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ABILITY_BACK_TO_OTHER_MISSION_STACK_cross_app_return(): Unit {
        // 原始用例名: test_ABILITY_BACK_TO_OTHER_MISSION_STACK_cross_app_return
        // 测试流程: 系统服务在Want.parameters中设置ABILITY_BACK_TO_OTHER_MISSION_STACK为true，拉起UIAbility B
        // 预期结果: UIAbility B退出时返回到之前的UIAbility A
        let params = HashMap<String, WantValueType>()
        params.add(Params.ABILITY_BACK_TO_OTHER_MISSION_STACK, WantValueType.BoolValue(true))
        let want = Want(bundleName: "com.example.b", abilityName: "AbilityB", parameters: params)
        @Expect(want.bundleName, "com.example.b")
        @Expect(WantConstantTestHelper.hasParam(want, Params.ABILITY_BACK_TO_OTHER_MISSION_STACK), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ABILITY_RECOVERY_RESTART_value(): Unit {
        // 原始用例名: test_ABILITY_RECOVERY_RESTART_value
        // 测试流程: 读取Params.ABILITY_RECOVERY_RESTART常量值
        // 预期结果: 返回String类型，值为"ohos.ability.params.abilityRecoveryRestart"
        @Expect(Params.ABILITY_RECOVERY_RESTART, "ohos.ability.params.abilityRecoveryRestart")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ABILITY_RECOVERY_RESTART_type(): Unit {
        // 原始用例名: test_ABILITY_RECOVERY_RESTART_type
        // 测试流程: 验证Params.ABILITY_RECOVERY_RESTART的类型
        // 预期结果: 类型为String
        let value: String = Params.ABILITY_RECOVERY_RESTART
        @Expect(value, Params.ABILITY_RECOVERY_RESTART)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ABILITY_RECOVERY_RESTART_check_in_onCreate(): Unit {
        // 原始用例名: test_ABILITY_RECOVERY_RESTART_check_in_onCreate
        // 测试流程: 在UIAbility的onCreate回调中，从want.parameters获取ABILITY_RECOVERY_RESTART的值
        // 预期结果: 如果值为true，表示当前UIAbility发生了故障重启
        let params = HashMap<String, WantValueType>()
        params.add(Params.ABILITY_RECOVERY_RESTART, WantValueType.BoolValue(true))
        let want = Want(parameters: params)
        @Expect(WantConstantTestHelper.hasParam(want, Params.ABILITY_RECOVERY_RESTART), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ABILITY_RECOVERY_RESTART_with_app_recovery(): Unit {
        // 原始用例名: test_ABILITY_RECOVERY_RESTART_with_app_recovery
        // 测试流程: 配合app_recovery模块使用，在故障恢复后检查ABILITY_RECOVERY_RESTART参数
        // 预期结果: 参数值为true，表示Ability是故障恢复重启
        let params = HashMap<String, WantValueType>()
        params.add(Params.ABILITY_RECOVERY_RESTART, WantValueType.BoolValue(true))
        let want = Want(parameters: params)
        @Expect(WantConstantTestHelper.hasParam(want, Params.ABILITY_RECOVERY_RESTART), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_CONTENT_TITLE_KEY_value(): Unit {
        // 原始用例名: test_CONTENT_TITLE_KEY_value
        // 测试流程: 读取Params.CONTENT_TITLE_KEY常量值
        // 预期结果: 返回String类型，值为"ohos.extra.param.key.contentTitle"
        @Expect(Params.CONTENT_TITLE_KEY, "ohos.extra.param.key.contentTitle")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_CONTENT_TITLE_KEY_type(): Unit {
        // 原始用例名: test_CONTENT_TITLE_KEY_type
        // 测试流程: 验证Params.CONTENT_TITLE_KEY的类型
        // 预期结果: 类型为String
        let value: String = Params.CONTENT_TITLE_KEY
        @Expect(value, Params.CONTENT_TITLE_KEY)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_CONTENT_TITLE_KEY_in_onShare(): Unit {
        // 原始用例名: test_CONTENT_TITLE_KEY_in_onShare
        // 测试流程: 在跨端分享的onShare回调中，使用CONTENT_TITLE_KEY设置分享标题
        // 预期结果: 分享标题正确设置
        let params = HashMap<String, WantValueType>()
        params.add(Params.CONTENT_TITLE_KEY, WantValueType.StringValue("share-title"))
        let want = Want(parameters: params)
        @Expect(WantConstantTestHelper.hasParam(want, Params.CONTENT_TITLE_KEY), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_CONTENT_TITLE_KEY_with_share_abstract_and_url(): Unit {
        // 原始用例名: test_CONTENT_TITLE_KEY_with_share_abstract_and_url
        // 测试流程: 同时使用CONTENT_TITLE_KEY、SHARE_ABSTRACT_KEY和SHARE_URL_KEY设置分享信息
        // 预期结果: 分享标题、摘要和URL均正确设置
        let params = HashMap<String, WantValueType>()
        params.add(Params.CONTENT_TITLE_KEY, WantValueType.StringValue("title"))
        params.add(Params.SHARE_ABSTRACT_KEY, WantValueType.StringValue("abstract"))
        params.add(Params.SHARE_URL_KEY, WantValueType.StringValue("https://example.com"))
        let want = Want(parameters: params)
        @Expect(want.parameters.size, 3)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SHARE_ABSTRACT_KEY_value(): Unit {
        // 原始用例名: test_SHARE_ABSTRACT_KEY_value
        // 测试流程: 读取Params.SHARE_ABSTRACT_KEY常量值
        // 预期结果: 返回String类型，值为"ohos.extra.param.key.shareAbstract"
        @Expect(Params.SHARE_ABSTRACT_KEY, "ohos.extra.param.key.shareAbstract")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SHARE_ABSTRACT_KEY_type(): Unit {
        // 原始用例名: test_SHARE_ABSTRACT_KEY_type
        // 测试流程: 验证Params.SHARE_ABSTRACT_KEY的类型
        // 预期结果: 类型为String
        let value: String = Params.SHARE_ABSTRACT_KEY
        @Expect(value, Params.SHARE_ABSTRACT_KEY)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SHARE_ABSTRACT_KEY_in_onShare(): Unit {
        // 原始用例名: test_SHARE_ABSTRACT_KEY_in_onShare
        // 测试流程: 在跨端分享的onShare回调中，使用SHARE_ABSTRACT_KEY设置分享摘要
        // 预期结果: 分享摘要正确设置
        let params = HashMap<String, WantValueType>()
        params.add(Params.SHARE_ABSTRACT_KEY, WantValueType.StringValue("share-abstract"))
        let want = Want(parameters: params)
        @Expect(WantConstantTestHelper.hasParam(want, Params.SHARE_ABSTRACT_KEY), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SHARE_ABSTRACT_KEY_with_title(): Unit {
        // 原始用例名: test_SHARE_ABSTRACT_KEY_with_title
        // 测试流程: 同时使用SHARE_ABSTRACT_KEY和CONTENT_TITLE_KEY设置分享信息
        // 预期结果: 分享标题和摘要均正确设置
        let params = HashMap<String, WantValueType>()
        params.add(Params.SHARE_ABSTRACT_KEY, WantValueType.StringValue("share-abstract"))
        params.add(Params.CONTENT_TITLE_KEY, WantValueType.StringValue("share-title"))
        let want = Want(parameters: params)
        @Expect(want.parameters.size, 2)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SHARE_URL_KEY_value(): Unit {
        // 原始用例名: test_SHARE_URL_KEY_value
        // 测试流程: 读取Params.SHARE_URL_KEY常量值
        // 预期结果: 返回String类型，值为"ohos.extra.param.key.shareUrl"
        @Expect(Params.SHARE_URL_KEY, "ohos.extra.param.key.shareUrl")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SHARE_URL_KEY_type(): Unit {
        // 原始用例名: test_SHARE_URL_KEY_type
        // 测试流程: 验证Params.SHARE_URL_KEY的类型
        // 预期结果: 类型为String
        let value: String = Params.SHARE_URL_KEY
        @Expect(value, Params.SHARE_URL_KEY)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SHARE_URL_KEY_in_onShare(): Unit {
        // 原始用例名: test_SHARE_URL_KEY_in_onShare
        // 测试流程: 在跨端分享的onShare回调中，使用SHARE_URL_KEY设置分享URL
        // 预期结果: 分享URL正确设置
        let params = HashMap<String, WantValueType>()
        params.add(Params.SHARE_URL_KEY, WantValueType.StringValue("https://example.com"))
        let want = Want(parameters: params)
        @Expect(WantConstantTestHelper.hasParam(want, Params.SHARE_URL_KEY), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SHARE_URL_KEY_with_title_and_abstract(): Unit {
        // 原始用例名: test_SHARE_URL_KEY_with_title_and_abstract
        // 测试流程: 同时使用SHARE_URL_KEY、CONTENT_TITLE_KEY和SHARE_ABSTRACT_KEY设置分享信息
        // 预期结果: 分享URL、标题和摘要均正确设置
        let params = HashMap<String, WantValueType>()
        params.add(Params.SHARE_URL_KEY, WantValueType.StringValue("https://example.com"))
        params.add(Params.CONTENT_TITLE_KEY, WantValueType.StringValue("title"))
        params.add(Params.SHARE_ABSTRACT_KEY, WantValueType.StringValue("abstract"))
        let want = Want(parameters: params)
        @Expect(want.parameters.size, 3)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SUPPORT_CONTINUE_PAGE_STACK_KEY_value(): Unit {
        // 原始用例名: test_SUPPORT_CONTINUE_PAGE_STACK_KEY_value
        // 测试流程: 读取Params.SUPPORT_CONTINUE_PAGE_STACK_KEY常量值
        // 预期结果: 返回String类型，值为"ohos.extra.param.key.supportContinuePageStack"
        @Expect(Params.SUPPORT_CONTINUE_PAGE_STACK_KEY, "ohos.extra.param.key.supportContinuePageStack")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SUPPORT_CONTINUE_PAGE_STACK_KEY_type(): Unit {
        // 原始用例名: test_SUPPORT_CONTINUE_PAGE_STACK_KEY_type
        // 测试流程: 验证Params.SUPPORT_CONTINUE_PAGE_STACK_KEY的类型
        // 预期结果: 类型为String
        let value: String = Params.SUPPORT_CONTINUE_PAGE_STACK_KEY
        @Expect(value, Params.SUPPORT_CONTINUE_PAGE_STACK_KEY)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SUPPORT_CONTINUE_PAGE_STACK_KEY_default_true(): Unit {
        // 原始用例名: test_SUPPORT_CONTINUE_PAGE_STACK_KEY_default_true
        // 测试流程: 不设置SUPPORT_CONTINUE_PAGE_STACK_KEY参数进行跨端迁移
        // 预期结果: 默认自动迁移页面栈信息
        let want = Want()
        @Expect(WantConstantTestHelper.hasParam(want, Params.SUPPORT_CONTINUE_PAGE_STACK_KEY), false)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SUPPORT_CONTINUE_PAGE_STACK_KEY_set_false(): Unit {
        // 原始用例名: test_SUPPORT_CONTINUE_PAGE_STACK_KEY_set_false
        // 测试流程: 设置SUPPORT_CONTINUE_PAGE_STACK_KEY为false进行跨端迁移
        // 预期结果: 不迁移页面栈信息
        let params = HashMap<String, WantValueType>()
        params.add(Params.SUPPORT_CONTINUE_PAGE_STACK_KEY, WantValueType.BoolValue(false))
        let want = Want(parameters: params)
        @Expect(WantConstantTestHelper.hasParam(want, Params.SUPPORT_CONTINUE_PAGE_STACK_KEY), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SUPPORT_CONTINUE_PAGE_STACK_KEY_with_source_exit(): Unit {
        // 原始用例名: test_SUPPORT_CONTINUE_PAGE_STACK_KEY_with_source_exit
        // 测试流程: 同时设置SUPPORT_CONTINUE_PAGE_STACK_KEY和SUPPORT_CONTINUE_SOURCE_EXIT_KEY进行跨端迁移
        // 预期结果: 两个参数均生效，控制页面栈迁移和源端退出行为
        let params = HashMap<String, WantValueType>()
        params.add(Params.SUPPORT_CONTINUE_PAGE_STACK_KEY, WantValueType.BoolValue(false))
        params.add(Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY, WantValueType.BoolValue(false))
        let want = Want(parameters: params)
        @Expect(want.parameters.size, 2)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SUPPORT_CONTINUE_SOURCE_EXIT_KEY_value(): Unit {
        // 原始用例名: test_SUPPORT_CONTINUE_SOURCE_EXIT_KEY_value
        // 测试流程: 读取Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY常量值
        // 预期结果: 返回String类型，值为"ohos.extra.param.key.supportContinueSourceExit"
        @Expect(Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY, "ohos.extra.param.key.supportContinueSourceExit")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SUPPORT_CONTINUE_SOURCE_EXIT_KEY_type(): Unit {
        // 原始用例名: test_SUPPORT_CONTINUE_SOURCE_EXIT_KEY_type
        // 测试流程: 验证Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY的类型
        // 预期结果: 类型为String
        let value: String = Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY
        @Expect(value, Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SUPPORT_CONTINUE_SOURCE_EXIT_KEY_default_true(): Unit {
        // 原始用例名: test_SUPPORT_CONTINUE_SOURCE_EXIT_KEY_default_true
        // 测试流程: 不设置SUPPORT_CONTINUE_SOURCE_EXIT_KEY参数进行跨端迁移
        // 预期结果: 默认源端应用自动退出
        let want = Want()
        @Expect(WantConstantTestHelper.hasParam(want, Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY), false)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SUPPORT_CONTINUE_SOURCE_EXIT_KEY_set_false(): Unit {
        // 原始用例名: test_SUPPORT_CONTINUE_SOURCE_EXIT_KEY_set_false
        // 测试流程: 设置SUPPORT_CONTINUE_SOURCE_EXIT_KEY为false进行跨端迁移
        // 预期结果: 源端应用不退出
        let params = HashMap<String, WantValueType>()
        params.add(Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY, WantValueType.BoolValue(false))
        let want = Want(parameters: params)
        @Expect(WantConstantTestHelper.hasParam(want, Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_SUPPORT_CONTINUE_SOURCE_EXIT_KEY_with_page_stack(): Unit {
        // 原始用例名: test_SUPPORT_CONTINUE_SOURCE_EXIT_KEY_with_page_stack
        // 测试流程: 同时设置SUPPORT_CONTINUE_SOURCE_EXIT_KEY和SUPPORT_CONTINUE_PAGE_STACK_KEY进行跨端迁移
        // 预期结果: 两个参数均生效，控制源端退出和页面栈迁移行为
        let params = HashMap<String, WantValueType>()
        params.add(Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY, WantValueType.BoolValue(false))
        params.add(Params.SUPPORT_CONTINUE_PAGE_STACK_KEY, WantValueType.BoolValue(false))
        let want = Want(parameters: params)
        @Expect(want.parameters.size, 2)
    }
}
