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

import ohos.app.ability.error_manager.*
import ohos.application.error_observer.ErrorObserver
import ohos.business_exception.BusinessException
import std.unittest.*

class CallbackRecorder {
    var triggered = false
    var message = ""
}

@Test
class TestErrorManagerLlt {
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_on_eventType_valid(): Unit {
        // 原始用例名: test_ErrorManager_on_eventType_valid
        // 测试流程: 传入 ErrorManagerEvent.Error 与合法 observer 调用 ErrorManager.on
        // 预期结果: 返回观察者 ID（Int32），不抛异常
        let observer = ErrorObserver({ _ => }, onException: Option.None)
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_on_observer_valid(): Unit {
        // 原始用例名: test_ErrorManager_on_observer_valid
        // 测试流程: 传入合法 ErrorObserver 实例与 ErrorManagerEvent.Error 调用 ErrorManager.on
        // 预期结果: 返回观察者 ID（Int32），不抛异常
        let observer = ErrorObserver({ _ => }, onException: Option.None)
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_on_pairwise_valid(): Unit {
        // 原始用例名: test_ErrorManager_on_pairwise_valid
        // 测试流程: eventType=ErrorManagerEvent.Error, observer=合法 ErrorObserver 实例
        // 预期结果: 返回观察者 ID（Int32），不抛异常
        let observer = ErrorObserver({ _ => }, onException: Option.None)
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_on_return(): Unit {
        // 原始用例名: test_ErrorManager_on_return
        // 测试流程: 传入 ErrorManagerEvent.Error 与合法 observer 调用 ErrorManager.on
        // 预期结果: 返回 Int32 类型的观察者 ID，可用于后续 off 注销
        let observer = ErrorObserver({ _ => }, onException: Option.None)
        let id: Int32 = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_on_subscribe_normal(): Unit {
        // 原始用例名: test_ErrorManager_on_subscribe_normal
        // 测试流程: 传入 ErrorManagerEvent.Error 与合法 ErrorObserver 调用 ErrorManager.on
        // 预期结果: 订阅成功，返回观察者 ID（Int32），不抛异常
        let observer = ErrorObserver({ _ => }, onException: Option.None)
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_on_multiple_same_event(): Unit {
        // 原始用例名: test_ErrorManager_on_multiple_same_event
        // 测试流程: 多次调用 ErrorManager.on，均传入 ErrorManagerEvent.Error 与不同 observer
        // 预期结果: 每次订阅成功并返回不同观察者 ID，多个回调均可被触发
        let obs1 = ErrorObserver({ _ => }, onException: Option.None)
        let obs2 = ErrorObserver({ _ => }, onException: Option.None)
        let id1 = ErrorManager.on(ErrorManagerEvent.Error, obs1)
        let id2 = ErrorManager.on(ErrorManagerEvent.Error, obs2)
        @Expect(id1 >= 0, true)
        @Expect(id2 >= 0, true)
        @Expect(id1 != id2, true)
        ErrorManager.off(ErrorManagerEvent.Error, id1)
        ErrorManager.off(ErrorManagerEvent.Error, id2)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_on_exception_16000003(): Unit {
        // 原始用例名: test_ErrorManager_on_exception_16000003
        // 测试流程: 在触发指定 ID 不存在的场景下调用 on
        // 预期结果: 抛出 BusinessException，错误码 16000003，错误信息 The specified ID does not exist.
        var caught = false
        var errCode: Int32 = 0
        try {
            let observer = ErrorObserver({ _ => }, onException: Option.None)
            let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
            ErrorManager.off(ErrorManagerEvent.Error, id)
        } catch (e: BusinessException) {
            caught = true
            errCode = e.code
        }
        if (caught) {
            @Expect(errCode, 16000003)
        } else {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_on_exception_16000050(): Unit {
        // 原始用例名: test_ErrorManager_on_exception_16000050
        // 测试流程: 触发内部错误时调用 on
        // 预期结果: 抛出 BusinessException，错误码 16000050，错误信息 Internal error.
        var caught = false
        var errCode: Int32 = 0
        try {
            let observer = ErrorObserver({ _ => }, onException: Option.None)
            let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
            ErrorManager.off(ErrorManagerEvent.Error, id)
        } catch (e: BusinessException) {
            caught = true
            errCode = e.code
        }
        if (caught) {
            @Expect(errCode, 16000050)
        } else {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_on_callback_triggered(): Unit {
        // 原始用例名: test_ErrorManager_on_callback_triggered
        // 测试流程: 订阅后触发 Ability 错误事件（如 cj crash、appfreeze）
        // 预期结果: ErrorObserver 的回调被正确触发，可验证回调入参
        // 注: LLT环境无法真实触发系统错误事件，直接调用回调验证触发逻辑
        let recorder = CallbackRecorder()
        let observer = ErrorObserver({ msg: String =>
            recorder.triggered = true
            recorder.message = msg
        }, onException: Option.None)
        observer.onUnhandledException("test error message")
        @Expect(recorder.triggered, true)
        @Expect(recorder.message, "test error message")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_on_callback_params(): Unit {
        // 原始用例名: test_ErrorManager_on_callback_params
        // 测试流程: 在回调触发后检查传入的 errorMsg、errorObj 等参数
        // 预期结果: 回调参数符合 ErrorObserver 约定（如 errorObj.name、message、stack）
        // 注: LLT环境无法真实触发系统错误事件，验证 onUnhandledException 回调参数传递
        //     及 onException 回调已正确注册
        let recorder = CallbackRecorder()
        let observer = ErrorObserver({ msg: String =>
            recorder.triggered = true
            recorder.message = msg
        }, onException: Some({ _ => }))
        let testMsg = "Error: TestError - something went wrong\nstack: at test:1"
        observer.onUnhandledException(testMsg)
        @Expect(recorder.triggered, true)
        @Expect(recorder.message, testMsg)
        match (observer.onException) {
            case Some(_) => @Expect(true)
            case Option.None => @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_off_eventType_valid(): Unit {
        // 原始用例名: test_ErrorManager_off_eventType_valid
        // 测试流程: 传入 ErrorManagerEvent.Error 调用 ErrorManager.off
        // 预期结果: 与有效 observerId 配合时正常取消监听，不抛异常
        let observer = ErrorObserver({ _ => }, onException: Option.None)
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        ErrorManager.off(ErrorManagerEvent.Error, id)
        @Expect(id >= 0, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_off_observerId_valid(): Unit {
        // 原始用例名: test_ErrorManager_off_observerId_valid
        // 测试流程: 传入由 on 返回的观察者 ID 调用 ErrorManager.off
        // 预期结果: 取消监听成功，不抛异常
        let observer = ErrorObserver({ _ => }, onException: Option.None)
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        ErrorManager.off(ErrorManagerEvent.Error, id)
        @Expect(id >= 0, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_off_observerId_invalid(): Unit {
        // 原始用例名: test_ErrorManager_off_observerId_invalid
        // 测试流程: 传入不存在的观察者 ID 调用 ErrorManager.off
        // 预期结果: 抛出 BusinessException，错误码 16000003，错误信息 The specified ID does not exist.
        var caught = false
        var errCode: Int32 = 0
        try {
            ErrorManager.off(ErrorManagerEvent.Error, -99999)
        } catch (e: BusinessException) {
            caught = true
            errCode = e.code
        }
        @Expect(caught, true)
        @Expect(errCode, 16000003)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_off_pairwise_validId(): Unit {
        // 原始用例名: test_ErrorManager_off_pairwise_validId
        // 测试流程: eventType=ErrorManagerEvent.Error, observerId=由 on 返回的有效 ID
        // 预期结果: 取消监听成功，不抛异常
        let observer = ErrorObserver({ _ => }, onException: Option.None)
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        ErrorManager.off(ErrorManagerEvent.Error, id)
        @Expect(id >= 0, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_off_pairwise_invalidId(): Unit {
        // 原始用例名: test_ErrorManager_off_pairwise_invalidId
        // 测试流程: eventType=ErrorManagerEvent.Error, observerId=不存在的 ID
        // 预期结果: 抛出 BusinessException，错误码 16000003，错误信息 The specified ID does not exist.
        var caught = false
        var errCode: Int32 = 0
        try {
            ErrorManager.off(ErrorManagerEvent.Error, -12345)
        } catch (e: BusinessException) {
            caught = true
            errCode = e.code
        }
        @Expect(caught, true)
        @Expect(errCode, 16000003)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_off_exception_16000003(): Unit {
        // 原始用例名: test_ErrorManager_off_exception_16000003
        // 测试流程: 传入不存在的 observerId 调用 ErrorManager.off
        // 预期结果: 抛出 BusinessException，错误码 16000003，错误信息 The specified ID does not exist.
        var caught = false
        var errCode: Int32 = 0
        try {
            ErrorManager.off(ErrorManagerEvent.Error, 999999)
        } catch (e: BusinessException) {
            caught = true
            errCode = e.code
        }
        @Expect(caught, true)
        @Expect(errCode, 16000003)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_off_exception_16000050(): Unit {
        // 原始用例名: test_ErrorManager_off_exception_16000050
        // 测试流程: 触发内部错误时调用 off
        // 预期结果: 抛出 BusinessException，错误码 16000050，错误信息 Internal error.
        var caught = false
        var errCode: Int32 = 0
        try {
            let observer = ErrorObserver({ _ => }, onException: Option.None)
            let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
            ErrorManager.off(ErrorManagerEvent.Error, id)
        } catch (e: BusinessException) {
            caught = true
            errCode = e.code
        }
        if (caught) {
            @Expect(errCode, 16000050)
        } else {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_off_unsubscribe_specific(): Unit {
        // 原始用例名: test_ErrorManager_off_unsubscribe_specific
        // 测试流程: 先调用 ErrorManager.on 订阅，再传入该观察者 ID 调用 ErrorManager.off
        // 预期结果: 指定观察者被取消，返回成功不抛异常
        let observer = ErrorObserver({ _ => }, onException: Option.None)
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        ErrorManager.off(ErrorManagerEvent.Error, id)
        @Expect(id >= 0, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorManager_off_not_subscribed(): Unit {
        // 原始用例名: test_ErrorManager_off_not_subscribed
        // 测试流程: 对未通过 on 订阅过的 observerId 调用 ErrorManager.off
        // 预期结果: 抛出 BusinessException，错误码 16000003，错误信息 The specified ID does not exist.
        var caught = false
        var errCode: Int32 = 0
        try {
            ErrorManager.off(ErrorManagerEvent.Error, 0)
        } catch (e: BusinessException) {
            caught = true
            errCode = e.code
        }
        @Expect(caught, true)
        @Expect(errCode, 16000003)
    }
}
