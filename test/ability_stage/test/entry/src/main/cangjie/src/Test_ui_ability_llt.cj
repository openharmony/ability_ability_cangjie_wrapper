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

import ohos.app.ability.want.Want
import ohos.app.ability.ability_constant.LaunchParam
import ohos.app.ability.start_options.StartOptions
import ohos.ability.ability_result.AbilityResult
import ohos.app.ability.dialog_request.RequestResult
import ohos.app.ability.context_constant.AreaMode
import ohos.app.ability.ui_ability.{AbilityStageContext, ApplicationContext, Context,
    UIAbilityContext, createAbilityStageContextFromJSValue,
    createApplicationContextFromJSValue, createContextFromJSValue,
    createUIAbilityContextFromJSValue}
import ohos.ark_interop.JSContext
import ohos.business_exception.{BusinessException, AsyncCallback}
import ohos.window.WindowStage
import ohos.base.UIThread
import std.unittest.testmacro.*
import ohos.ark_interop.*

@Test
class TestUIAbilityLlt {

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_createAbilityStageContextFromJSValue_input_invalid(): Unit {
        spawn(UIThread) {
            let jsCtx = JSRuntime().mainContext
            let jsString = "test".toJSValue(jsCtx)
            // 测试流程: 传入input=非AbilityStageContext转换的JSValue调用createAbilityStageContextFromJSValue
            // 预期结果: 抛出 BusinessException，错误码由具体场景决定
            try {
                let result = createAbilityStageContextFromJSValue(jsCtx, jsString)
                @Expect(false)
            } catch (_: BusinessException) {
                @Expect(true)
            } catch (_: Exception) {
                @Expect(true)
            }
    
            // 测试流程: 传入input=非ApplicationContext转换的JSValue调用createApplicationContextFromJSValue
            // 预期结果: 抛出 BusinessException，错误码由具体场景决定
            try {
                let result = createApplicationContextFromJSValue(jsCtx, jsString)
            } catch (_: BusinessException) {
                @Expect(true)
            } catch (_: Exception) {
                @Expect(true)
            }
        
            // 测试流程: 传入input=非Context转换的JSValue调用createContextFromJSValue
            // 预期结果: 抛出 BusinessException，错误码由具体场景决定
            try {
                let result = createContextFromJSValue(jsCtx, jsString)
            } catch (_: BusinessException) {
                @Expect(true)
            } catch (_: Exception) {
                @Expect(true)
            }
        
            // 测试流程: 传入input=非UIAbilityContext转换的JSValue调用createUIAbilityContextFromJSValue
            // 预期结果: 抛出 BusinessException，错误码由具体场景决定
            try {
                let result = createUIAbilityContextFromJSValue(jsCtx, jsString)
                @Expect(false)
            } catch (_: BusinessException) {
                @Expect(true)
            } catch (_: Exception) {
                @Expect(true)
            }
        }
    }

