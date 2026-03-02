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

import ohos.app.ability.start_options.*
import ohos.app.ability.ability_constant.WindowMode

@Test
class TestStartOptionsLlt {
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_windowMode_read_None(): Unit {
        // 原始用例名: test_windowMode_read_None
        // 测试流程: 创建StartOptions实例使用默认参数，读取windowMode属性
        // 预期结果: 返回None
        let opts = StartOptions()
        @Expect(match(opts.windowMode){ case None => true case Some(_) => false }, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_windowMode_read_Fullscreen(): Unit {
        // 原始用例名: test_windowMode_read_Fullscreen
        // 测试流程: 创建StartOptions实例，设置windowMode为WindowMode.WindowModeFullscreen，读取windowMode属性
        // 预期结果: 返回WindowMode.WindowModeFullscreen
        let opts = StartOptions(
            windowMode: Some(WindowMode.WindowModeFullscreen)
        )
        let isFullscreen = match (opts.windowMode) {
            case Some(v) => match (v) {
                case WindowMode.WindowModeFullscreen => true
                case _ => false
            }
            case None => false
        }
        @Expect(isFullscreen, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_windowMode_write_SplitPrimary(): Unit {
        // 原始用例名: test_windowMode_write_SplitPrimary
        // 测试流程: 创建StartOptions实例，将windowMode属性设置为WindowMode.WindowModeSplitPrimary
        // 预期结果: 成功设置windowMode属性为WindowMode.WindowModeSplitPrimary
        let opts = StartOptions()
        opts.windowMode = Some(WindowMode.WindowModeSplitPrimary)
        let isSplitPrimary = match (opts.windowMode) {
            case Some(v) => match (v) {
                case WindowMode.WindowModeSplitPrimary => true
                case _ => false
            }
            case None => false
        }
        @Expect(isSplitPrimary, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_windowMode_write_SplitSecondary(): Unit {
        // 原始用例名: test_windowMode_write_SplitSecondary
        // 测试流程: 创建StartOptions实例，将windowMode属性设置为WindowMode.WindowModeSplitSecondary
        // 预期结果: 成功设置windowMode属性为WindowMode.WindowModeSplitSecondary
        let opts = StartOptions()
        opts.windowMode = Some(WindowMode.WindowModeSplitSecondary)
        let isSplitSecondary = match (opts.windowMode) {
            case Some(v) => match (v) {
                case WindowMode.WindowModeSplitSecondary => true
                case _ => false
            }
            case None => false
        }
        @Expect(isSplitSecondary, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_windowMode_None_default_behavior(): Unit {
        // 原始用例名: test_windowMode_None_default_behavior
        // 测试流程: 创建StartOptions实例，windowMode设置为None，用于startAbility
        // 预期结果: 使用系统默认窗口模式
        let opts = StartOptions()
        @Expect(match(opts.windowMode){ case None => true case Some(_) => false }, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_windowMode_with_displayId(): Unit {
        // 原始用例名: test_windowMode_with_displayId
        // 测试流程: 同时设置windowMode为WindowMode.WindowModeFullscreen和displayId为0
        // 预期结果: 两个属性均正确设置，互不影响
        let opts = StartOptions(
            windowMode: Some(WindowMode.WindowModeFullscreen),
            displayId: 0
        )
        let isFullscreen = match (opts.windowMode) {
            case Some(v) => match (v) {
                case WindowMode.WindowModeFullscreen => true
                case _ => false
            }
            case None => false
        }
        @Expect(isFullscreen, true)
        @Expect(opts.displayId, 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_displayId_read_default(): Unit {
        // 原始用例名: test_displayId_read_default
        // 测试流程: 创建StartOptions实例使用默认参数，读取displayId属性
        // 预期结果: 返回0（主屏幕）
        let opts = StartOptions()
        @Expect(opts.displayId, 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_displayId_read_current_screen(): Unit {
        // 原始用例名: test_displayId_read_current_screen
        // 测试流程: 创建StartOptions实例，设置displayId为-1，读取displayId属性
        // 预期结果: 返回-1（当前屏幕）
        let opts = StartOptions(displayId: -1)
        @Expect(opts.displayId, -1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_displayId_write_main_screen(): Unit {
        // 原始用例名: test_displayId_write_main_screen
        // 测试流程: 创建StartOptions实例，将displayId属性设置为0
        // 预期结果: 成功设置displayId属性为0（主屏幕）
        let opts = StartOptions(displayId: -1)
        opts.displayId = 0
        @Expect(opts.displayId, 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_displayId_write_specified_screen(): Unit {
        // 原始用例名: test_displayId_write_specified_screen
        // 测试流程: 创建StartOptions实例，将displayId属性设置为1
        // 预期结果: 成功设置displayId属性为1（指定ID为1的屏幕）
        let opts = StartOptions()
        opts.displayId = 1
        @Expect(opts.displayId, 1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_displayId_negative_one(): Unit {
        // 原始用例名: test_displayId_negative_one
        // 测试流程: 设置displayId为-1，用于startAbility
        // 预期结果: UIAbility在当前屏幕启动
        let opts = StartOptions(displayId: -1)
        @Expect(opts.displayId, -1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_displayId_zero(): Unit {
        // 原始用例名: test_displayId_zero
        // 测试流程: 设置displayId为0，用于startAbility
        // 预期结果: UIAbility在主屏幕启动
        let opts = StartOptions(displayId: 0)
        @Expect(opts.displayId, 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_displayId_with_windowMode(): Unit {
        // 原始用例名: test_displayId_with_windowMode
        // 测试流程: 同时设置displayId为-1和windowMode为WindowMode.WindowModeFullscreen
        // 预期结果: 两个属性均正确设置，互不影响
        let opts = StartOptions(
            windowMode: Some(WindowMode.WindowModeFullscreen),
            displayId: -1
        )
        @Expect(opts.displayId, -1)
        let isFullscreen = match (opts.windowMode) {
            case Some(v) => match (v) {
                case WindowMode.WindowModeFullscreen => true
                case _ => false
            }
            case None => false
        }
        @Expect(isFullscreen, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_windowMode_None(): Unit {
        // 原始用例名: test_init_windowMode_None
        // 测试流程: 调用StartOptions(windowMode: None)创建实例
        // 预期结果: 成功创建StartOptions实例，windowMode为None
        let opts = StartOptions(windowMode: Option.None)
        @Expect(match(opts.windowMode){ case None => true case Some(_) => false }, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_windowMode_Fullscreen(): Unit {
        // 原始用例名: test_init_windowMode_Fullscreen
        // 测试流程: 调用StartOptions(windowMode: WindowMode.WindowModeFullscreen)创建实例
        // 预期结果: 成功创建StartOptions实例，windowMode为WindowMode.WindowModeFullscreen
        let opts = StartOptions(
            windowMode: Some(WindowMode.WindowModeFullscreen)
        )
        let isFullscreen = match (opts.windowMode) {
            case Some(v) => match (v) {
                case WindowMode.WindowModeFullscreen => true
                case _ => false
            }
            case None => false
        }
        @Expect(isFullscreen, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_windowMode_SplitPrimary(): Unit {
        // 原始用例名: test_init_windowMode_SplitPrimary
        // 测试流程: 调用StartOptions(windowMode: WindowMode.WindowModeSplitPrimary)创建实例
        // 预期结果: 成功创建StartOptions实例，windowMode为WindowMode.WindowModeSplitPrimary
        let opts = StartOptions(
            windowMode: Some(WindowMode.WindowModeSplitPrimary)
        )
        let isSplitPrimary = match (opts.windowMode) {
            case Some(v) => match (v) {
                case WindowMode.WindowModeSplitPrimary => true
                case _ => false
            }
            case None => false
        }
        @Expect(isSplitPrimary, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_windowMode_SplitSecondary(): Unit {
        // 原始用例名: test_init_windowMode_SplitSecondary
        // 测试流程: 调用StartOptions(windowMode: WindowMode.WindowModeSplitSecondary)创建实例
        // 预期结果: 成功创建StartOptions实例，windowMode为WindowMode.WindowModeSplitSecondary
        let opts = StartOptions(
            windowMode: Some(WindowMode.WindowModeSplitSecondary)
        )
        let isSplitSecondary = match (opts.windowMode) {
            case Some(v) => match (v) {
                case WindowMode.WindowModeSplitSecondary => true
                case _ => false
            }
            case None => false
        }
        @Expect(isSplitSecondary, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_displayId_negative_one(): Unit {
        // 原始用例名: test_init_displayId_negative_one
        // 测试流程: 调用StartOptions(displayId: -1)创建实例
        // 预期结果: 成功创建StartOptions实例，displayId为-1（当前屏幕）
        let opts = StartOptions(displayId: -1)
        @Expect(opts.displayId, -1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_displayId_zero(): Unit {
        // 原始用例名: test_init_displayId_zero
        // 测试流程: 调用StartOptions(displayId: 0)创建实例
        // 预期结果: 成功创建StartOptions实例，displayId为0（主屏幕）
        let opts = StartOptions(displayId: 0)
        @Expect(opts.displayId, 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_displayId_positive(): Unit {
        // 原始用例名: test_init_displayId_positive
        // 测试流程: 调用StartOptions(displayId: 1)创建实例
        // 预期结果: 成功创建StartOptions实例，displayId为1（指定ID为1的屏幕）
        let opts = StartOptions(displayId: 1)
        @Expect(opts.displayId, 1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_displayId_less_than_negative_one(): Unit {
        // 原始用例名: test_init_displayId_less_than_negative_one
        // 测试流程: 调用StartOptions(displayId: -2)创建实例
        // 预期结果: 实例创建成功但在实际使用时可能出现异常行为
        let opts = StartOptions(displayId: -2)
        @Expect(opts.displayId, -2)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_displayId_boundary_negative_one(): Unit {
        // 原始用例名: test_init_displayId_boundary_negative_one
        // 测试流程: 调用StartOptions(displayId: -1)创建实例
        // 预期结果: 成功创建StartOptions实例，displayId为-1
        let opts = StartOptions(displayId: -1)
        @Expect(opts.displayId, -1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_displayId_boundary_zero(): Unit {
        // 原始用例名: test_init_displayId_boundary_zero
        // 测试流程: 调用StartOptions(displayId: 0)创建实例
        // 预期结果: 成功创建StartOptions实例，displayId为0
        let opts = StartOptions(displayId: 0)
        @Expect(opts.displayId, 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_None_zero(): Unit {
        // 原始用例名: test_init_pairwise_None_zero
        // 测试流程: 调用StartOptions(windowMode: None, displayId: 0)创建实例
        // 预期结果: 成功创建StartOptions实例，windowMode为None，displayId为0
        let opts = StartOptions(windowMode: Option.None, displayId: 0)
        @Expect(match(opts.windowMode){ case None => true case Some(_) => false }, true)
        @Expect(opts.displayId, 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_Fullscreen_negative_one(): Unit {
        // 原始用例名: test_init_pairwise_Fullscreen_negative_one
        // 测试流程: 调用StartOptions(windowMode: WindowMode.WindowModeFullscreen, displayId: -1)创建实例
        // 预期结果: 成功创建StartOptions实例，windowMode为WindowMode.WindowModeFullscreen，displayId为-1
        let opts = StartOptions(
            windowMode: Some(WindowMode.WindowModeFullscreen),
            displayId: -1
        )
        let isFullscreen = match (opts.windowMode) {
            case Some(v) => match (v) {
                case WindowMode.WindowModeFullscreen => true
                case _ => false
            }
            case None => false
        }
        @Expect(isFullscreen, true)
        @Expect(opts.displayId, -1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_SplitPrimary_positive(): Unit {
        // 原始用例名: test_init_pairwise_SplitPrimary_positive
        // 测试流程: 调用StartOptions(windowMode: WindowMode.WindowModeSplitPrimary, displayId: 1)创建实例
        // 预期结果: 成功创建StartOptions实例，windowMode为WindowMode.WindowModeSplitPrimary，displayId为1
        let opts = StartOptions(
            windowMode: Some(WindowMode.WindowModeSplitPrimary),
            displayId: 1
        )
        let isSplitPrimary = match (opts.windowMode) {
            case Some(v) => match (v) {
                case WindowMode.WindowModeSplitPrimary => true
                case _ => false
            }
            case None => false
        }
        @Expect(isSplitPrimary, true)
        @Expect(opts.displayId, 1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_SplitSecondary_zero(): Unit {
        // 原始用例名: test_init_pairwise_SplitSecondary_zero
        // 测试流程: 调用StartOptions(windowMode: WindowMode.WindowModeSplitSecondary, displayId: 0)创建实例
        // 预期结果: 成功创建StartOptions实例，windowMode为WindowMode.WindowModeSplitSecondary，displayId为0
        let opts = StartOptions(
            windowMode: Some(WindowMode.WindowModeSplitSecondary),
            displayId: 0
        )
        let isSplitSecondary = match (opts.windowMode) {
            case Some(v) => match (v) {
                case WindowMode.WindowModeSplitSecondary => true
                case _ => false
            }
            case None => false
        }
        @Expect(isSplitSecondary, true)
        @Expect(opts.displayId, 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_return_StartOptions_instance(): Unit {
        // 原始用例名: test_init_return_StartOptions_instance
        // 测试流程: 调用StartOptions()构造函数
        // 预期结果: 返回StartOptions类型的实例
        let opts = StartOptions()
        @Expect(opts is StartOptions, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_default_values(): Unit {
        // 原始用例名: test_init_default_values
        // 测试流程: 调用StartOptions()使用所有默认参数创建实例
        // 预期结果: 成功创建StartOptions实例，windowMode为None，displayId为0
        let opts = StartOptions()
        @Expect(match(opts.windowMode){ case None => true case Some(_) => false }, true)
        @Expect(opts.displayId, 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_only_windowMode(): Unit {
        // 原始用例名: test_init_only_windowMode
        // 测试流程: 调用StartOptions(windowMode: WindowMode.WindowModeFullscreen)只传递windowMode参数
        // 预期结果: 成功创建StartOptions实例，windowMode为WindowMode.WindowModeFullscreen，displayId为默认值0
        let opts = StartOptions(
            windowMode: Some(WindowMode.WindowModeFullscreen)
        )
        let isFullscreen = match (opts.windowMode) {
            case Some(v) => match (v) {
                case WindowMode.WindowModeFullscreen => true
                case _ => false
            }
            case None => false
        }
        @Expect(isFullscreen, true)
        @Expect(opts.displayId, 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_only_displayId(): Unit {
        // 原始用例名: test_init_only_displayId
        // 测试流程: 调用StartOptions(displayId: -1)只传递displayId参数
        // 预期结果: 成功创建StartOptions实例，windowMode为默认值None，displayId为-1
        let opts = StartOptions(displayId: -1)
        @Expect(match(opts.windowMode){ case None => true case Some(_) => false }, true)
        @Expect(opts.displayId, -1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_use_in_startAbility(): Unit {
        // 原始用例名: test_init_use_in_startAbility
        // 测试流程: 创建StartOptions(windowMode: WindowMode.WindowModeFullscreen, displayId: 0)实例，作为startAbility的参数使用
        // 预期结果: startAbility正常执行，目标UIAbility以全屏模式在主屏幕启动
        let opts = StartOptions(
            windowMode: Some(WindowMode.WindowModeFullscreen),
            displayId: 0
        )
        let isFullscreen = match (opts.windowMode) {
            case Some(v) => match (v) {
                case WindowMode.WindowModeFullscreen => true
                case _ => false
            }
            case None => false
        }
        @Expect(isFullscreen, true)
        @Expect(opts.displayId, 0)
    }
}
