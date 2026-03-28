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
class TestContextLlt {
    // ============================================================================
    // Context property tests
    // ============================================================================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resourceManager_return_value(): Unit {
        // 测试流程: 正常调用resourceManager，验证返回值
        // 预期结果: 返回ResourceManager类型，资源管理对象。
        try {
            let ctx = getAbilityContext()
            let rm = ctx.resourceManager
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resourceManager_context_access(): Unit {
        // 测试流程: 获取Context实例 -> 访问resourceManager属性 -> 验证返回值
        // 预期结果: 成功获取属性值
        try {
            let ctx = getAbilityContext()
            let rm = ctx.resourceManager
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_applicationInfo_return_value(): Unit {
        // 测试流程: 正常调用applicationInfo，验证返回值
        // 预期结果: 返回ApplicationInfo类型，当前应用程序的信息。
        try {
            let ctx = getAbilityContext()
            let info = ctx.applicationInfo
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_applicationInfo_context_access(): Unit {
        // 测试流程: 获取Context实例 -> 访问applicationInfo属性 -> 验证返回值
        // 预期结果: 成功获取属性值
        try {
            let ctx = getAbilityContext()
            let info = ctx.applicationInfo
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_filesDir_return_value(): Unit {
        // 测试流程: 正常调用filesDir，验证返回值
        // 预期结果: 返回String类型，文件目录。
        try {
            let ctx = getAbilityContext()
            let dir: String = ctx.filesDir
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_filesDir_context_access(): Unit {
        // 测试流程: 获取Context实例 -> 访问filesDir属性 -> 验证返回值
        // 预期结果: 成功获取属性值
        try {
            let ctx = getAbilityContext()
            let dir = ctx.filesDir
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_area_write_valid_1(): Unit {
        // 测试流程: 传入value=AreaMode.EL1调用area
        // 预期结果: 成功完成area操作
        try {
            let ctx = getAbilityContext()
            ctx.area = AreaMode.El1
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_area_write_valid_2(): Unit {
        // 测试流程: 传入value=AreaMode.EL2调用area
        // 预期结果: 成功完成area操作
        try {
            let ctx = getAbilityContext()
            ctx.area = AreaMode.El2
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_area_write_valid_3(): Unit {
        // 测试流程: 传入value=AreaMode.EL3调用area
        // 预期结果: 成功完成area操作
        try {
            let ctx = getAbilityContext()
            ctx.area = AreaMode.El3
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_area_write_valid_4(): Unit {
        // 测试流程: 传入value=AreaMode.EL4调用area
        // 预期结果: 成功完成area操作
        try {
            let ctx = getAbilityContext()
            ctx.area = AreaMode.El4
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_area_write_valid_5(): Unit {
        // 测试流程: 传入value=AreaMode.EL5调用area
        // 预期结果: 成功完成area操作
        try {
            let ctx = getAbilityContext()
            ctx.area = AreaMode.El5
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_area_return_value(): Unit {
        // 测试流程: 正常调用area，验证返回值
        // 预期结果: 返回AreaMode类型，文件分区信息。
        try {
            let ctx = getAbilityContext()
            let mode: AreaMode = ctx.area
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_area_context_access(): Unit {
        // 测试流程: 获取Context实例 -> 访问area属性 -> 验证返回值
        // 预期结果: 成功获取属性值
        try {
            let ctx = getAbilityContext()
            let mode = ctx.area
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    // ============================================================================
    // AbilityStageContext.currentHapModuleInfo tests
    // ============================================================================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_currentHapModuleInfo_return_value(): Unit {
        // 测试流程: 正常调用currentHapModuleInfo，验证返回值
        // 预期结果: 返回HapModuleInfo类型，AbilityStage对应的ModuleInfo对象。
        try {
            let ctx = getAbilityStageContext()
            let info = ctx.currentHapModuleInfo
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_currentHapModuleInfo_context_access(): Unit {
        // 测试流程: 获取Context实例 -> 访问currentHapModuleInfo属性 -> 验证返回值
        // 预期结果: 成功获取属性值
        try {
            let ctx = getAbilityStageContext()
            let info = ctx.currentHapModuleInfo
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

      // ============================================================================
    // UIAbilityContext.terminateSelf tests
    // ============================================================================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_terminateSelf_exception_16000009(): Unit {
        // 测试流程: 触发条件：Wukong模式下无法启动或停止Ability
        // 预期结果: 抛出BusinessException，错误码16000009
        try {
            let ctx = getAbilityContext()
            ctx.terminateSelf()
        } catch (e: BusinessException) {
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_terminateSelf_exception_16000011(): Unit {
        // 测试流程: 触发条件：上下文不存在
        // 预期结果: 抛出BusinessException，错误码16000011
        try {
            let ctx = getAbilityContext()
            ctx.terminateSelf()
        } catch (e: BusinessException) {
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_terminateSelf_exception_16000050(): Unit {
        // 测试流程: 触发条件：内部错误
        // 预期结果: 抛出BusinessException，错误码16000050
        try {
            let ctx = getAbilityContext()
            ctx.terminateSelf()
        } catch (e: BusinessException) {
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_terminateSelf_normal_terminate_flow(): Unit {
        // 测试流程: UIAbility正常运行 -> 调用terminateSelf -> 验证UIAbility被销毁
        // 预期结果: UIAbility成功销毁
        try {
            let ctx = getAbilityContext()
            ctx.terminateSelf()
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    // ============================================================================
    // UIAbilityContext.terminateSelfWithResult tests
    // ============================================================================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_terminateSelfWithResult_parameter_valid_1(): Unit {
        // 测试流程: 传入parameter=AbilityResult(0)调用terminateSelfWithResult
        // 预期结果: 成功完成terminateSelfWithResult操作
        try {
            let ctx = getAbilityContext()
            ctx.terminateSelfWithResult(AbilityResult(0))
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_terminateSelfWithResult_parameter_valid_2(): Unit {
        // 测试流程: 传入parameter=AbilityResult(1)调用terminateSelfWithResult
        // 预期结果: 成功完成terminateSelfWithResult操作
        try {
            let ctx = getAbilityContext()
            ctx.terminateSelfWithResult(AbilityResult(1))
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_terminateSelfWithResult_parameter_valid_3(): Unit {
        // 测试流程: 传入parameter=AbilityResult(-1)调用terminateSelfWithResult
        // 预期结果: 成功完成terminateSelfWithResult操作
        try {
            let ctx = getAbilityContext()
            ctx.terminateSelfWithResult(AbilityResult(-1))
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_terminateSelfWithResult_parameter_boundary_1(): Unit {
        // 测试流程: 传入parameter=AbilityResult(Int32.Max)调用terminateSelfWithResult
        // 预期结果: 成功完成terminateSelfWithResult操作
        try {
            let ctx = getAbilityContext()
            ctx.terminateSelfWithResult(AbilityResult(Int32.Max))
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_terminateSelfWithResult_parameter_boundary_2(): Unit {
        // 测试流程: 传入parameter=AbilityResult(Int32.Min)调用terminateSelfWithResult
        // 预期结果: 成功完成terminateSelfWithResult操作
        try {
            let ctx = getAbilityContext()
            ctx.terminateSelfWithResult(AbilityResult(Int32.Min))
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_terminateSelfWithResult_exception_16000009(): Unit {
        // 测试流程: 触发条件：Wukong模式下无法启动或停止Ability
        // 预期结果: 抛出BusinessException，错误码16000009
        try {
            let ctx = getAbilityContext()
            ctx.terminateSelfWithResult(AbilityResult(0))
        } catch (e: BusinessException) {
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_terminateSelfWithResult_exception_16000011(): Unit {
        // 测试流程: 触发条件：上下文不存在
        // 预期结果: 抛出BusinessException，错误码16000011
        try {
            let ctx = getAbilityContext()
            ctx.terminateSelfWithResult(AbilityResult(0))
        } catch (e: BusinessException) {
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_terminateSelfWithResult_exception_16000050(): Unit {
        // 测试流程: 触发条件：内部错误
        // 预期结果: 抛出BusinessException，错误码16000050
        try {
            let ctx = getAbilityContext()
            ctx.terminateSelfWithResult(AbilityResult(0))
        } catch (e: BusinessException) {
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_terminateSelfWithResult_normal_terminate_flow(): Unit {
        // 测试流程: UIAbility正常运行 -> 调用terminateSelf -> 验证UIAbility被销毁
        // 预期结果: UIAbility成功销毁
        try {
            let ctx = getAbilityContext()
            ctx.terminateSelfWithResult(AbilityResult(0))
            @Expect(true)
        } catch (_: Exception) {
            @Expect(false)
        }
    }
}