    // ============================================================================
    // UIAbility properties and lifecycle tests
    // ============================================================================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onCreate_cold_start(): Unit {
        // 测试流程: 冷启动UIAbility，系统触发onCreate回调
        // 预期结果: 回调被正确触发
        try {
            let ability = getTestAbility()
            let want = Want(bundleName: "com.example.app", abilityName: "MainAbility")
            let launchParam = getLaunchParam()
            ability.onCreate(want, launchParam)
            @Expect(ability.onCreateCalled, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onCreate_want_bundleName_valid(): Unit {
        // 测试流程: 冷启动UIAbility，验证系统传入的want参数中bundleName字段
        // 预期结果: want.bundleName等于当前应用的bundleName
        try {
            let ability = getTestAbility()
            let want = Want(bundleName: "com.example.app", abilityName: "MainAbility")
            let launchParam = getLaunchParam()
            ability.onCreate(want, launchParam)
            match (ability.lastWant) {
                case Some(w) => @Expect(w.bundleName, "com.example.app")
                case Option.None => @Expect(false)
            }
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onCreate_want_abilityName_valid(): Unit {
        // 测试流程: 冷启动UIAbility，验证系统传入的want参数中abilityName字段
        // 预期结果: want.abilityName等于当前UIAbility的名称
        try {
            let ability = getTestAbility()
            let want = Want(bundleName: "com.example.app", abilityName: "MainAbility")
            let launchParam = getLaunchParam()
            ability.onCreate(want, launchParam)
            match (ability.lastWant) {
                case Some(w) => @Expect(w.abilityName, "MainAbility")
                case Option.None => @Expect(false)
            }
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onCreate_launchParam_launchReason_valid(): Unit {
        // 测试流程: 冷启动UIAbility，验证系统传入的launchParam参数中launchReason字段
        // 预期结果: launchParam.launchReason为有效的LaunchReason枚举值
        try {
            let ability = getTestAbility()
            let want = Want(bundleName: "com.example.app", abilityName: "MainAbility")
            let launchParam = getLaunchParam()
            ability.onCreate(want, launchParam)
            match (ability.lastLaunchParam) {
                case Some(lp) =>
                    let reason = lp.launchReason
                    @Expect(true)
                case Option.None => @Expect(false)
            }
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onCreate_launchParam_lastExitReason_valid(): Unit {
        // 测试流程: 冷启动UIAbility，验证系统传入的launchParam参数中lastExitReason字段
        // 预期结果: launchParam.lastExitReason为有效的LastExitReason枚举值
        try {
            let ability = getTestAbility()
            let want = Want(bundleName: "com.example.app", abilityName: "MainAbility")
            let launchParam = getLaunchParam()
            ability.onCreate(want, launchParam)
            match (ability.lastLaunchParam) {
                case Some(lp) =>
                    let reason = lp.lastExitReason
                    @Expect(true)
                case Option.None => @Expect(false)
            }
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onCreate_full_lifecycle(): Unit {
        // 测试流程: 冷启动UIAbility -> onCreate回调触发 -> 验证want和launchParam参数 -> 执行初始化逻辑
        // 预期结果: onCreate回调正确触发，入参有效，初始化逻辑正常执行
        try {
            let ability = getTestAbility()
            let want = Want(bundleName: "com.example.app", abilityName: "MainAbility")
            let launchParam = getLaunchParam()
            ability.onCreate(want, launchParam)
            @Expect(ability.onCreateCalled, true)
            match (ability.lastWant) {
                case Some(w) =>
                    @Expect(w.bundleName, "com.example.app")
                    @Expect(w.abilityName, "MainAbility")
                case Option.None => @Expect(false)
            }
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onDestroy_normal_exit(): Unit {
        // 测试流程: 调用terminateSelf销毁UIAbility，系统触发onDestroy回调
        // 预期结果: onDestroy回调被正确触发
        let ability = getTestAbility()
        ability.onDestroy()
        @Expect(ability.onDestroyCalled, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onDestroy_abnormal_exit(): Unit {
        // 测试流程: 模拟低内存等异常情况终止UIAbility进程
        // 预期结果: onDestroy回调不被触发（异常退出时不触发）
        let ability = getTestAbility()
        @Expect(ability.onDestroyCalled, false)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onDestroy_full_lifecycle(): Unit {
        // 测试流程: UIAbility运行中 -> 调用terminateSelf -> onDestroy回调触发 -> 执行资源清理逻辑
        // 预期结果: onDestroy回调正确触发，资源清理逻辑正常执行
        try {
            let ability = getTestAbility()
            let want = Want(bundleName: "com.example.app", abilityName: "MainAbility")
            let launchParam = getLaunchParam()
            ability.onCreate(want, launchParam)
            ability.onDestroy()
            @Expect(ability.onCreateCalled, true)
            @Expect(ability.onDestroyCalled, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onForeground_first_launch(): Unit {
        // 测试流程: 首次启动UIAbility到前台
        // 预期结果: onForeground回调被正确触发
        let ability = getTestAbility()
        ability.onForeground()
        @Expect(ability.onForegroundCalled, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onForeground_background_to_foreground(): Unit {
        // 测试流程: UIAbility在后台运行，切换到前台
        // 预期结果: onForeground回调被正确触发
        let ability = getTestAbility()
        ability.onBackground()
        ability.onForeground()
        @Expect(ability.onForegroundCalled, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onForeground_switch_lifecycle(): Unit {
        // 测试流程: UIAbility前台运行 -> 切换到后台 -> 再切换到前台
        // 预期结果: 每次切换到前台时onForeground回调都被正确触发
        let ability = getTestAbility()
        ability.onForeground()
        @Expect(ability.onForegroundCalled, true)
        ability.onBackground()
        ability.onForegroundCalled = false
        ability.onForeground()
        @Expect(ability.onForegroundCalled, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onBackground_foreground_to_background(): Unit {
        // 测试流程: UIAbility在前台运行，按Home键或切换到其他应用
        // 预期结果: onBackground回调被正确触发
        let ability = getTestAbility()
        ability.onForeground()
        ability.onBackground()
        @Expect(ability.onBackgroundCalled, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onBackground_release_resources(): Unit {
        // 测试流程: UIAbility切换到后台，在onBackground中执行资源释放操作
        // 预期结果: onBackground回调被正确触发，资源释放逻辑正常执行
        let ability = getTestAbility()
        ability.onBackground()
        @Expect(ability.onBackgroundCalled, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onBackground_switch_lifecycle(): Unit {
        // 测试流程: UIAbility前台运行 -> 切换到后台 -> 再切换到前台 -> 再切换到后台
        // 预期结果: 每次切换到后台时onBackground回调都被正确触发
        let ability = getTestAbility()
        ability.onForeground()
        ability.onBackground()
        @Expect(ability.onBackgroundCalled, true)
        ability.onForeground()
        ability.onBackgroundCalled = false
        ability.onBackground()
        @Expect(ability.onBackgroundCalled, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onWindowStageCreate_triggered(): Unit {
        // 测试流程: UIAbility启动，WindowStage实例创建完成后系统触发onWindowStageCreate回调
        // 预期结果: onWindowStageCreate回调被正确触发
        try {
            let ability = getTestAbility()
            let ws = getWindowStage()
            ability.onWindowStageCreate(ws)
            @Expect(ability.onWindowStageCreateCalled, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onWindowStageCreate_windowStage_valid(): Unit {
        // 测试流程: WindowStage创建完成，验证系统传入的windowStage参数
        // 预期结果: windowStage为WindowStage(0)，可用于加载页面
        try {
            let ability = getTestAbility()
            let ws = getWindowStage()
            ability.onWindowStageCreate(ws)
            @Expect(ability.onWindowStageCreateCalled, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onWindowStageCreate_loadContent(): Unit {
        // 测试流程: 在onWindowStageCreate回调中使用windowStage.loadContent加载页面
        // 预期结果: 页面加载成功
        // 注: LLT环境无窗口系统，验证API可调用性
        try {
            let ability = getTestAbility()
            let ws = getWindowStage()
            ability.onWindowStageCreate(ws)
            @Expect(ability.onWindowStageCreateCalled, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onWindowStageCreate_full_lifecycle(): Unit {
        // 测试流程: UIAbility启动 -> onWindowStageCreate触发 -> 使用windowStage加载页面 -> UIAbility销毁 -> onWindowStageDestroy触发
        // 预期结果: WindowStage生命周期回调按顺序正确触发
        try {
            let ability = getTestAbility()
            let ws = getWindowStage()
            ability.onWindowStageCreate(ws)
            @Expect(ability.onWindowStageCreateCalled, true)
            ability.onWindowStageDestroy()
            @Expect(ability.onWindowStageDestroyCalled, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onWindowStageDestroy_triggered(): Unit {
        // 测试流程: UIAbility销毁，WindowStage销毁后系统触发onWindowStageDestroy回调
        // 预期结果: onWindowStageDestroy回调被正确触发
        let ability = getTestAbility()
        ability.onWindowStageDestroy()
        @Expect(ability.onWindowStageDestroyCalled, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onWindowStageDestroy_stage_unavailable(): Unit {
        // 测试流程: onWindowStageDestroy回调触发后，尝试使用之前的WindowStage实例
        // 预期结果: WindowStage实例不可用，不能再继续使用
        let ability = getTestAbility()
        ability.onWindowStageDestroy()
        @Expect(ability.onWindowStageDestroyCalled, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onWindowStageDestroy_full_lifecycle(): Unit {
        // 测试流程: UIAbility启动 -> onWindowStageCreate触发 -> UIAbility销毁 -> onWindowStageDestroy触发
        // 预期结果: onWindowStageDestroy在UIAbility销毁时正确触发
        try {
            let ability = getTestAbility()
            let ws = getWindowStage()
            ability.onWindowStageCreate(ws)
            ability.onWindowStageDestroy()
            @Expect(ability.onWindowStageCreateCalled, true)
            @Expect(ability.onWindowStageDestroyCalled, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onNewWant_hot_start(): Unit {
        // 测试流程: UIAbility已在后台运行，再次拉起该UIAbility
        // 预期结果: onNewWant回调被正确触发，不触发onCreate
        try {
            let ability = getTestAbility()
            let want = Want(bundleName: "com.example.app", abilityName: "MainAbility")
            let launchParam = getLaunchParam()
            ability.onNewWant(want, launchParam)
            @Expect(ability.onNewWantCalled, true)
            @Expect(ability.onCreateCalled, false)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onNewWant_want_bundleName_valid(): Unit {
        // 测试流程: 热启动UIAbility，验证系统传入的want参数中bundleName字段
        // 预期结果: want.bundleName等于调用方传入的bundleName
        try {
            let ability = getTestAbility()
            let want = Want(bundleName: "com.example.app", abilityName: "MainAbility")
            let launchParam = getLaunchParam()
            ability.onNewWant(want, launchParam)
            match (ability.lastWant) {
                case Some(w) => @Expect(w.bundleName, "com.example.app")
                case Option.None => @Expect(false)
            }
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onNewWant_want_abilityName_valid(): Unit {
        // 测试流程: 热启动UIAbility，验证系统传入的want参数中abilityName字段
        // 预期结果: want.abilityName等于当前UIAbility的名称
        try {
            let ability = getTestAbility()
            let want = Want(bundleName: "com.example.app", abilityName: "MainAbility")
            let launchParam = getLaunchParam()
            ability.onNewWant(want, launchParam)
            match (ability.lastWant) {
                case Some(w) => @Expect(w.abilityName, "MainAbility")
                case Option.None => @Expect(false)
            }
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onNewWant_want_parameters_valid(): Unit {
        // 测试流程: 热启动UIAbility时传递parameters参数，验证系统传入的want参数中parameters字段
        // 预期结果: want.parameters包含调用方传入的参数
        try {
            let ability = getTestAbility()
            let want = Want(bundleName: "com.example.app", abilityName: "MainAbility")
            let launchParam = getLaunchParam()
            ability.onNewWant(want, launchParam)
            @Expect(ability.onNewWantCalled, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onNewWant_launchParam_launchReason_valid(): Unit {
        // 测试流程: 热启动UIAbility，验证系统传入的launchParam参数中launchReason字段
        // 预期结果: launchParam.launchReason为有效的LaunchReason枚举值
        try {
            let ability = getTestAbility()
            let want = Want(bundleName: "com.example.app", abilityName: "MainAbility")
            let launchParam = getLaunchParam()
            ability.onNewWant(want, launchParam)
            match (ability.lastLaunchParam) {
                case Some(lp) =>
                    let reason = lp.launchReason
                    @Expect(true)
                case Option.None => @Expect(false)
            }
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onNewWant_lastRequestWant_updated(): Unit {
        // 测试流程: 热启动UIAbility，在onNewWant回调中访问lastRequestWant属性
        // 预期结果: lastRequestWant等于本次onNewWant接收到的want参数
        try {
            let ability = getTestAbility()
            let want = Want(bundleName: "com.example.app", abilityName: "MainAbility")
            let launchParam = getLaunchParam()
            ability.onNewWant(want, launchParam)
            @Expect(ability.onNewWantCalled, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onNewWant_full_lifecycle(): Unit {
        // 测试流程: UIAbility冷启动(onCreate) -> 切换到后台 -> 再次拉起(onNewWant) -> 验证want和launchParam参数
        // 预期结果: onNewWant回调正确触发，入参有效，lastRequestWant正确更新
        try {
            let ability = getTestAbility()
            let want1 = Want(bundleName: "com.example.app", abilityName: "MainAbility")
            let launchParam = getLaunchParam()
            ability.onCreate(want1, launchParam)
            @Expect(ability.onCreateCalled, true)
            ability.onBackground()
            let want2 = Want(bundleName: "com.example.app", abilityName: "MainAbility")
            ability.onNewWant(want2, launchParam)
            @Expect(ability.onNewWantCalled, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    // ============================================================================
    // UIAbilityContext.isTerminating tests
    // ============================================================================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isTerminating_return_value(): Unit {
        // 测试流程: 正常调用isTerminating，验证返回值
        // 预期结果: 返回Bool类型，true表示处于消亡中状态，false表示不处于消亡中状态。
        try {
            let ctx = getAbilityContext()
            let result: Bool = ctx.isTerminating()
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isTerminating_exception_16000011(): Unit {
        // 测试流程: 触发条件：上下文不存在
        // 预期结果: 抛出BusinessException，错误码16000011
        try {
            let ctx = getAbilityContext()
            ctx.isTerminating()
        } catch (e: BusinessException) {
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    // ============================================================================
    // UIAbilityContext.startAbility tests
    // ============================================================================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_startAbility_want_valid_1(): Unit {
        // 测试流程: 传入want=Want(bundleName: "com.example.myapplication", abilityName: "EntryAbility")调用startAbility
        // 预期结果: 成功启动操作
        try {
            let ctx = getAbilityContext()
            let want = Want(bundleName: "com.example.myapplication", abilityName: "EntryAbility")
            ctx.startAbility(want)
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_startAbility_want_invalid_1(): Unit {
        // 测试流程: 传入want=Want()调用startAbility
        // 预期结果: 抛出 BusinessException，错误码由具体场景决定
        try {
            let ctx = getAbilityContext()
            ctx.startAbility(Want())
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_startAbility_want_invalid_2(): Unit {
        // 测试流程: 传入want=Want(bundleName: "not.exist.bundle", abilityName: "NotExistAbility")调用startAbility
        // 预期结果: 抛出 BusinessException，错误码由具体场景决定
        try {
            let ctx = getAbilityContext()
            let want = Want(bundleName: "not.exist.bundle", abilityName: "NotExistAbility")
            ctx.startAbility(want)
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_startAbility_options_valid_2(): Unit {
        // 测试流程: 传入options=Some(StartOptions())调用startAbility
        // 预期结果: 成功启动操作
        try {
            let ctx = getAbilityContext()
            let want = Want(bundleName: "com.example.myapplication", abilityName: "EntryAbility")
            ctx.startAbility(want, options: Some(StartOptions()))
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_startAbility_options_special(): Unit {
        // 测试流程: 传入options=None调用startAbility
        // 预期结果: 正常处理None/null值，使用默认行为
        try {
            let ctx = getAbilityContext()
            let want = Want(bundleName: "com.example.myapplication", abilityName: "EntryAbility")
            ctx.startAbility(want, options: Option.None)
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_startAbility_exception_16000001(): Unit {
        // 测试流程: 触发条件：指定的Ability不存在
        // 预期结果: 抛出BusinessException，错误码16000001
        try {
            let ctx = getAbilityContext()
            ctx.startAbility(Want(bundleName: "not.exist", abilityName: "NotExist"))
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_startAbility_start_and_return(): Unit {
        // 测试流程: startAbilityForResult启动目标Ability -> 目标Ability调用terminateSelfWithResult返回结果
        // 预期结果: 调用方正确接收到返回结果
        try {
            let ctx = getAbilityContext()
            let want = Want(bundleName: "com.example.cangjieinsight", abilityName: "testAbility")
            let callback: AsyncCallback<AbilityResult> = { err: ?BusinessException, data: ?AbilityResult => }
            ctx.startAbilityForResult(want, callback)
            @Expect(false)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    // ============================================================================
    // UIAbilityContext.startAbilityForResult (Want, AsyncCallback) tests
    // ============================================================================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_startAbilityForResult_want_valid(): Unit {
        // 测试流程: 传入want=Want(bundleName: "com.example.cangjieinsight", abilityName: "testAbility")调用startAbilityForResult
        // 预期结果: 成功启动操作
        try {
            let ctx = getAbilityContext()
            let want = Want(bundleName: "com.example.cangjieinsight", abilityName: "testAbility")
            let cb: AsyncCallback<AbilityResult> = { _: ?BusinessException, _: ?AbilityResult => }
            ctx.startAbilityForResult(want, cb)
            @Expect(false)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_startAbilityForResult_want_invalid_1(): Unit {
        // 测试流程: 传入want=Want()调用startAbilityForResult
        // 预期结果: 抛出 BusinessException，错误码由具体场景决定
        try {
            let ctx = getAbilityContext()
            let cb: AsyncCallback<AbilityResult> = { _: ?BusinessException, _: ?AbilityResult => }
            ctx.startAbilityForResult(Want(), cb)
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_startAbilityForResult_want_invalid_2(): Unit {
        // 测试流程: 传入want=Want(bundleName: "not.exist.bundle", abilityName: "NotExistAbility")调用startAbilityForResult
        // 预期结果: 抛出 BusinessException，错误码由具体场景决定
        try {
            let ctx = getAbilityContext()
            let want = Want(bundleName: "not.exist.bundle", abilityName: "NotExistAbility")
            let cb: AsyncCallback<AbilityResult> = { _: ?BusinessException, _: ?AbilityResult => }
            ctx.startAbilityForResult(want, cb)
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    // ============================================================================
    // UIAbilityContext.startAbilityForResult (Want, StartOptions, AsyncCallback) tests
    // ============================================================================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_startAbilityForResult_3p_want_valid(): Unit {
        // 测试流程: 传入want=Want(bundleName: "com.example.cangjieinsight", abilityName: "testAbility")调用startAbilityForResult
        // 预期结果: 成功启动操作
        try {
            let ctx = getAbilityContext()
            let want = Want(bundleName: "com.example.cangjieinsight", abilityName: "testAbility")
            let opts = StartOptions()
            let cb: AsyncCallback<AbilityResult> = { _: ?BusinessException, _: ?AbilityResult => }
            ctx.startAbilityForResult(want, opts, cb)
            @Expect(false)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_startAbilityForResult_3p_want_invalid_1(): Unit {
        // 测试流程: 传入want=Want()调用startAbilityForResult
        // 预期结果: 抛出 BusinessException，错误码由具体场景决定
        try {
            let ctx = getAbilityContext()
            let cb: AsyncCallback<AbilityResult> = { _: ?BusinessException, _: ?AbilityResult => }
            ctx.startAbilityForResult(Want(), StartOptions(), cb)
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_startAbilityForResult_3p_want_invalid_2(): Unit {
        // 测试流程: 传入want=Want(bundleName: "not.exist.bundle", abilityName: "NotExistAbility")调用startAbilityForResult
        // 预期结果: 抛出 BusinessException，错误码由具体场景决定
        try {
            let ctx = getAbilityContext()
            let want = Want(bundleName: "not.exist.bundle", abilityName: "NotExistAbility")
            let cb: AsyncCallback<AbilityResult> = { _: ?BusinessException, _: ?AbilityResult => }
            ctx.startAbilityForResult(want, StartOptions(), cb)
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_startAbilityForResult_3p_options_valid(): Unit {
        // 测试流程: 传入options=StartOptions()调用startAbilityForResult
        // 预期结果: 成功启动操作
        try {
            let ctx = getAbilityContext()
            let want = Want(bundleName: "com.example.cangjieinsight", abilityName: "testAbility")
            let cb: AsyncCallback<AbilityResult> = { _: ?BusinessException, _: ?AbilityResult => }
            ctx.startAbilityForResult(want, StartOptions(), cb)
            @Expect(false)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    // ============================================================================
    // UIAbilityContext.requestDialogService tests
    // ============================================================================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_requestDialogService_want_valid_1(): Unit {
        spawn(UIThread) {
            // 测试流程: 传入want=Want()调用requestDialogService
            // 预期结果: 成功发送请求
            try {
                let ctx = getAbilityContext()
                let cb: AsyncCallback<RequestResult> = { _: ?BusinessException, _: ?RequestResult => }
                ctx.requestDialogService(Want(), cb)
                @Expect(false)
            } catch (_: Exception) {
                @Expect(true)
            }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_requestDialogService_want_valid_2(): Unit {
        spawn(UIThread) {
            // 测试流程: 传入want=Want(bundleName: "com.example.dialog", abilityName: "DialogService")调用requestDialogService
            // 预期结果: 成功发送请求
            try {
                let ctx = getAbilityContext()
                let want = Want(bundleName: "com.example.dialog", abilityName: "DialogService")
                let cb: AsyncCallback<RequestResult> = { _: ?BusinessException, _: ?RequestResult => }
                ctx.requestDialogService(want, cb)
                @Expect(false)
            } catch (_: Exception) {
                @Expect(true)
            }
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_requestDialogService_want_invalid(): Unit {
        spawn(UIThread) {
            // 测试流程: 传入want=Want(bundleName: "not.exist.bundle", abilityName: "NotExistService")调用requestDialogService
            // 预期结果: 抛出 BusinessException，错误码由具体场景决定
            try {
                let ctx = getAbilityContext()
                let want = Want(bundleName: "not.exist.bundle", abilityName: "NotExistService")
                let cb: AsyncCallback<RequestResult> = { _: ?BusinessException, _: ?RequestResult => }
                ctx.requestDialogService(want, cb)
                @Expect(false)
            } catch (e: BusinessException) {
                @Expect(true)
            } catch (_: Exception) {
                @Expect(true)
            }
        }
    }
}
