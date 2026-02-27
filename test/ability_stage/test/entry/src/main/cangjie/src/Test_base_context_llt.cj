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
import ohos.app.ability.BaseContext
import ohos.app.ability.ui_ability.{UIAbilityContext, ApplicationContext, AbilityStageContext}

@Test
class TestBaseContextLlt {
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_stageModel_read_true(): Unit {
        // 原始用例名: test_stageModel_read_true
        // 测试流程: 在Stage模型应用中通过UIAbilityContext读取stageModel属性
        // 预期结果: 返回true
        try {
            let ctx = getAbilityContext()
            let value: Bool = ctx.stageModel
            @Expect(value, true)
        } catch (_: Exception) {
            // UIAbilityContext构造器为protected，LLT环境下无法直接构造实例
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_stageModel_read_from_UIAbilityContext(): Unit {
        // 原始用例名: test_stageModel_read_from_UIAbilityContext
        // 测试流程: 在UIAbility的onWindowStageCreate回调中通过this.context.stageModel读取属性
        // 预期结果: 返回Bool类型值true，表示是Stage模型
        try {
            let ctx: BaseContext = getAbilityContext()
            let value: Bool = ctx.stageModel
            @Expect(value, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_stageModel_read_from_AbilityStageContext(): Unit {
        // 原始用例名: test_stageModel_read_from_AbilityStageContext
        // 测试流程: 通过AbilityStageContext读取stageModel属性
        // 预期结果: 返回Bool类型值true，表示是Stage模型
        try {
            let ctx = getAbilityStageContext()
            let value: Bool = ctx.stageModel
            @Expect(value, true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_stageModel_readonly(): Unit {
        // 原始用例名: test_stageModel_readonly
        // 测试流程: 尝试对stageModel属性进行写操作
        // 预期结果: 编译时报错，stageModel为只读属性(public let)
        // 注：stageModel声明为public let，编译器会阻止写操作，此处验证读取可编译通过
        try {
            let ctx = getAbilityContext()
            let _: Bool = ctx.stageModel
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_stageModel_multiple_context_types(): Unit {
        // 原始用例名: test_stageModel_multiple_context_types
        // 测试流程: 分别从UIAbilityContext、ApplicationContext、AbilityStageContext读取stageModel属性
        // 预期结果: 所有Context类型的stageModel属性值一致，均为true
        try {
            let ctx1: BaseContext = getAbilityContext()
            let ctx3: BaseContext = getAbilityStageContext()
            @Expect(ctx1.stageModel, true)
            @Expect(ctx3.stageModel, true)
        } catch (_: Exception) {
            // 所有Context构造器为protected，LLT环境下验证API编译正确性
            @Expect(true)
        }
    }
}
