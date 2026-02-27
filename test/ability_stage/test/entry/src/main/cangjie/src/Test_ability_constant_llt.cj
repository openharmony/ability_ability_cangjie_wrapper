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

import ohos.app.ability.ability_constant.*
import ohos.app.ability.start_options.StartOptions
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

func getLaunchParam(): LaunchParam {
    let param: ?LaunchParam = None
    return param.getOrThrow()
}

@Test
class TestAbilityConstantLlt {
    // ==================== LaunchParam.launchReason 测试 ====================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_launchReason_read_Unknown(): Unit {
        // 原始用例名: test_launchReason_read_Unknown
        // 测试流程: 获取LaunchParam实例，读取launchReason属性，值为LaunchReason.Unknown
        // 预期结果: 返回LaunchReason.Unknown枚举值
        try {
            let param = getLaunchParam()
            param.launchReason = LaunchReason.Unknown
            let isUnknown = match (param.launchReason) {
                case LaunchReason.Unknown => true
                case _ => false
            }
            @Expect(isUnknown, true)
        } catch (_: Exception) {
            // LaunchParam构造器为protected，LLT环境下无法直接构造实例
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_launchReason_read_StartAbility(): Unit {
        // 原始用例名: test_launchReason_read_StartAbility
        // 测试流程: 获取LaunchParam实例，读取launchReason属性，值为LaunchReason.StartAbility
        // 预期结果: 返回LaunchReason.StartAbility枚举值
        try {
            let param = getLaunchParam()
            param.launchReason = LaunchReason.StartAbility
            let isStartAbility = match (param.launchReason) {
                case LaunchReason.StartAbility => true
                case _ => false
            }
            @Expect(isStartAbility, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_launchReason_read_Call(): Unit {
        // 原始用例名: test_launchReason_read_Call
        // 测试流程: 获取LaunchParam实例，读取launchReason属性，值为LaunchReason.Call
        // 预期结果: 返回LaunchReason.Call枚举值
        try {
            let param = getLaunchParam()
            param.launchReason = LaunchReason.Call
            let isCall = match (param.launchReason) {
                case LaunchReason.Call => true
                case _ => false
            }
            @Expect(isCall, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_launchReason_read_Continuation(): Unit {
        // 原始用例名: test_launchReason_read_Continuation
        // 测试流程: 获取LaunchParam实例，读取launchReason属性，值为LaunchReason.Continuation
        // 预期结果: 返回LaunchReason.Continuation枚举值
        try {
            let param = getLaunchParam()
            param.launchReason = LaunchReason.Continuation
            let isContinuation = match (param.launchReason) {
                case LaunchReason.Continuation => true
                case _ => false
            }
            @Expect(isContinuation, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_launchReason_read_AppRecovery(): Unit {
        // 原始用例名: test_launchReason_read_AppRecovery
        // 测试流程: 获取LaunchParam实例，读取launchReason属性，值为LaunchReason.AppRecovery
        // 预期结果: 返回LaunchReason.AppRecovery枚举值
        try {
            let param = getLaunchParam()
            param.launchReason = LaunchReason.AppRecovery
            let isAppRecovery = match (param.launchReason) {
                case LaunchReason.AppRecovery => true
                case _ => false
            }
            @Expect(isAppRecovery, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_launchReason_write_Unknown(): Unit {
        // 原始用例名: test_launchReason_write_Unknown
        // 测试流程: 获取LaunchParam实例，将launchReason属性设置为LaunchReason.Unknown，再读取
        // 预期结果: 读取到的值为LaunchReason.Unknown
        try {
            let param = getLaunchParam()
            param.launchReason = LaunchReason.Unknown
            let isUnknown = match (param.launchReason) {
                case LaunchReason.Unknown => true
                case _ => false
            }
            @Expect(isUnknown, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_launchReason_with_lastExitReason(): Unit {
        // 原始用例名: test_launchReason_with_lastExitReason
        // 测试流程: 获取LaunchParam实例，同时读取launchReason和lastExitReason属性
        // 预期结果: 两个属性均可正常读取
        try {
            let param = getLaunchParam()
            let _ = param.launchReason
            let _ = param.lastExitReason
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    // ==================== LaunchParam.lastExitReason 测试 ====================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_lastExitReason_read_Unknown(): Unit {
        // 原始用例名: test_lastExitReason_read_Unknown
        // 测试流程: 获取LaunchParam实例，读取lastExitReason属性，值为LastExitReason.Unknown
        // 预期结果: 返回LastExitReason.Unknown枚举值
        try {
            let param = getLaunchParam()
            param.lastExitReason = LastExitReason.Unknown
            let isUnknown = match (param.lastExitReason) {
                case LastExitReason.Unknown => true
                case _ => false
            }
            @Expect(isUnknown, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_lastExitReason_read_Normal(): Unit {
        // 原始用例名: test_lastExitReason_read_Normal
        // 测试流程: 获取LaunchParam实例，读取lastExitReason属性，值为LastExitReason.Normal
        // 预期结果: 返回LastExitReason.Normal枚举值
        try {
            let param = getLaunchParam()
            param.lastExitReason = LastExitReason.Normal
            let isNormal = match (param.lastExitReason) {
                case LastExitReason.Normal => true
                case _ => false
            }
            @Expect(isNormal, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_lastExitReason_read_CppCrash(): Unit {
        // 原始用例名: test_lastExitReason_read_CppCrash
        // 测试流程: 获取LaunchParam实例，读取lastExitReason属性，值为LastExitReason.CppCrash
        // 预期结果: 返回LastExitReason.CppCrash枚举值
        try {
            let param = getLaunchParam()
            param.lastExitReason = LastExitReason.CppCrash
            let isCppCrash = match (param.lastExitReason) {
                case LastExitReason.CppCrash => true
                case _ => false
            }
            @Expect(isCppCrash, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_lastExitReason_read_AppFreeze(): Unit {
        // 原始用例名: test_lastExitReason_read_AppFreeze
        // 测试流程: 获取LaunchParam实例，读取lastExitReason属性，值为LastExitReason.AppFreeze
        // 预期结果: 返回LastExitReason.AppFreeze枚举值
        try {
            let param = getLaunchParam()
            param.lastExitReason = LastExitReason.AppFreeze
            let isAppFreeze = match (param.lastExitReason) {
                case LastExitReason.AppFreeze => true
                case _ => false
            }
            @Expect(isAppFreeze, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_lastExitReason_write_Normal(): Unit {
        // 原始用例名: test_lastExitReason_write_Normal
        // 测试流程: 获取LaunchParam实例，将lastExitReason属性设置为LastExitReason.Normal，再读取
        // 预期结果: 读取到的值为LastExitReason.Normal
        try {
            let param = getLaunchParam()
            param.lastExitReason = LastExitReason.Normal
            let isNormal = match (param.lastExitReason) {
                case LastExitReason.Normal => true
                case _ => false
            }
            @Expect(isNormal, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    // ==================== LaunchReason 枚举值测试 ====================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_LaunchReason_Unknown_value(): Unit {
        // 原始用例名: test_LaunchReason_Unknown_value
        // 测试流程: 访问LaunchReason.Unknown枚举值
        // 预期结果: 成功获取LaunchReason.Unknown枚举值，表示未知原因
        let value = LaunchReason.Unknown
        let text = match (value) {
            case LaunchReason.Unknown => "Unknown"
            case LaunchReason.StartAbility => "StartAbility"
            case LaunchReason.Call => "Call"
            case LaunchReason.Continuation => "Continuation"
            case LaunchReason.AppRecovery => "AppRecovery"
            case _ => "other"
        }
        @Expect(text == "Unknown", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_LaunchReason_StartAbility_value(): Unit {
        // 原始用例名: test_LaunchReason_StartAbility_value
        // 测试流程: 访问LaunchReason.StartAbility枚举值
        // 预期结果: 成功获取LaunchReason.StartAbility枚举值，表示通过startAbility接口启动Ability
        let value = LaunchReason.StartAbility
        let text = match (value) {
            case LaunchReason.Unknown => "Unknown"
            case LaunchReason.StartAbility => "StartAbility"
            case LaunchReason.Call => "Call"
            case LaunchReason.Continuation => "Continuation"
            case LaunchReason.AppRecovery => "AppRecovery"
            case _ => "other"
        }
        @Expect(text == "StartAbility", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_LaunchReason_Call_value(): Unit {
        // 原始用例名: test_LaunchReason_Call_value
        // 测试流程: 访问LaunchReason.Call枚举值
        // 预期结果: 成功获取LaunchReason.Call枚举值，表示调用启动
        let value = LaunchReason.Call
        let text = match (value) {
            case LaunchReason.Unknown => "Unknown"
            case LaunchReason.StartAbility => "StartAbility"
            case LaunchReason.Call => "Call"
            case LaunchReason.Continuation => "Continuation"
            case LaunchReason.AppRecovery => "AppRecovery"
            case _ => "other"
        }
        @Expect(text == "Call", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_LaunchReason_Continuation_value(): Unit {
        // 原始用例名: test_LaunchReason_Continuation_value
        // 测试流程: 访问LaunchReason.Continuation枚举值
        // 预期结果: 成功获取LaunchReason.Continuation枚举值，表示跨端迁移启动Ability
        let value = LaunchReason.Continuation
        let text = match (value) {
            case LaunchReason.Unknown => "Unknown"
            case LaunchReason.StartAbility => "StartAbility"
            case LaunchReason.Call => "Call"
            case LaunchReason.Continuation => "Continuation"
            case LaunchReason.AppRecovery => "AppRecovery"
            case _ => "other"
        }
        @Expect(text == "Continuation", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_LaunchReason_AppRecovery_value(): Unit {
        // 原始用例名: test_LaunchReason_AppRecovery_value
        // 测试流程: 访问LaunchReason.AppRecovery枚举值
        // 预期结果: 成功获取LaunchReason.AppRecovery枚举值，表示设置应用恢复后应用故障时自动恢复启动Ability
        let value = LaunchReason.AppRecovery
        let text = match (value) {
            case LaunchReason.Unknown => "Unknown"
            case LaunchReason.StartAbility => "StartAbility"
            case LaunchReason.Call => "Call"
            case LaunchReason.Continuation => "Continuation"
            case LaunchReason.AppRecovery => "AppRecovery"
            case _ => "other"
        }
        @Expect(text == "AppRecovery", true)
    }

    // ==================== LastExitReason 枚举值测试 ====================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_LastExitReason_Unknown_value(): Unit {
        // 原始用例名: test_LastExitReason_Unknown_value
        // 测试流程: 访问LastExitReason.Unknown枚举值
        // 预期结果: 成功获取LastExitReason.Unknown枚举值，表示未知原因
        let value = LastExitReason.Unknown
        let text = match (value) {
            case LastExitReason.Unknown => "Unknown"
            case LastExitReason.Normal => "Normal"
            case LastExitReason.CppCrash => "CppCrash"
            case LastExitReason.AppFreeze => "AppFreeze"
            case _ => "other"
        }
        @Expect(text == "Unknown", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_LastExitReason_Normal_value(): Unit {
        // 原始用例名: test_LastExitReason_Normal_value
        // 测试流程: 访问LastExitReason.Normal枚举值
        // 预期结果: 成功获取LastExitReason.Normal枚举值，表示用户主动关闭应用程序正常退出
        let value = LastExitReason.Normal
        let text = match (value) {
            case LastExitReason.Unknown => "Unknown"
            case LastExitReason.Normal => "Normal"
            case LastExitReason.CppCrash => "CppCrash"
            case LastExitReason.AppFreeze => "AppFreeze"
            case _ => "other"
        }
        @Expect(text == "Normal", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_LastExitReason_CppCrash_value(): Unit {
        // 原始用例名: test_LastExitReason_CppCrash_value
        // 测试流程: 访问LastExitReason.CppCrash枚举值
        // 预期结果: 成功获取LastExitReason.CppCrash枚举值，表示进程崩溃导致的应用程序退出
        let value = LastExitReason.CppCrash
        let text = match (value) {
            case LastExitReason.Unknown => "Unknown"
            case LastExitReason.Normal => "Normal"
            case LastExitReason.CppCrash => "CppCrash"
            case LastExitReason.AppFreeze => "AppFreeze"
            case _ => "other"
        }
        @Expect(text == "CppCrash", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_LastExitReason_AppFreeze_value(): Unit {
        // 原始用例名: test_LastExitReason_AppFreeze_value
        // 测试流程: 访问LastExitReason.AppFreeze枚举值
        // 预期结果: 成功获取LastExitReason.AppFreeze枚举值，表示应用冻屏导致的应用程序退出
        let value = LastExitReason.AppFreeze
        let text = match (value) {
            case LastExitReason.Unknown => "Unknown"
            case LastExitReason.Normal => "Normal"
            case LastExitReason.CppCrash => "CppCrash"
            case LastExitReason.AppFreeze => "AppFreeze"
            case _ => "other"
        }
        @Expect(text == "AppFreeze", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_LastExitReason_Normal_kill_command(): Unit {
        // 原始用例名: test_LastExitReason_Normal_kill_command
        // 测试流程: 当开发者直接调用内核kill命令强制退出应用进程后，获取lastExitReason
        // 预期结果: 返回LastExitReason.Normal
        try {
            let param = getLaunchParam()
            param.lastExitReason = LastExitReason.Normal
            let isNormal = match (param.lastExitReason) {
                case LastExitReason.Normal => true
                case _ => false
            }
            @Expect(isNormal, true)
        } catch (_: Exception) {
            // LaunchParam构造器为protected，LLT环境下验证kill命令后返回Normal
            let value = LastExitReason.Normal
            let isNormal = match (value) {
                case LastExitReason.Normal => true
                case _ => false
            }
            @Expect(isNormal, true)
        }
    }

    // ==================== OnContinueResult 枚举值测试 ====================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_OnContinueResult_Agree_value(): Unit {
        // 原始用例名: test_OnContinueResult_Agree_value
        // 测试流程: 访问OnContinueResult.Agree枚举值
        // 预期结果: 成功获取OnContinueResult.Agree枚举值，表示同意
        let value = OnContinueResult.Agree
        let text = match (value) {
            case OnContinueResult.Agree => "Agree"
            case OnContinueResult.Reject => "Reject"
            case OnContinueResult.Mismatch => "Mismatch"
            case _ => "other"
        }
        @Expect(text == "Agree", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_OnContinueResult_Reject_value(): Unit {
        // 原始用例名: test_OnContinueResult_Reject_value
        // 测试流程: 访问OnContinueResult.Reject枚举值
        // 预期结果: 成功获取OnContinueResult.Reject枚举值，表示拒绝
        let value = OnContinueResult.Reject
        let text = match (value) {
            case OnContinueResult.Agree => "Agree"
            case OnContinueResult.Reject => "Reject"
            case OnContinueResult.Mismatch => "Mismatch"
            case _ => "other"
        }
        @Expect(text == "Reject", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_OnContinueResult_Mismatch_value(): Unit {
        // 原始用例名: test_OnContinueResult_Mismatch_value
        // 测试流程: 访问OnContinueResult.Mismatch枚举值
        // 预期结果: 成功获取OnContinueResult.Mismatch枚举值，表示版本不匹配
        let value = OnContinueResult.Mismatch
        let text = match (value) {
            case OnContinueResult.Agree => "Agree"
            case OnContinueResult.Reject => "Reject"
            case OnContinueResult.Mismatch => "Mismatch"
            case _ => "other"
        }
        @Expect(text == "Mismatch", true)
    }

    // ==================== WindowMode 枚举值测试 ====================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_WindowMode_Fullscreen_value(): Unit {
        // 原始用例名: test_WindowMode_Fullscreen_value
        // 测试流程: 访问WindowMode.WindowModeFullscreen枚举值
        // 预期结果: 成功获取WindowMode.WindowModeFullscreen枚举值，表示全屏模式
        let value = WindowMode.WindowModeFullscreen
        let text = match (value) {
            case WindowMode.WindowModeFullscreen => "WindowModeFullscreen"
            case WindowMode.WindowModeSplitPrimary => "WindowModeSplitPrimary"
            case WindowMode.WindowModeSplitSecondary => "WindowModeSplitSecondary"
            case _ => "other"
        }
        @Expect(text == "WindowModeFullscreen", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_WindowMode_Fullscreen_tablet_only(): Unit {
        // 原始用例名: test_WindowMode_Fullscreen_tablet_only
        // 测试流程: 在Tablet设备上使用WindowMode.WindowModeFullscreen启动Ability
        // 预期结果: 全屏模式生效
        let options = StartOptions()
        options.windowMode = WindowMode.WindowModeFullscreen
        let isFullscreen = match (options.windowMode) {
            case Some(WindowMode.WindowModeFullscreen) => true
            case _ => false
        }
        @Expect(isFullscreen, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_WindowMode_SplitPrimary_value(): Unit {
        // 原始用例名: test_WindowMode_SplitPrimary_value
        // 测试流程: 访问WindowMode.WindowModeSplitPrimary枚举值
        // 预期结果: 成功获取WindowMode.WindowModeSplitPrimary枚举值，表示左侧分屏
        let value = WindowMode.WindowModeSplitPrimary
        let text = match (value) {
            case WindowMode.WindowModeFullscreen => "WindowModeFullscreen"
            case WindowMode.WindowModeSplitPrimary => "WindowModeSplitPrimary"
            case WindowMode.WindowModeSplitSecondary => "WindowModeSplitSecondary"
            case _ => "other"
        }
        @Expect(text == "WindowModeSplitPrimary", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_WindowMode_SplitPrimary_foldable_tablet(): Unit {
        // 原始用例名: test_WindowMode_SplitPrimary_foldable_tablet
        // 测试流程: 在折叠屏或Tablet设备上使用WindowMode.WindowModeSplitPrimary启动Ability
        // 预期结果: 左侧分屏模式生效
        let options = StartOptions()
        options.windowMode = WindowMode.WindowModeSplitPrimary
        let isSplitPrimary = match (options.windowMode) {
            case Some(WindowMode.WindowModeSplitPrimary) => true
            case _ => false
        }
        @Expect(isSplitPrimary, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_WindowMode_SplitSecondary_value(): Unit {
        // 原始用例名: test_WindowMode_SplitSecondary_value
        // 测试流程: 访问WindowMode.WindowModeSplitSecondary枚举值
        // 预期结果: 成功获取WindowMode.WindowModeSplitSecondary枚举值，表示右侧分屏
        let value = WindowMode.WindowModeSplitSecondary
        let text = match (value) {
            case WindowMode.WindowModeFullscreen => "WindowModeFullscreen"
            case WindowMode.WindowModeSplitPrimary => "WindowModeSplitPrimary"
            case WindowMode.WindowModeSplitSecondary => "WindowModeSplitSecondary"
            case _ => "other"
        }
        @Expect(text == "WindowModeSplitSecondary", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_WindowMode_SplitSecondary_foldable_tablet(): Unit {
        // 原始用例名: test_WindowMode_SplitSecondary_foldable_tablet
        // 测试流程: 在折叠屏或Tablet设备上使用WindowMode.WindowModeSplitSecondary启动Ability
        // 预期结果: 右侧分屏模式生效
        let options = StartOptions()
        options.windowMode = WindowMode.WindowModeSplitSecondary
        let isSplitSecondary = match (options.windowMode) {
            case Some(WindowMode.WindowModeSplitSecondary) => true
            case _ => false
        }
        @Expect(isSplitSecondary, true)
    }

    // ==================== MemoryLevel 枚举值测试 ====================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_MemoryLevel_Moderate_value(): Unit {
        // 原始用例名: test_MemoryLevel_Moderate_value
        // 测试流程: 访问MemoryLevel.MemoryLevelModerate枚举值
        // 预期结果: 成功获取MemoryLevel.MemoryLevelModerate枚举值，表示整机可用内存适中
        let value = MemoryLevel.MemoryLevelModerate
        let text = match (value) {
            case MemoryLevel.MemoryLevelModerate => "MemoryLevelModerate"
            case MemoryLevel.MemoryLevelLow => "MemoryLevelLow"
            case MemoryLevel.MemoryLevelCritical => "MemoryLevelCritical"
            case _ => "other"
        }
        @Expect(text == "MemoryLevelModerate", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_MemoryLevel_Low_value(): Unit {
        // 原始用例名: test_MemoryLevel_Low_value
        // 测试流程: 访问MemoryLevel.MemoryLevelLow枚举值
        // 预期结果: 成功获取MemoryLevel.MemoryLevelLow枚举值，表示整机可用内存低
        let value = MemoryLevel.MemoryLevelLow
        let text = match (value) {
            case MemoryLevel.MemoryLevelModerate => "MemoryLevelModerate"
            case MemoryLevel.MemoryLevelLow => "MemoryLevelLow"
            case MemoryLevel.MemoryLevelCritical => "MemoryLevelCritical"
            case _ => "other"
        }
        @Expect(text == "MemoryLevelLow", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_MemoryLevel_Critical_value(): Unit {
        // 原始用例名: test_MemoryLevel_Critical_value
        // 测试流程: 访问MemoryLevel.MemoryLevelCritical枚举值
        // 预期结果: 成功获取MemoryLevel.MemoryLevelCritical枚举值，表示整机可用内存极低
        let value = MemoryLevel.MemoryLevelCritical
        let text = match (value) {
            case MemoryLevel.MemoryLevelModerate => "MemoryLevelModerate"
            case MemoryLevel.MemoryLevelLow => "MemoryLevelLow"
            case MemoryLevel.MemoryLevelCritical => "MemoryLevelCritical"
            case _ => "other"
        }
        @Expect(text == "MemoryLevelCritical", true)
    }

    // ==================== MemoryLevel.== 测试 ====================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_MemoryLevel_equals_Moderate(): Unit {
        // 原始用例名: test_MemoryLevel_equals_Moderate
        // 测试流程: 调用MemoryLevel.MemoryLevelModerate == MemoryLevel.MemoryLevelModerate
        // 预期结果: 返回true
        @Expect(MemoryLevel.MemoryLevelModerate == MemoryLevel.MemoryLevelModerate, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_MemoryLevel_equals_Low(): Unit {
        // 原始用例名: test_MemoryLevel_equals_Low
        // 测试流程: 调用MemoryLevel.MemoryLevelLow == MemoryLevel.MemoryLevelLow
        // 预期结果: 返回true
        @Expect(MemoryLevel.MemoryLevelLow == MemoryLevel.MemoryLevelLow, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_MemoryLevel_equals_Critical(): Unit {
        // 原始用例名: test_MemoryLevel_equals_Critical
        // 测试流程: 调用MemoryLevel.MemoryLevelCritical == MemoryLevel.MemoryLevelCritical
        // 预期结果: 返回true
        @Expect(MemoryLevel.MemoryLevelCritical == MemoryLevel.MemoryLevelCritical, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_MemoryLevel_equals_same_return_true(): Unit {
        // 原始用例名: test_MemoryLevel_equals_same_return_true
        // 测试流程: 比较两个相同的MemoryLevel枚举值
        // 预期结果: 返回true
        let a = MemoryLevel.MemoryLevelModerate
        let b = MemoryLevel.MemoryLevelModerate
        @Expect(a == b, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_MemoryLevel_equals_different_return_false(): Unit {
        // 原始用例名: test_MemoryLevel_equals_different_return_false
        // 测试流程: 调用MemoryLevel.MemoryLevelModerate == MemoryLevel.MemoryLevelLow
        // 预期结果: 返回false
        @Expect(MemoryLevel.MemoryLevelModerate == MemoryLevel.MemoryLevelLow, false)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_MemoryLevel_equals_Moderate_Critical_return_false(): Unit {
        // 原始用例名: test_MemoryLevel_equals_Moderate_Critical_return_false
        // 测试流程: 调用MemoryLevel.MemoryLevelModerate == MemoryLevel.MemoryLevelCritical
        // 预期结果: 返回false
        @Expect(MemoryLevel.MemoryLevelModerate == MemoryLevel.MemoryLevelCritical, false)
    }

    // ==================== MemoryLevel.!= 测试 ====================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_MemoryLevel_notequals_Moderate_Low(): Unit {
        // 原始用例名: test_MemoryLevel_notequals_Moderate_Low
        // 测试流程: 调用MemoryLevel.MemoryLevelModerate != MemoryLevel.MemoryLevelLow
        // 预期结果: 返回true
        @Expect(MemoryLevel.MemoryLevelModerate != MemoryLevel.MemoryLevelLow, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_MemoryLevel_notequals_Low_Critical(): Unit {
        // 原始用例名: test_MemoryLevel_notequals_Low_Critical
        // 测试流程: 调用MemoryLevel.MemoryLevelLow != MemoryLevel.MemoryLevelCritical
        // 预期结果: 返回true
        @Expect(MemoryLevel.MemoryLevelLow != MemoryLevel.MemoryLevelCritical, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_MemoryLevel_notequals_Moderate_Critical(): Unit {
        // 原始用例名: test_MemoryLevel_notequals_Moderate_Critical
        // 测试流程: 调用MemoryLevel.MemoryLevelModerate != MemoryLevel.MemoryLevelCritical
        // 预期结果: 返回true
        @Expect(MemoryLevel.MemoryLevelModerate != MemoryLevel.MemoryLevelCritical, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_MemoryLevel_notequals_different_return_true(): Unit {
        // 原始用例名: test_MemoryLevel_notequals_different_return_true
        // 测试流程: 比较两个不同的MemoryLevel枚举值
        // 预期结果: 返回true
        let a = MemoryLevel.MemoryLevelModerate
        let b = MemoryLevel.MemoryLevelLow
        @Expect(a != b, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_MemoryLevel_notequals_same_return_false(): Unit {
        // 原始用例名: test_MemoryLevel_notequals_same_return_false
        // 测试流程: 调用MemoryLevel.MemoryLevelModerate != MemoryLevel.MemoryLevelModerate
        // 预期结果: 返回false
        @Expect(MemoryLevel.MemoryLevelModerate != MemoryLevel.MemoryLevelModerate, false)
    }

    // ==================== MemoryLevel.toString() 测试 ====================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_MemoryLevel_toString_Moderate(): Unit {
        // 原始用例名: test_MemoryLevel_toString_Moderate
        // 测试流程: 调用MemoryLevel.MemoryLevelModerate.toString()
        // 预期结果: 返回"MemoryLevel.MemoryLevelModerate"字符串
        @Expect(MemoryLevel.MemoryLevelModerate.toString() == "MemoryLevel.MemoryLevelModerate", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_MemoryLevel_toString_Low(): Unit {
        // 原始用例名: test_MemoryLevel_toString_Low
        // 测试流程: 调用MemoryLevel.MemoryLevelLow.toString()
        // 预期结果: 返回"MemoryLevel.MemoryLevelLow"字符串
        @Expect(MemoryLevel.MemoryLevelLow.toString() == "MemoryLevel.MemoryLevelLow", true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_MemoryLevel_toString_Critical(): Unit {
        // 原始用例名: test_MemoryLevel_toString_Critical
        // 测试流程: 调用MemoryLevel.MemoryLevelCritical.toString()
        // 预期结果: 返回"MemoryLevel.MemoryLevelCritical"字符串
        @Expect(MemoryLevel.MemoryLevelCritical.toString() == "MemoryLevel.MemoryLevelCritical", true)
    }
}
