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

import ohos.ability.ability_result.*
import ohos.app.ability.want.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

@Test
class TestAbilityResultLlt {
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resultCode_read_zero(): Unit {
        // 原始用例名: test_resultCode_read_zero
        // 测试流程: 创建AbilityResult(0)实例，读取resultCode属性
        // 预期结果: 返回Int32类型值0
        let abilityResult = AbilityResult(0)
        @Expect(abilityResult.resultCode, 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resultCode_read_positive(): Unit {
        // 原始用例名: test_resultCode_read_positive
        // 测试流程: 创建AbilityResult(100)实例，读取resultCode属性
        // 预期结果: 返回Int32类型值100
        let abilityResult = AbilityResult(100)
        @Expect(abilityResult.resultCode, 100)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resultCode_read_negative(): Unit {
        // 原始用例名: test_resultCode_read_negative
        // 测试流程: 创建AbilityResult(-1)实例，读取resultCode属性
        // 预期结果: 返回Int32类型值-1
        let abilityResult = AbilityResult(-1)
        @Expect(abilityResult.resultCode, -1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resultCode_write_zero(): Unit {
        // 原始用例名: test_resultCode_write_zero
        // 测试流程: 创建AbilityResult实例，将resultCode属性设置为0，再读取
        // 预期结果: 读取到的值为0
        let abilityResult = AbilityResult(100)
        abilityResult.resultCode = 0
        @Expect(abilityResult.resultCode, 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resultCode_write_positive(): Unit {
        // 原始用例名: test_resultCode_write_positive
        // 测试流程: 创建AbilityResult实例，将resultCode属性设置为200，再读取
        // 预期结果: 读取到的值为200
        let abilityResult = AbilityResult(0)
        abilityResult.resultCode = 200
        @Expect(abilityResult.resultCode, 200)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resultCode_write_negative(): Unit {
        // 原始用例名: test_resultCode_write_negative
        // 测试流程: 创建AbilityResult实例，将resultCode属性设置为-100，再读取
        // 预期结果: 读取到的值为-100
        let abilityResult = AbilityResult(0)
        abilityResult.resultCode = -100
        @Expect(abilityResult.resultCode, -100)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resultCode_boundary_min(): Unit {
        // 原始用例名: test_resultCode_boundary_min
        // 测试流程: 创建AbilityResult实例，将resultCode设置为Int32.MIN_VALUE（-2147483648），再读取
        // 预期结果: 读取到的值为-2147483648
        let abilityResult = AbilityResult(0)
        abilityResult.resultCode = -2147483648
        @Expect(abilityResult.resultCode, -2147483648)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resultCode_boundary_max(): Unit {
        // 原始用例名: test_resultCode_boundary_max
        // 测试流程: 创建AbilityResult实例，将resultCode设置为Int32.MAX_VALUE（2147483647），再读取
        // 预期结果: 读取到的值为2147483647
        let abilityResult = AbilityResult(0)
        abilityResult.resultCode = 2147483647
        @Expect(abilityResult.resultCode, 2147483647)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resultCode_exception_value(): Unit {
        // 原始用例名: test_resultCode_exception_value
        // 测试流程: 创建AbilityResult(-1)实例，读取resultCode属性
        // 预期结果: 返回-1，表示异常情况下的结果码
        let abilityResult = AbilityResult(-1)
        @Expect(abilityResult.resultCode, -1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resultCode_with_want(): Unit {
        // 原始用例名: test_resultCode_with_want
        // 测试流程: 创建AbilityResult(0, want: Want())实例，分别读取resultCode和want属性
        // 预期结果: resultCode为0，want为默认Want对象
        let abilityResult = AbilityResult(0, want: Want())
        @Expect(abilityResult.resultCode, 0)
        @Expect(abilityResult.want.bundleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_want_read_default(): Unit {
        // 原始用例名: test_want_read_default
        // 测试流程: 创建AbilityResult(0)实例（使用默认want），读取want属性
        // 预期结果: 返回Want类型的默认空Want对象
        let abilityResult = AbilityResult(0)
        @Expect(abilityResult.want.bundleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_want_read_custom(): Unit {
        // 原始用例名: test_want_read_custom
        // 测试流程: 创建包含bundleName的Want对象，使用该Want创建AbilityResult实例，读取want属性
        // 预期结果: 返回包含bundleName信息的Want对象
        let customWant = Want(bundleName: "com.example.test")
        let abilityResult = AbilityResult(0, want: customWant)
        @Expect(abilityResult.want.bundleName, "com.example.test")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_want_write_new_want(): Unit {
        // 原始用例名: test_want_write_new_want
        // 测试流程: 创建AbilityResult实例，将want属性设置为新的Want对象，再读取
        // 预期结果: 读取到的是新设置的Want对象
        let abilityResult = AbilityResult(0)
        let newWant = Want(bundleName: "com.example.new")
        abilityResult.want = newWant
        @Expect(abilityResult.want.bundleName, "com.example.new")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_want_empty_want(): Unit {
        // 原始用例名: test_want_empty_want
        // 测试流程: 创建AbilityResult(0)实例，验证want属性为默认空Want对象
        // 预期结果: want属性为Want()默认构造的空Want对象
        let abilityResult = AbilityResult(0)
        @Expect(abilityResult.want.bundleName, "")
        @Expect(abilityResult.want.abilityName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_want_with_ability_info(): Unit {
        // 原始用例名: test_want_with_ability_info
        // 测试流程: 创建包含abilityName和bundleName的Want对象，使用该Want创建AbilityResult实例
        // 预期结果: want属性包含正确的abilityName和bundleName信息
        let customWant = Want(bundleName: "com.example.app", abilityName: "MainAbility")
        let abilityResult = AbilityResult(0, want: customWant)
        @Expect(abilityResult.want.bundleName, "com.example.app")
        @Expect(abilityResult.want.abilityName, "MainAbility")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_want_modify_after_creation(): Unit {
        // 原始用例名: test_want_modify_after_creation
        // 测试流程: 创建AbilityResult实例后，修改want属性，验证修改生效
        // 预期结果: want属性被成功修改为新值
        let abilityResult = AbilityResult(0)
        let modifiedWant = Want(bundleName: "com.example.modified")
        abilityResult.want = modifiedWant
        @Expect(abilityResult.want.bundleName, "com.example.modified")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_resultCode_zero(): Unit {
        // 原始用例名: test_init_resultCode_zero
        // 测试流程: 调用AbilityResult(0)创建实例
        // 预期结果: 成功创建AbilityResult实例，resultCode为0，want为默认Want()
        let abilityResult = AbilityResult(0)
        @Expect(abilityResult.resultCode, 0)
        @Expect(abilityResult.want.bundleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_resultCode_positive(): Unit {
        // 原始用例名: test_init_resultCode_positive
        // 测试流程: 调用AbilityResult(100)创建实例
        // 预期结果: 成功创建AbilityResult实例，resultCode为100
        let abilityResult = AbilityResult(100)
        @Expect(abilityResult.resultCode, 100)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_resultCode_negative(): Unit {
        // 原始用例名: test_init_resultCode_negative
        // 测试流程: 调用AbilityResult(-50)创建实例
        // 预期结果: 成功创建AbilityResult实例，resultCode为-50
        let abilityResult = AbilityResult(-50)
        @Expect(abilityResult.resultCode, -50)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_resultCode_min_value(): Unit {
        // 原始用例名: test_init_resultCode_min_value
        // 测试流程: 调用AbilityResult(Int32.MIN_VALUE)创建实例，传入-2147483648
        // 预期结果: 成功创建AbilityResult实例，resultCode为-2147483648
        let abilityResult = AbilityResult(-2147483648)
        @Expect(abilityResult.resultCode, -2147483648)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_resultCode_max_value(): Unit {
        // 原始用例名: test_init_resultCode_max_value
        // 测试流程: 调用AbilityResult(Int32.MAX_VALUE)创建实例，传入2147483647
        // 预期结果: 成功创建AbilityResult实例，resultCode为2147483647
        let abilityResult = AbilityResult(2147483647)
        @Expect(abilityResult.resultCode, 2147483647)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_resultCode_minus_one(): Unit {
        // 原始用例名: test_init_resultCode_minus_one
        // 测试流程: 调用AbilityResult(-1)创建实例
        // 预期结果: 成功创建AbilityResult实例，resultCode为-1
        let abilityResult = AbilityResult(-1)
        @Expect(abilityResult.resultCode, -1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_resultCode_exception_code(): Unit {
        // 原始用例名: test_init_resultCode_exception_code
        // 测试流程: 调用AbilityResult(-1)创建实例，-1为异常情况下的结果码
        // 预期结果: 成功创建AbilityResult实例，resultCode为-1
        let abilityResult = AbilityResult(-1)
        @Expect(abilityResult.resultCode, -1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_want_default(): Unit {
        // 原始用例名: test_init_want_default
        // 测试流程: 调用AbilityResult(0)创建实例，不传入want参数（使用默认值）
        // 预期结果: 成功创建AbilityResult实例，want为默认Want()空对象
        let abilityResult = AbilityResult(0)
        @Expect(abilityResult.want.bundleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_want_empty(): Unit {
        // 原始用例名: test_init_want_empty
        // 测试流程: 调用AbilityResult(0, want: Want())创建实例，显式传入空Want对象
        // 预期结果: 成功创建AbilityResult实例，want为Want()空对象
        let abilityResult = AbilityResult(0, want: Want())
        @Expect(abilityResult.want.bundleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_want_with_bundle_name(): Unit {
        // 原始用例名: test_init_want_with_bundle_name
        // 测试流程: 创建包含bundleName的Want对象，调用AbilityResult(0, want: customWant)创建实例
        // 预期结果: 成功创建AbilityResult实例，want包含bundleName信息
        let customWant = Want(bundleName: "com.example.bundle")
        let abilityResult = AbilityResult(0, want: customWant)
        @Expect(abilityResult.want.bundleName, "com.example.bundle")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_want_default_value(): Unit {
        // 原始用例名: test_init_want_default_value
        // 测试流程: 调用AbilityResult(0)创建实例，验证want使用默认值Want()
        // 预期结果: want属性为Want()默认空Want对象
        let abilityResult = AbilityResult(0)
        @Expect(abilityResult.want.bundleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_zero_default_want(): Unit {
        // 原始用例名: test_init_pairwise_zero_default_want
        // 测试流程: 调用AbilityResult(0)，resultCode为0，want使用默认值Want()
        // 预期结果: 成功创建AbilityResult实例，resultCode为0，want为默认Want()
        let abilityResult = AbilityResult(0)
        @Expect(abilityResult.resultCode, 0)
        @Expect(abilityResult.want.bundleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_zero_custom_want(): Unit {
        // 原始用例名: test_init_pairwise_zero_custom_want
        // 测试流程: 调用AbilityResult(0, want: customWant)，resultCode为0，want为包含bundleName的Want对象
        // 预期结果: 成功创建AbilityResult实例，resultCode为0，want包含bundleName信息
        let customWant = Want(bundleName: "com.example.custom")
        let abilityResult = AbilityResult(0, want: customWant)
        @Expect(abilityResult.resultCode, 0)
        @Expect(abilityResult.want.bundleName, "com.example.custom")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_positive_default_want(): Unit {
        // 原始用例名: test_init_pairwise_positive_default_want
        // 测试流程: 调用AbilityResult(100)，resultCode为正整数100，want使用默认值
        // 预期结果: 成功创建AbilityResult实例，resultCode为100，want为默认Want()
        let abilityResult = AbilityResult(100)
        @Expect(abilityResult.resultCode, 100)
        @Expect(abilityResult.want.bundleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_positive_custom_want(): Unit {
        // 原始用例名: test_init_pairwise_positive_custom_want
        // 测试流程: 调用AbilityResult(100, want: customWant)，resultCode为正整数100，want为自定义Want对象
        // 预期结果: 成功创建AbilityResult实例，resultCode为100，want为自定义Want对象
        let customWant = Want(bundleName: "com.example.positive")
        let abilityResult = AbilityResult(100, want: customWant)
        @Expect(abilityResult.resultCode, 100)
        @Expect(abilityResult.want.bundleName, "com.example.positive")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_negative_default_want(): Unit {
        // 原始用例名: test_init_pairwise_negative_default_want
        // 测试流程: 调用AbilityResult(-1)，resultCode为负整数-1，want使用默认值
        // 预期结果: 成功创建AbilityResult实例，resultCode为-1，want为默认Want()
        let abilityResult = AbilityResult(-1)
        @Expect(abilityResult.resultCode, -1)
        @Expect(abilityResult.want.bundleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_negative_custom_want(): Unit {
        // 原始用例名: test_init_pairwise_negative_custom_want
        // 测试流程: 调用AbilityResult(-1, want: customWant)，resultCode为负整数-1，want为自定义Want对象
        // 预期结果: 成功创建AbilityResult实例，resultCode为-1，want为自定义Want对象
        let customWant = Want(bundleName: "com.example.negative")
        let abilityResult = AbilityResult(-1, want: customWant)
        @Expect(abilityResult.resultCode, -1)
        @Expect(abilityResult.want.bundleName, "com.example.negative")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_min_value_default_want(): Unit {
        // 原始用例名: test_init_pairwise_min_value_default_want
        // 测试流程: 调用AbilityResult(Int32.MIN_VALUE)，resultCode为-2147483648，want使用默认值
        // 预期结果: 成功创建AbilityResult实例，resultCode为-2147483648，want为默认Want()
        let abilityResult = AbilityResult(-2147483648)
        @Expect(abilityResult.resultCode, -2147483648)
        @Expect(abilityResult.want.bundleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_max_value_custom_want(): Unit {
        // 原始用例名: test_init_pairwise_max_value_custom_want
        // 测试流程: 调用AbilityResult(Int32.MAX_VALUE, want: customWant)，resultCode为2147483647，want为自定义Want对象
        // 预期结果: 成功创建AbilityResult实例，resultCode为2147483647，want为自定义Want对象
        let customWant = Want(bundleName: "com.example.max")
        let abilityResult = AbilityResult(2147483647, want: customWant)
        @Expect(abilityResult.resultCode, 2147483647)
        @Expect(abilityResult.want.bundleName, "com.example.max")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_creates_instance(): Unit {
        // 原始用例名: test_init_creates_instance
        // 测试流程: 调用AbilityResult(0)构造函数
        // 预期结果: 成功创建AbilityResult类型的实例对象
        let abilityResult = AbilityResult(0)
        @Expect(abilityResult is AbilityResult, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_instance_properties_accessible(): Unit {
        // 原始用例名: test_init_instance_properties_accessible
        // 测试流程: 调用AbilityResult(0, want: Want())创建实例，访问resultCode和want属性
        // 预期结果: resultCode和want属性均可正常访问
        let abilityResult = AbilityResult(0, want: Want())
        let code = abilityResult.resultCode
        let want = abilityResult.want
        @Expect(code, 0)
        @Expect(want.bundleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_named_parameter_want(): Unit {
        // 原始用例名: test_init_named_parameter_want
        // 测试流程: 调用AbilityResult(0, want: Want())，验证want为命名参数
        // 预期结果: 成功创建实例，want参数必须使用命名参数形式传入
        let abilityResult = AbilityResult(0, want: Want())
        @Expect(abilityResult.resultCode, 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_only_required_parameter(): Unit {
        // 原始用例名: test_init_only_required_parameter
        // 测试流程: 调用AbilityResult(0)，仅传入必填参数resultCode
        // 预期结果: 成功创建实例，want使用默认值Want()
        let abilityResult = AbilityResult(0)
        @Expect(abilityResult.resultCode, 0)
        @Expect(abilityResult.want.bundleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_then_modify_properties(): Unit {
        // 原始用例名: test_init_then_modify_properties
        // 测试流程: 创建AbilityResult(0)实例，然后修改resultCode和want属性
        // 预期结果: 属性修改成功，读取到修改后的值
        let abilityResult = AbilityResult(0)
        abilityResult.resultCode = 999
        abilityResult.want = Want(bundleName: "com.example.modified")
        @Expect(abilityResult.resultCode, 999)
        @Expect(abilityResult.want.bundleName, "com.example.modified")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_multiple_instances(): Unit {
        // 原始用例名: test_init_multiple_instances
        // 测试流程: 连续创建多个AbilityResult实例，使用不同的resultCode值
        // 预期结果: 每个实例独立，互不影响
        let r1 = AbilityResult(0)
        let r2 = AbilityResult(100)
        let r3 = AbilityResult(-1)
        @Expect(r1.resultCode, 0)
        @Expect(r2.resultCode, 100)
        @Expect(r3.resultCode, -1)
    }
}
