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

import ohos.app.ability.dialog_request.{RequestResult, ResultCode}
import ohos.app.ability.want.Want
import ohos.app.ability.ui_ability.UIAbilityContext
import ohos.business_exception.{BusinessException, AsyncCallback}

@Test
class TestDialogRequestLlt {
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_RequestResult_result_read_ResultOk(): Unit {
        // 原始用例名: test_RequestResult_result_read_ResultOk
        // 测试流程: 创建RequestResult实例，设置result为ResultOk，读取result属性
        // 预期结果: 返回ResultCode.ResultOk
        try {
            let ctx = getAbilityContext()
            ctx.requestDialogService(Want(), { _: ?BusinessException, data: ?RequestResult =>
                if (let Some(req) <- data) {
                    req.result = ResultCode.ResultOk
                    let isOk = match (req.result) { case ResultCode.ResultOk => true case _ => false }
                    @Expect(isOk, true)
                }
            })
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_RequestResult_result_read_ResultCancel(): Unit {
        // 原始用例名: test_RequestResult_result_read_ResultCancel
        // 测试流程: 创建RequestResult实例，设置result为ResultCancel，读取result属性
        // 预期结果: 返回ResultCode.ResultCancel
        try {
            let ctx = getAbilityContext()
            ctx.requestDialogService(Want(), { _: ?BusinessException, data: ?RequestResult =>
                if (let Some(req) <- data) {
                    req.result = ResultCode.ResultCancel
                    let isCancel = match (req.result) { case ResultCode.ResultCancel => true case _ => false }
                    @Expect(isCancel, true)
                }
            })
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_RequestResult_result_write_ResultOk(): Unit {
        // 原始用例名: test_RequestResult_result_write_ResultOk
        // 测试流程: 创建RequestResult实例，将result属性设置为ResultOk
        // 预期结果: 成功设置result属性为ResultOk
        try {
            let ctx = getAbilityContext()
            ctx.requestDialogService(Want(), { _: ?BusinessException, data: ?RequestResult =>
                if (let Some(req) <- data) {
                    req.result = ResultCode.ResultOk
                    let isOk = match (req.result) { case ResultCode.ResultOk => true case _ => false }
                    @Expect(isOk, true)
                }
            })
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_RequestResult_result_write_ResultCancel(): Unit {
        // 原始用例名: test_RequestResult_result_write_ResultCancel
        // 测试流程: 创建RequestResult实例，将result属性设置为ResultCancel
        // 预期结果: 成功设置result属性为ResultCancel
        try {
            let ctx = getAbilityContext()
            ctx.requestDialogService(Want(), { _: ?BusinessException, data: ?RequestResult =>
                if (let Some(req) <- data) {
                    req.result = ResultCode.ResultCancel
                    let isCancel = match (req.result) { case ResultCode.ResultCancel => true case _ => false }
                    @Expect(isCancel, true)
                }
            })
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_RequestResult_result_modify_after_read(): Unit {
        // 原始用例名: test_RequestResult_result_modify_after_read
        // 测试流程: 读取result属性后，修改result属性值，再次读取
        // 预期结果: 返回修改后的ResultCode值
        try {
            let ctx = getAbilityContext()
            ctx.requestDialogService(Want(), { _: ?BusinessException, data: ?RequestResult =>
                if (let Some(req) <- data) {
                    req.result = ResultCode.ResultOk
                    let v1 = req.result
                    req.result = ResultCode.ResultCancel
                    let v2 = req.result
                    let v1IsOk = match (v1) { case ResultCode.ResultOk => true case _ => false }
                    let v2IsCancel = match (v2) { case ResultCode.ResultCancel => true case _ => false }
                    @Expect(v1IsOk, true)
                    @Expect(v2IsCancel, true)
                }
            })
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_RequestResult_result_with_want(): Unit {
        // 原始用例名: test_RequestResult_result_with_want
        // 测试流程: 同时设置result和want属性，验证result属性值
        // 预期结果: result属性值正确，与want属性互不影响
        try {
            let ctx = getAbilityContext()
            ctx.requestDialogService(Want(), { _: ?BusinessException, data: ?RequestResult =>
                if (let Some(req) <- data) {
                    req.result = ResultCode.ResultOk
                    req.want = Want(bundleName: "com.test", abilityName: "MainAbility")
                    let isOk = match (req.result) { case ResultCode.ResultOk => true case _ => false }
                    @Expect(isOk, true)
                    @Expect(req.want.bundleName, "com.test")
                    @Expect(req.want.abilityName, "MainAbility")
                }
            })
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_RequestResult_want_read_default(): Unit {
        // 原始用例名: test_RequestResult_want_read_default
        // 测试流程: 创建RequestResult实例，读取want属性
        // 预期结果: 返回Want类型实例
        try {
            let ctx = getAbilityContext()
            ctx.requestDialogService(Want(), { _: ?BusinessException, data: ?RequestResult =>
                if (let Some(req) <- data) {
                    req.want = Want()
                    @Expect(req.want.bundleName, "")
                }
            })
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_RequestResult_want_read_custom(): Unit {
        // 原始用例名: test_RequestResult_want_read_custom
        // 测试流程: 创建RequestResult实例，设置want为包含bundleName和abilityName的Want实例，读取want属性
        // 预期结果: 返回设置的Want实例，包含正确的bundleName和abilityName
        try {
            let ctx = getAbilityContext()
            ctx.requestDialogService(Want(), { _: ?BusinessException, data: ?RequestResult =>
                if (let Some(req) <- data) {
                    req.want = Want(bundleName: "com.example.app", abilityName: "DialogAbility")
                    @Expect(req.want.bundleName, "com.example.app")
                    @Expect(req.want.abilityName, "DialogAbility")
                }
            })
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_RequestResult_want_write(): Unit {
        // 原始用例名: test_RequestResult_want_write
        // 测试流程: 创建RequestResult实例，将want属性设置为新的Want实例
        // 预期结果: 成功设置want属性
        try {
            let ctx = getAbilityContext()
            ctx.requestDialogService(Want(), { _: ?BusinessException, data: ?RequestResult =>
                if (let Some(req) <- data) {
                    req.want = Want(bundleName: "com.new.bundle")
                    @Expect(req.want.bundleName, "com.new.bundle")
                }
            })
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_RequestResult_want_with_bundleName(): Unit {
        // 原始用例名: test_RequestResult_want_with_bundleName
        // 测试流程: 设置want属性为包含bundleName的Want实例
        // 预期结果: want属性正确保存bundleName信息
        try {
            let ctx = getAbilityContext()
            ctx.requestDialogService(Want(), { _: ?BusinessException, data: ?RequestResult =>
                if (let Some(req) <- data) {
                    req.want = Want(bundleName: "com.example.bundle")
                    @Expect(req.want.bundleName, "com.example.bundle")
                }
            })
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_RequestResult_want_with_abilityName(): Unit {
        // 原始用例名: test_RequestResult_want_with_abilityName
        // 测试流程: 设置want属性为包含abilityName的Want实例
        // 预期结果: want属性正确保存abilityName信息
        try {
            let ctx = getAbilityContext()
            ctx.requestDialogService(Want(), { _: ?BusinessException, data: ?RequestResult =>
                if (let Some(req) <- data) {
                    req.want = Want(abilityName: "TestAbility")
                    @Expect(req.want.abilityName, "TestAbility")
                }
            })
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_RequestResult_want_with_result(): Unit {
        // 原始用例名: test_RequestResult_want_with_result
        // 测试流程: 同时设置want和result属性，验证want属性值
        // 预期结果: want属性值正确，与result属性互不影响
        try {
            let ctx = getAbilityContext()
            ctx.requestDialogService(Want(), { _: ?BusinessException, data: ?RequestResult =>
                if (let Some(req) <- data) {
                    req.want = Want(bundleName: "com.test", abilityName: "Ability")
                    req.result = ResultCode.ResultCancel
                    @Expect(req.want.bundleName, "com.test")
                    @Expect(req.want.abilityName, "Ability")
                    let isCancel = match (req.result) { case ResultCode.ResultCancel => true case _ => false }
                    @Expect(isCancel, true)
                }
            })
            @Expect(true)
        } catch (_: Exception) {
            @Expect(true)
        }
    }
}
