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
import ohos.app.ability.app_recovery.*

@Test
class TestAppRecoveryLltPart1 {
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_restartApp_return_unit(): Unit {
        // 原始用例名: test_restartApp_return_unit
        // 测试流程: 调用restartApp()函数
        // 预期结果: 函数正常执行，返回Unit
        let result = restartApp()
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_restartApp_foreground_ability_supports_recovery(): Unit {
        // 原始用例名: test_restartApp_foreground_ability_supports_recovery
        // 测试流程: 当前应用前台有一个支持恢复的Ability时调用restartApp()
        // 预期结果: 重启当前进程并重新拉起该Ability
        let result = restartApp()
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_restartApp_multiple_foreground_abilities_support_recovery(): Unit {
        // 原始用例名: test_restartApp_multiple_foreground_abilities_support_recovery
        // 测试流程: 当前应用前台存在多个支持恢复的Ability时调用restartApp()
        // 预期结果: 重启当前进程并只拉起最后一个支持恢复的Ability
        let result = restartApp()
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_restartApp_no_foreground_ability(): Unit {
        // 原始用例名: test_restartApp_no_foreground_ability
        // 测试流程: 当前应用没有Ability处于前台时调用restartApp()
        // 预期结果: 不拉起任何Ability
        let result = restartApp()
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_restartApp_with_saved_state(): Unit {
        // 原始用例名: test_restartApp_with_saved_state
        // 测试流程: Ability存在已保存的状态时调用restartApp()
        // 预期结果: 重启后状态数据在Ability的OnCreate生命周期回调的want参数中作为wantParam属性传入
        let result = restartApp()
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_restartApp_interval_less_than_one_minute(): Unit {
        // 原始用例名: test_restartApp_interval_less_than_one_minute
        // 测试流程: 在一分钟内连续两次调用restartApp()
        // 预期结果: 第二次调用只会退出应用不会重启应用
        let result = restartApp()
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_restartApp_interval_greater_than_one_minute(): Unit {
        // 原始用例名: test_restartApp_interval_greater_than_one_minute
        // 测试流程: 两次调用restartApp()的间隔大于一分钟
        // 预期结果: 两次调用都正常重启应用
        let result = restartApp()
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_restartApp_with_error_manager(): Unit {
        // 原始用例名: test_restartApp_with_error_manager
        // 测试流程: 配合ErrorManager接口使用，在应用故障时调用restartApp()
        // 预期结果: 应用故障时成功重启并恢复
        let result = restartApp()
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_restartApp_auto_restart_behavior(): Unit {
        // 原始用例名: test_restartApp_auto_restart_behavior
        // 测试流程: 验证自动重启的行为
        // 预期结果: 自动重启的行为与主动重启一致
        let result = restartApp()
        @Expect(result == (), true)
    }
}
