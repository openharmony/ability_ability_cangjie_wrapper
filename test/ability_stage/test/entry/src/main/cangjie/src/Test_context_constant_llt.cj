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

import ohos.app.ability.context_constant.*

@Test
class TestContextConstantLltPart1 {
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_equal_El1(): Unit {
        // 原始用例名: test_AreaMode_equal_El1
        // 测试流程: 创建AreaMode.El1实例，调用==(AreaMode.El1)
        // 预期结果: 返回true
        @Expect(AreaMode.El1 == AreaMode.El1, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_equal_El2(): Unit {
        // 原始用例名: test_AreaMode_equal_El2
        // 测试流程: 创建AreaMode.El2实例，调用==(AreaMode.El2)
        // 预期结果: 返回true
        @Expect(AreaMode.El2 == AreaMode.El2, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_equal_El3(): Unit {
        // 原始用例名: test_AreaMode_equal_El3
        // 测试流程: 创建AreaMode.El3实例，调用==(AreaMode.El3)
        // 预期结果: 返回true
        @Expect(AreaMode.El3 == AreaMode.El3, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_equal_El4(): Unit {
        // 原始用例名: test_AreaMode_equal_El4
        // 测试流程: 创建AreaMode.El4实例，调用==(AreaMode.El4)
        // 预期结果: 返回true
        @Expect(AreaMode.El4 == AreaMode.El4, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_equal_El5(): Unit {
        // 原始用例名: test_AreaMode_equal_El5
        // 测试流程: 创建AreaMode.El5实例，调用==(AreaMode.El5)
        // 预期结果: 返回true
        @Expect(AreaMode.El5 == AreaMode.El5, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_equal_same_value_returns_true(): Unit {
        // 原始用例名: test_AreaMode_equal_same_value_returns_true
        // 测试流程: 创建两个相同的AreaMode枚举值（如El1和El1），使用==运算符比较
        // 预期结果: 返回true
        @Expect(AreaMode.El1 == AreaMode.El1, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_equal_different_value_returns_false(): Unit {
        // 原始用例名: test_AreaMode_equal_different_value_returns_false
        // 测试流程: 创建两个不同的AreaMode枚举值（如El1和El2），使用==运算符比较
        // 预期结果: 返回false
        @Expect(AreaMode.El1 == AreaMode.El2, false)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_equal_self_comparison(): Unit {
        // 原始用例名: test_AreaMode_equal_self_comparison
        // 测试流程: 将AreaMode枚举值与自身进行==比较
        // 预期结果: 返回true
        let mode = AreaMode.El1
        @Expect(mode == mode, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_equal_all_pairs(): Unit {
        // 原始用例名: test_AreaMode_equal_all_pairs
        // 测试流程: 对所有枚举值两两组合进行==比较
        // 预期结果: 相同枚举值返回true，不同枚举值返回false
        @Expect(AreaMode.El1 == AreaMode.El1, true)
        @Expect(AreaMode.El1 == AreaMode.El2, false)
        @Expect(AreaMode.El2 == AreaMode.El2, true)
        @Expect(AreaMode.El3 == AreaMode.El4, false)
        @Expect(AreaMode.El5 == AreaMode.El5, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_notEqual_El1_vs_El2(): Unit {
        // 原始用例名: test_AreaMode_notEqual_El1_vs_El2
        // 测试流程: 创建AreaMode.El1实例，调用!=(AreaMode.El2)
        // 预期结果: 返回true
        @Expect(AreaMode.El1 != AreaMode.El2, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_notEqual_El2_vs_El3(): Unit {
        // 原始用例名: test_AreaMode_notEqual_El2_vs_El3
        // 测试流程: 创建AreaMode.El2实例，调用!=(AreaMode.El3)
        // 预期结果: 返回true
        @Expect(AreaMode.El2 != AreaMode.El3, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_notEqual_El3_vs_El4(): Unit {
        // 原始用例名: test_AreaMode_notEqual_El3_vs_El4
        // 测试流程: 创建AreaMode.El3实例，调用!=(AreaMode.El4)
        // 预期结果: 返回true
        @Expect(AreaMode.El3 != AreaMode.El4, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_notEqual_El4_vs_El5(): Unit {
        // 原始用例名: test_AreaMode_notEqual_El4_vs_El5
        // 测试流程: 创建AreaMode.El4实例，调用!=(AreaMode.El5)
        // 预期结果: 返回true
        @Expect(AreaMode.El4 != AreaMode.El5, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_notEqual_El5_vs_El1(): Unit {
        // 原始用例名: test_AreaMode_notEqual_El5_vs_El1
        // 测试流程: 创建AreaMode.El5实例，调用!=(AreaMode.El1)
        // 预期结果: 返回true
        @Expect(AreaMode.El5 != AreaMode.El1, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_notEqual_same_value_returns_false(): Unit {
        // 原始用例名: test_AreaMode_notEqual_same_value_returns_false
        // 测试流程: 创建两个相同的AreaMode枚举值（如El1和El1），使用!=运算符比较
        // 预期结果: 返回false
        @Expect(AreaMode.El1 != AreaMode.El1, false)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_notEqual_different_value_returns_true(): Unit {
        // 原始用例名: test_AreaMode_notEqual_different_value_returns_true
        // 测试流程: 创建两个不同的AreaMode枚举值（如El1和El2），使用!=运算符比较
        // 预期结果: 返回true
        @Expect(AreaMode.El1 != AreaMode.El2, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_notEqual_self_comparison(): Unit {
        // 原始用例名: test_AreaMode_notEqual_self_comparison
        // 测试流程: 将AreaMode枚举值与自身进行!=比较
        // 预期结果: 返回false
        let mode = AreaMode.El1
        @Expect(mode != mode, false)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_notEqual_all_pairs(): Unit {
        // 原始用例名: test_AreaMode_notEqual_all_pairs
        // 测试流程: 对所有枚举值两两组合进行!=比较
        // 预期结果: 相同枚举值返回false，不同枚举值返回true
        @Expect(AreaMode.El1 != AreaMode.El1, false)
        @Expect(AreaMode.El1 != AreaMode.El2, true)
        @Expect(AreaMode.El2 != AreaMode.El2, false)
        @Expect(AreaMode.El3 != AreaMode.El4, true)
        @Expect(AreaMode.El5 != AreaMode.El5, false)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_toString_El1(): Unit {
        // 原始用例名: test_AreaMode_toString_El1
        // 测试流程: 调用AreaMode.El1.toString()
        // 预期结果: 返回字符串"AreaMode.El1"
        @Expect(AreaMode.El1.toString(), "AreaMode.El1")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_toString_El2(): Unit {
        // 原始用例名: test_AreaMode_toString_El2
        // 测试流程: 调用AreaMode.El2.toString()
        // 预期结果: 返回字符串"AreaMode.El2"
        @Expect(AreaMode.El2.toString(), "AreaMode.El2")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_toString_El3(): Unit {
        // 原始用例名: test_AreaMode_toString_El3
        // 测试流程: 调用AreaMode.El3.toString()
        // 预期结果: 返回字符串"AreaMode.El3"
        @Expect(AreaMode.El3.toString(), "AreaMode.El3")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_toString_El4(): Unit {
        // 原始用例名: test_AreaMode_toString_El4
        // 测试流程: 调用AreaMode.El4.toString()
        // 预期结果: 返回字符串"AreaMode.El4"
        @Expect(AreaMode.El4.toString(), "AreaMode.El4")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_toString_El5(): Unit {
        // 原始用例名: test_AreaMode_toString_El5
        // 测试流程: 调用AreaMode.El5.toString()
        // 预期结果: 返回字符串"AreaMode.El5"
        @Expect(AreaMode.El5.toString(), "AreaMode.El5")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_toString_return_type(): Unit {
        // 原始用例名: test_AreaMode_toString_return_type
        // 测试流程: 调用任意AreaMode枚举值的toString()方法
        // 预期结果: 返回值类型为String
        let s: String = AreaMode.El1.toString()
        @Expect(s == AreaMode.El1.toString(), true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_AreaMode_toString_all_values(): Unit {
        // 原始用例名: test_AreaMode_toString_all_values
        // 测试流程: 对所有AreaMode枚举值调用toString()方法
        // 预期结果: 每个枚举值返回其对应的字符串表示
        @Expect(AreaMode.El1.toString(), "AreaMode.El1")
        @Expect(AreaMode.El2.toString(), "AreaMode.El2")
        @Expect(AreaMode.El3.toString(), "AreaMode.El3")
        @Expect(AreaMode.El4.toString(), "AreaMode.El4")
        @Expect(AreaMode.El5.toString(), "AreaMode.El5")
    }
}
