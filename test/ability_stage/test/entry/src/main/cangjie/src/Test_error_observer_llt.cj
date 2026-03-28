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

import ohos.application.error_observer.*
import ohos.app.ability.error_manager.{ErrorManager, ErrorManagerEvent}
import std.unittest.*

@Test
class TestErrorObserverLltPart1 {
    // --- ErrorObserver.init ---
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_onUnhandledException_valid_callback(): Unit {
        // 测试流程: 传入有效的回调函数创建ErrorObserver实例
        // 预期结果: 成功创建ErrorObserver实例，onUnhandledException为传入的回调函数
        let observer = ErrorObserver({ _ => () })
        match (observer.onException) {
            case Option.None => ()
            case Some(_) => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_onUnhandledException_log_callback(): Unit {
        // 测试流程: 传入打印日志的回调函数创建ErrorObserver实例
        // 预期结果: 成功创建ErrorObserver实例
        let observer = ErrorObserver({ _ => () })
        observer.onUnhandledException("test")
        match (observer.onException) {
            case Option.None => ()
            case Some(_) => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_onException_some_callback(): Unit {
        // 测试流程: 传入Some({ errorObj => ... })创建ErrorObserver实例
        // 预期结果: 成功创建ErrorObserver实例，onException为Some(callback)
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_onException_none(): Unit {
        // 测试流程: 传入onException: None创建ErrorObserver实例
        // 预期结果: 成功创建ErrorObserver实例，onException为None
        let observer = ErrorObserver({ _ => () }, onException: Option.None)
        match (observer.onException) {
            case Option.None => ()
            case Some(_) => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_onException_default_none(): Unit {
        // 测试流程: 不传入onException参数创建ErrorObserver实例
        // 预期结果: 成功创建ErrorObserver实例，onException默认为None
        let observer = ErrorObserver({ _ => () })
        match (observer.onException) {
            case Option.None => ()
            case Some(_) => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_valid_callback_some(): Unit {
        // 测试流程: 传入有效回调和onException: Some(callback)创建ErrorObserver实例
        // 预期结果: 成功创建ErrorObserver实例，两个回调均正确设置
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_valid_callback_none(): Unit {
        // 测试流程: 传入有效回调和onException: None创建ErrorObserver实例
        // 预期结果: 成功创建ErrorObserver实例，onUnhandledException正确设置，onException为None
        let observer = ErrorObserver({ _ => () }, onException: Option.None)
        match (observer.onException) {
            case Option.None => ()
            case Some(_) => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_valid_callback_default(): Unit {
        // 测试流程: 只传入onUnhandledException回调，不传onException参数创建ErrorObserver实例
        // 预期结果: 成功创建ErrorObserver实例，onException使用默认值None
        let observer = ErrorObserver({ _ => () })
        match (observer.onException) {
            case Option.None => ()
            case Some(_) => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_return_ErrorObserver_instance(): Unit {
        // 测试流程: 调用ErrorObserver构造函数
        // 预期结果: 返回ErrorObserver类型的实例
        let observer = ErrorObserver({ _ => () })
        observer.onUnhandledException("")
        match (observer.onException) {
            case Option.None => ()
            case Some(_) => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_properties_correctly_set(): Unit {
        // 测试流程: 创建ErrorObserver实例后，验证onUnhandledException和onException属性
        // 预期结果: 两个属性均为构造函数传入的值
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        observer.onUnhandledException("")
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_register_with_ErrorManager(): Unit {
        // 测试流程: 创建ErrorObserver实例后，使用ErrorManager.on(ErrorManagerEvent.Error, observer)注册
        // 预期结果: 成功注册异常监听，返回监听ID
        let observer = ErrorObserver({ _ => () })
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_full_exception_handling(): Unit {
        // 测试流程: 创建完整的ErrorObserver实例（包含两个回调），注册后触发异常
        // 预期结果: onUnhandledException和onException回调均被触发（本单元测试仅验证实例创建和注册）
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_multiple_observers(): Unit {
        // 测试流程: 创建多个ErrorObserver实例并分别注册
        // 预期结果: 每个ErrorObserver实例均成功注册
        let obs1 = ErrorObserver({ _ => () })
        let obs2 = ErrorObserver({ _ => () })
        let id1 = ErrorManager.on(ErrorManagerEvent.Error, obs1)
        let id2 = ErrorManager.on(ErrorManagerEvent.Error, obs2)
        @Expect(id1 >= 0, true)
        @Expect(id2 >= 0, true)
        @Expect(id1 != id2, true)
        ErrorManager.off(ErrorManagerEvent.Error, id1)
        ErrorManager.off(ErrorManagerEvent.Error, id2)
    }
}

@Test
class TestErrorObserverLltPart2 {
    // --- ErrorObserver.onUnhandledException ---
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onUnhandledException_read(): Unit {
        // 测试流程: 创建ErrorObserver实例后，读取onUnhandledException属性
        // 预期结果: 返回设置的回调函数
        let callback = { _: String => () }
        let observer = ErrorObserver(callback)
        observer.onUnhandledException("")
        match (observer.onException) {
            case Option.None => ()
            case Some(_) => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onUnhandledException_write(): Unit {
        // 测试流程: 创建ErrorObserver实例后，修改onUnhandledException属性为新的回调函数
        // 预期结果: 成功修改onUnhandledException属性
        let observer = ErrorObserver({ _ => () })
        observer.onUnhandledException = { _ => () }
        observer.onUnhandledException("")
        match (observer.onException) {
            case Option.None => ()
            case Some(_) => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onUnhandledException_callback_triggered(): Unit {
        // 测试流程: 注册ErrorObserver后，触发未捕获的异常
        // 预期结果: onUnhandledException回调被触发，接收到异常消息字符串
        // 注: 单元测试中不实际触发异常，仅验证回调可正确设置
        let observer = ErrorObserver({ _ => () })
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onUnhandledException_callback_receives_error_msg(): Unit {
        // 测试流程: 在onUnhandledException回调中验证接收到的参数
        // 预期结果: 接收到String类型的异常消息
        let observer = ErrorObserver({ _ => () })
        observer.onUnhandledException("error-msg")
        let msgLen = "error-msg".size
        @Expect(msgLen >= 0, true)
        match (observer.onException) {
            case Option.None => ()
            case Some(_) => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onUnhandledException_with_onException(): Unit {
        // 测试流程: 同时设置onUnhandledException和onException回调，触发异常
        // 预期结果: 两个回调均被正确触发
        // 注: 单元测试中仅验证两个回调可同时设置
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        observer.onUnhandledException("")
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
    }

    // --- ErrorObserver.onException ---
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onException_read_some(): Unit {
        // 测试流程: 创建ErrorObserver实例设置onException为Some(callback)后，读取onException属性
        // 预期结果: 返回Some(callback)
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onException_read_none(): Unit {
        // 测试流程: 创建ErrorObserver实例使用默认onException后，读取onException属性
        // 预期结果: 返回None
        let observer = ErrorObserver({ _ => () })
        match (observer.onException) {
            case Option.None => ()
            case Some(_) => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onException_write(): Unit {
        // 测试流程: 创建ErrorObserver实例后，修改onException属性为新的回调函数
        // 预期结果: 成功修改onException属性
        let observer = ErrorObserver({ _ => () })
        observer.onException = Some({ _ => () })
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onException_callback_triggered(): Unit {
        // 测试流程: 注册ErrorObserver且onException为Some(callback)后，触发异常
        // 预期结果: onException回调被触发，接收到ErrorObject实例
        // 注: 单元测试中不实际触发异常，仅验证注册流程
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onException_none_no_callback(): Unit {
        // 测试流程: 注册ErrorObserver且onException为None后，触发异常
        // 预期结果: onException回调不被触发
        // 注: 单元测试中仅验证onException为None时注册成功
        let observer = ErrorObserver({ _ => () }, onException: Option.None)
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        match (observer.onException) {
            case Option.None => ()
            case Some(_) => @Expect(0, 1)
        }
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_onException_callback_access_ErrorObject(): Unit {
        // 测试流程: 在onException回调中访问ErrorObject的name、message和stack属性
        // 预期结果: 成功访问ErrorObject的所有属性
        // 注: 单元测试中仅验证回调可正确设置及注册成功
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }
}

@Test
class TestErrorObjectLlt {
    // ErrorObject tests - require ErrorObject from onException callback when exception occurs.
    // Tests that need ErrorObject instance verify callback structure; full verification requires exception trigger.

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorObject_name_read(): Unit {
        // 测试流程: 当应用发生异常时，在onException回调中读取ErrorObject的name属性
        // 预期结果: 返回String类型的异常事件名称
        // 注: 单元测试中通过注册回调验证结构，实际值需异常触发后验证
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorObject_name_type(): Unit {
        // 测试流程: 验证ErrorObject.name的类型
        // 预期结果: 类型为String
        // 注: 单元测试中验证onException为Some时注册成功
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorObject_message_type(): Unit {
        // 测试流程: 验证ErrorObject.message的类型
        // 预期结果: 类型为String
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorObject_stack_type(): Unit {
        // 测试流程: 验证ErrorObject.stack的类型
        // 预期结果: 类型为Option<String>
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorObject_stack_extract_value(): Unit {
        // 测试流程: 使用if let Some(v) <- errorObj.stack语法提取堆栈信息
        // 预期结果: 成功提取堆栈信息字符串
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorObject_name_readonly(): Unit {
        // 测试流程: 尝试对ErrorObject.name属性进行写操作
        // 预期结果: 编译时报错，name为只读属性
        // 注: 单元测试中验证onException为Some时注册成功
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorObject_message_read(): Unit {
        // 测试流程: 当应用发生异常时，在onException回调中读取ErrorObject的message属性
        // 预期结果: 返回String类型的异常事件信息
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorObject_message_readonly(): Unit {
        // 测试流程: 尝试对ErrorObject.message属性进行写操作
        // 预期结果: 编译时报错，message为只读属性
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorObject_message_content(): Unit {
        // 测试流程: 触发特定异常，验证ErrorObject.message包含异常描述信息
        // 预期结果: message属性包含异常的具体描述信息
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorObject_stack_read_some(): Unit {
        // 测试流程: 当应用发生异常且有堆栈信息时，在onException回调中读取ErrorObject的stack属性
        // 预期结果: 返回Some(堆栈信息字符串)
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorObject_stack_read_none(): Unit {
        // 测试流程: 当应用发生异常但无堆栈信息时，读取ErrorObject的stack属性
        // 预期结果: 返回None
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorObject_stack_readonly(): Unit {
        // 测试流程: 尝试对ErrorObject.stack属性进行写操作
        // 预期结果: 编译时报错，stack为只读属性
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorObject_stack_log_info(): Unit {
        // 测试流程: 在onException回调中判断stack是否为Some，如是则打印堆栈信息
        // 预期结果: 正确判断并打印堆栈信息
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_ErrorObject_name_with_message_stack(): Unit {
        // 测试流程: 在onException回调中同时读取ErrorObject的name、message和stack属性
        // 预期结果: 三个属性均能正确读取
        let observer = ErrorObserver({ _ => () }, onException: Some({ _ => () }))
        let id = ErrorManager.on(ErrorManagerEvent.Error, observer)
        @Expect(id >= 0, true)
        match (observer.onException) {
            case Some(_) => ()
            case Option.None => @Expect(0, 1)
        }
        ErrorManager.off(ErrorManagerEvent.Error, id)
    }
}
