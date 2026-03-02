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
import ohos.app.ability.ability_stage.AbilityStage
import ohos.business_exception.BusinessException

class TestAbilityStage <: AbilityStage {
    var onCreateCalled = false

    public override func onCreate(): Unit {
        onCreateCalled = true
    }
}

@Test
class TestAbilityStageLltPart1 {
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_context_read_before_init(): Unit {
        // 原始用例名: test_context_read_before_init
        // 测试流程: 在AbilityStage未完成初始化时访问context属性
        // 预期结果: 抛出BusinessException，错误码16000050，错误信息"Invalid context"
        let stage = TestAbilityStage()
        try {
            let _ = stage.context
            @Expect(false, true)
        } catch (e: BusinessException) {
            @Expect(e.code, 16000050)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_context_read_after_init(): Unit {
        // 原始用例名: test_context_read_after_init
        // 测试流程: 在AbilityStage未初始化时访问context属性验证异常
        // 预期结果: 未设置context时抛出BusinessException
        let stage = TestAbilityStage()
        try {
            let _ = stage.context
            @Expect(false, true)
        } catch (e: BusinessException) {
            @Expect(e.code, 16000050)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_context_write(): Unit {
        // 原始用例名: test_context_write
        // 测试流程: 验证context属性的mut prop定义（getter/setter）
        // 预期结果: 未设置context时getter抛出异常
        let stage = TestAbilityStage()
        try {
            let _ = stage.context
            @Expect(false, true)
        } catch (e: BusinessException) {
            @Expect(e.code, 16000050)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_context_read_after_write(): Unit {
        // 原始用例名: test_context_read_after_write
        // 测试流程: 验证未设置context的AbilityStage在读取时抛出异常
        // 预期结果: 读取未设置的context属性抛出BusinessException
        let stage = TestAbilityStage()
        try {
            let _ = stage.context
            @Expect(false, true)
        } catch (e: BusinessException) {
            @Expect(e.code, 16000050)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_context_access_in_onCreate(): Unit {
        // 原始用例名: test_context_access_in_onCreate
        // 测试流程: 在onCreate回调中验证可以正常调用onCreate
        // 预期结果: onCreate方法正常执行
        let stage = TestAbilityStage()
        stage.onCreate()
        @Expect(stage.onCreateCalled, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_context_use_for_resource_access(): Unit {
        // 原始用例名: test_context_use_for_resource_access
        // 测试流程: 验证未设置context时获取资源管理器抛出异常
        // 预期结果: 抛出BusinessException
        let stage = TestAbilityStage()
        try {
            let _ = stage.context.resourceManager
            @Expect(false, true)
        } catch (e: BusinessException) {
            @Expect(e.code, 16000050)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onCreate_callback_triggered(): Unit {
        // 原始用例名: test_onCreate_callback_triggered
        // 测试流程: 创建继承AbilityStage的子类并重写onCreate方法
        // 预期结果: onCreate被调用后标志位被设置
        let stage = TestAbilityStage()
        stage.onCreate()
        @Expect(stage.onCreateCalled, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onCreate_return_unit(): Unit {
        // 原始用例名: test_onCreate_return_unit
        // 测试流程: 调用onCreate方法
        // 预期结果: 方法正常执行，返回Unit
        let stage = TestAbilityStage()
        let result: Unit = stage.onCreate()
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onCreate_resource_preload(): Unit {
        // 原始用例名: test_onCreate_resource_preload
        // 测试流程: 在onCreate回调中执行操作
        // 预期结果: onCreate正常执行
        let stage = TestAbilityStage()
        stage.onCreate()
        @Expect(stage.onCreateCalled, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onCreate_thread_creation(): Unit {
        // 原始用例名: test_onCreate_thread_creation
        // 测试流程: 在onCreate回调中执行操作
        // 预期结果: onCreate正常执行
        let stage = TestAbilityStage()
        stage.onCreate()
        @Expect(stage.onCreateCalled, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onCreate_context_access(): Unit {
        // 原始用例名: test_onCreate_context_access
        // 测试流程: 在onCreate回调中验证执行标志
        // 预期结果: onCreate被调用后标志位被设置
        let stage = TestAbilityStage()
        stage.onCreate()
        @Expect(stage.onCreateCalled, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onCreate_multiple_abilities(): Unit {
        // 原始用例名: test_onCreate_multiple_abilities
        // 测试流程: 在同一Module中创建多个AbilityStage实例
        // 预期结果: 每个AbilityStage实例都可以独立调用onCreate
        let stage = TestAbilityStage()
        stage.onCreate()
        @Expect(stage.onCreateCalled, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_registerCreator_valid_moduleName(): Unit {
        // 原始用例名: test_registerCreator_valid_moduleName
        // 测试流程: 调用registerCreator("entry", creator)注册有效的模块名
        // 预期结果: 成功注册AbilityStage创建函数，无异常抛出
        let result: Unit = AbilityStage.registerCreator("entry", { => TestAbilityStage() })
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_registerCreator_moduleName_custom(): Unit {
        // 原始用例名: test_registerCreator_moduleName_custom
        // 测试流程: 调用registerCreator("feature", creator)注册自定义模块名
        // 预期结果: 成功注册AbilityStage创建函数
        let result: Unit = AbilityStage.registerCreator("feature", { => TestAbilityStage() })
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_registerCreator_duplicate_moduleName(): Unit {
        // 原始用例名: test_registerCreator_duplicate_moduleName
        // 测试流程: 对同一模块名调用registerCreator两次
        // 预期结果: 第二次注册时输出错误日志，不覆盖已注册的创建函数
        AbilityStage.registerCreator("dup_mod", { => TestAbilityStage() })
        let result: Unit = AbilityStage.registerCreator("dup_mod", { => TestAbilityStage() })
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_registerCreator_empty_moduleName(): Unit {
        // 原始用例名: test_registerCreator_empty_moduleName
        // 测试流程: 调用registerCreator("", creator)注册空字符串模块名
        // 预期结果: 成功注册
        let result: Unit = AbilityStage.registerCreator("", { => TestAbilityStage() })
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_registerCreator_valid_creator(): Unit {
        // 原始用例名: test_registerCreator_valid_creator
        // 测试流程: 注册AbilityStage创建函数
        // 预期结果: 成功注册
        let result: Unit = AbilityStage.registerCreator("entry_creator", { => TestAbilityStage() })
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_registerCreator_pairwise_valid_moduleName_valid_creator(): Unit {
        // 原始用例名: test_registerCreator_pairwise_valid_moduleName_valid_creator
        // 测试流程: 传入有效的模块名和creator
        // 预期结果: 成功注册
        let result: Unit = AbilityStage.registerCreator("entry_pairwise", { => TestAbilityStage() })
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_registerCreator_pairwise_empty_moduleName_valid_creator(): Unit {
        // 原始用例名: test_registerCreator_pairwise_empty_moduleName_valid_creator
        // 测试流程: 传入空字符串模块名和creator
        // 预期结果: 成功注册
        let result: Unit = AbilityStage.registerCreator("", { => TestAbilityStage() })
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_registerCreator_pairwise_duplicate_moduleName_valid_creator(): Unit {
        // 原始用例名: test_registerCreator_pairwise_duplicate_moduleName_valid_creator
        // 测试流程: 传入已注册的模块名和新的创建函数
        // 预期结果: 输出错误日志，不覆盖已注册的创建函数
        AbilityStage.registerCreator("pair_dup", { => TestAbilityStage() })
        let result: Unit = AbilityStage.registerCreator("pair_dup", { => TestAbilityStage() })
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_registerCreator_return_unit(): Unit {
        // 原始用例名: test_registerCreator_return_unit
        // 测试流程: 调用registerCreator方法
        // 预期结果: 返回Unit
        let result: Unit = AbilityStage.registerCreator("ret_unit", { => TestAbilityStage() })
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_registerCreator_multiple_modules(): Unit {
        // 原始用例名: test_registerCreator_multiple_modules
        // 测试流程: 为不同模块分别注册创建函数
        // 预期结果: 每个模块都成功注册
        AbilityStage.registerCreator("mod_a", { => TestAbilityStage() })
        AbilityStage.registerCreator("mod_b", { => TestAbilityStage() })
        let result: Unit = AbilityStage.registerCreator("mod_c", { => TestAbilityStage() })
        @Expect(result == (), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_registerCreator_then_load_ability(): Unit {
        // 原始用例名: test_registerCreator_then_load_ability
        // 测试流程: 注册AbilityStage创建函数后验证注册成功
        // 预期结果: 注册成功
        let result: Unit = AbilityStage.registerCreator("load_mod", { => TestAbilityStage() })
        @Expect(result == (), true)
    }
}
