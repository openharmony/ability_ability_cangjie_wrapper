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

import ohos.app.ability.want.*
import ohos.app.ability.want_constant.*
import ohos.business_exception.BusinessException
import std.collection.*

@Test
class TestWantLltPart1 {
    // --- Want.deviceId ---
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_deviceId_read_empty(): Unit {
        // 测试流程: 创建Want实例使用默认参数，读取deviceId属性
        // 预期结果: 返回空字符串""
        let want = Want()
        @Expect(want.deviceId, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_deviceId_write(): Unit {
        // 测试流程: 创建Want实例，将deviceId属性设置为"device123"
        // 预期结果: 成功设置deviceId属性为"device123"
        let want = Want()
        want.deviceId = "device123"
        @Expect(want.deviceId, "device123")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_deviceId_read_after_write(): Unit {
        // 测试流程: 设置deviceId属性后再读取
        // 预期结果: 读取到设置的deviceId值
        let want = Want()
        want.deviceId = "device456"
        @Expect(want.deviceId, "device456")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_deviceId_empty_means_current_device(): Unit {
        // 测试流程: 创建Want实例，deviceId设置为空字符串，用于startAbility
        // 预期结果: 表示指定当前设备
        let want = Want(deviceId: "")
        @Expect(want.deviceId, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_deviceId_with_bundleName_abilityName(): Unit {
        // 测试流程: 同时设置deviceId、bundleName和abilityName
        // 预期结果: 三个属性均正确设置
        let want = Want(deviceId: "device123", bundleName: "com.example.app", abilityName: "MainAbility")
        @Expect(want.deviceId, "device123")
        @Expect(want.bundleName, "com.example.app")
        @Expect(want.abilityName, "MainAbility")
    }

    // --- Want.bundleName ---
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_bundleName_read_empty(): Unit {
        // 测试流程: 创建Want实例使用默认参数，读取bundleName属性
        // 预期结果: 返回空字符串""
        let want = Want()
        @Expect(want.bundleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_bundleName_write(): Unit {
        // 测试流程: 创建Want实例，将bundleName属性设置为"com.example.app"
        // 预期结果: 成功设置bundleName属性为"com.example.app"
        let want = Want()
        want.bundleName = "com.example.app"
        @Expect(want.bundleName, "com.example.app")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_bundleName_explicit_want(): Unit {
        // 测试流程: 同时设置bundleName和abilityName用于显式Want
        // 预期结果: Want可以直接匹配到指定的Ability
        let want = Want(bundleName: "com.example.app", abilityName: "MainAbility")
        @Expect(want.bundleName, "com.example.app")
        @Expect(want.abilityName, "MainAbility")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_bundleName_with_abilityName(): Unit {
        // 测试流程: 同时设置bundleName为"com.example.app"和abilityName为"MainAbility"
        // 预期结果: 两个属性均正确设置，构成显式Want
        let want = Want(bundleName: "com.example.app", abilityName: "MainAbility")
        @Expect(want.bundleName, "com.example.app")
        @Expect(want.abilityName, "MainAbility")
    }

    // --- Want.abilityName ---
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_abilityName_read_empty(): Unit {
        // 测试流程: 创建Want实例使用默认参数，读取abilityName属性
        // 预期结果: 返回空字符串""
        let want = Want()
        @Expect(want.abilityName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_abilityName_write(): Unit {
        // 测试流程: 创建Want实例，将abilityName属性设置为"MainAbility"
        // 预期结果: 成功设置abilityName属性为"MainAbility"
        let want = Want()
        want.abilityName = "MainAbility"
        @Expect(want.abilityName, "MainAbility")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_abilityName_unique_in_app(): Unit {
        // 测试流程: 验证abilityName在应用范围内唯一
        // 预期结果: abilityName正确标识唯一的Ability组件
        let want = Want(abilityName: "MainAbility")
        @Expect(want.abilityName, "MainAbility")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_abilityName_with_bundleName_moduleName(): Unit {
        // 测试流程: 同时设置abilityName、bundleName和moduleName
        // 预期结果: 三个属性均正确设置
        let want = Want(abilityName: "MainAbility", bundleName: "com.example.app", moduleName: "entry")
        @Expect(want.abilityName, "MainAbility")
        @Expect(want.bundleName, "com.example.app")
        @Expect(want.moduleName, "entry")
    }

    // --- Want.moduleName ---
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_moduleName_read_empty(): Unit {
        // 测试流程: 创建Want实例使用默认参数，读取moduleName属性
        // 预期结果: 返回空字符串""
        let want = Want()
        @Expect(want.moduleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_moduleName_write(): Unit {
        // 测试流程: 创建Want实例，将moduleName属性设置为"entry"
        // 预期结果: 成功设置moduleName属性为"entry"
        let want = Want()
        want.moduleName = "entry"
        @Expect(want.moduleName, "entry")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_moduleName_with_bundleName_abilityName(): Unit {
        // 测试流程: 同时设置moduleName、bundleName和abilityName
        // 预期结果: 三个属性均正确设置
        let want = Want(moduleName: "entry", bundleName: "com.example.app", abilityName: "MainAbility")
        @Expect(want.moduleName, "entry")
        @Expect(want.bundleName, "com.example.app")
        @Expect(want.abilityName, "MainAbility")
    }

    // --- Want.flags ---
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_flags_read_default(): Unit {
        // 测试流程: 创建Want实例使用默认参数，读取flags属性
        // 预期结果: 返回0
        let want = Want()
        @Expect(want.flags, 0u32)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_flags_write_read_permission(): Unit {
        // 测试流程: 创建Want实例，将flags属性设置为0x00000001
        // 预期结果: 成功设置flags属性为0x00000001（FLAG_AUTH_READ_URI_PERMISSION）
        let want = Want()
        want.flags = 0x00000001u32
        @Expect(want.flags, Flags.FLAG_AUTH_READ_URI_PERMISSION)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_flags_write_combined(): Unit {
        // 测试流程: 创建Want实例，将flags属性设置为0x00000003（读写权限组合）
        // 预期结果: 成功设置flags属性为0x00000003
        let want = Want()
        want.flags = 0x00000003u32
        @Expect(want.flags, 0x00000003u32)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_flags_bitwise_or_combination(): Unit {
        // 测试流程: 将多个Flags常量进行按位或组合设置到flags属性
        // 预期结果: flags属性值为多个标志位的组合
        let want = Want()
        want.flags = Flags.FLAG_AUTH_READ_URI_PERMISSION | Flags.FLAG_AUTH_WRITE_URI_PERMISSION
        @Expect(want.flags, 0x00000003u32)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_flags_with_uri(): Unit {
        // 测试流程: 同时设置flags为FLAG_AUTH_READ_URI_PERMISSION和uri属性
        // 预期结果: 两个属性均正确设置，授予读取URI的权限
        let want = Want(flags: Flags.FLAG_AUTH_READ_URI_PERMISSION, uri: "file://data/storage/test.txt")
        @Expect(want.flags, Flags.FLAG_AUTH_READ_URI_PERMISSION)
        @Expect(want.uri, "file://data/storage/test.txt")
    }
}

@Test
class TestWantLltPart2 {
    // --- Want.uri ---
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_uri_read_empty(): Unit {
        // 测试流程: 创建Want实例使用默认参数，读取uri属性
        // 预期结果: 返回空字符串""
        let want = Want()
        @Expect(want.uri, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_uri_write(): Unit {
        // 测试流程: 创建Want实例，将uri属性设置为"file://data/storage/test.txt"
        // 预期结果: 成功设置uri属性
        let want = Want()
        want.uri = "file://data/storage/test.txt"
        @Expect(want.uri, "file://data/storage/test.txt")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_uri_matching(): Unit {
        // 测试流程: 设置uri属性包含scheme、authority和path信息
        // 预期结果: Want将匹配指定的Uri信息
        let want = Want(uri: "https://example.com/path/resource")
        @Expect(want.uri, "https://example.com/path/resource")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_uri_with_dataType(): Unit {
        // 测试流程: 同时设置uri和dataType属性
        // 预期结果: 两个属性均正确设置，用于指明待处理的数据类型
        let want = Want(uri: "file://test.txt", dataType: "text/plain")
        @Expect(want.uri, "file://test.txt")
        @Expect(want.dataType, "text/plain")
    }

    // --- Want.action ---
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_action_read_empty(): Unit {
        // 测试流程: 创建Want实例使用默认参数，读取action属性
        // 预期结果: 返回空字符串""
        let want = Want()
        @Expect(want.action, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_action_write(): Unit {
        // 测试流程: 创建Want实例，将action属性设置为"ohos.want.action.viewData"
        // 预期结果: 成功设置action属性
        let want = Want()
        want.action = "ohos.want.action.viewData"
        @Expect(want.action, "ohos.want.action.viewData")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_action_implicit_want(): Unit {
        // 测试流程: 设置action属性用于隐式Want
        // 预期结果: 可以配合uri或parameters表示对数据执行的操作
        let want = Want(action: "ohos.want.action.viewData")
        @Expect(want.action, "ohos.want.action.viewData")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_action_with_entities(): Unit {
        // 测试流程: 同时设置action和entities属性
        // 预期结果: 两个属性均正确设置，用于隐式Want匹配
        let want = Want(action: "ohos.want.action.viewData", entities: ["entity.browser"])
        @Expect(want.action, "ohos.want.action.viewData")
        @Expect(want.entities.size, 1)
        @Expect(want.entities[0], "entity.browser")
    }

    // --- Want.entities ---
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_entities_read_empty(): Unit {
        // 测试流程: 创建Want实例使用默认参数，读取entities属性
        // 预期结果: 返回空数组[]
        let want = Want()
        @Expect(want.entities.size, 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_entities_write(): Unit {
        // 测试流程: 创建Want实例，将entities属性设置为["entity.browser"]
        // 预期结果: 成功设置entities属性
        let want = Want(entities: ["entity.browser"])
        @Expect(want.entities.size, 1)
        @Expect(want.entities[0], "entity.browser")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_entities_write_multiple(): Unit {
        // 测试流程: 创建Want实例，将entities属性设置为["entity.browser", "entity.video"]
        // 预期结果: 成功设置entities属性为包含两个元素的数组
        let want = Want(entities: ["entity.browser", "entity.video"])
        @Expect(want.entities.size, 2)
        @Expect(want.entities[0], "entity.browser")
        @Expect(want.entities[1], "entity.video")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_entities_filter_ability(): Unit {
        // 测试流程: 设置entities属性用于过滤匹配Ability类型
        // 预期结果: 在隐式Want中可以过滤匹配对应类别的Ability
        let want = Want(entities: ["entity.browser"])
        @Expect(want.entities.size, 1)
        @Expect(want.entities[0], "entity.browser")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_entities_with_action(): Unit {
        // 测试流程: 同时设置entities和action属性
        // 预期结果: entities作为action的补充，用于隐式Want匹配
        let want = Want(entities: ["entity.browser"], action: "ohos.want.action.viewData")
        @Expect(want.entities.size, 1)
        @Expect(want.action, "ohos.want.action.viewData")
    }

    // --- Want.dataType ---
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_dataType_read_empty(): Unit {
        // 测试流程: 创建Want实例使用默认参数，读取dataType属性
        // 预期结果: 返回空字符串""
        let want = Want()
        @Expect(want.dataType, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_dataType_write_text_xml(): Unit {
        // 测试流程: 创建Want实例，将dataType属性设置为"text/xml"
        // 预期结果: 成功设置dataType属性为"text/xml"
        let want = Want()
        want.dataType = "text/xml"
        @Expect(want.dataType, "text/xml")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_dataType_write_image_wildcard(): Unit {
        // 测试流程: 创建Want实例，将dataType属性设置为"image/*"
        // 预期结果: 成功设置dataType属性为"image/*"
        let want = Want()
        want.dataType = "image/*"
        @Expect(want.dataType, "image/*")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_dataType_file_open(): Unit {
        // 测试流程: 设置dataType属性用于文管打开文件
        // 预期结果: 正确指定打开文件的MIME类型
        let want = Want(dataType: "text/plain")
        @Expect(want.dataType, "text/plain")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_dataType_with_uri(): Unit {
        // 测试流程: 同时设置dataType和uri属性
        // 预期结果: 两个属性均正确设置
        let want = Want(dataType: "text/plain", uri: "file://test.txt")
        @Expect(want.dataType, "text/plain")
        @Expect(want.uri, "file://test.txt")
    }
}

@Test
class TestWantLltPart3 {
    // --- Want.parameters ---
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_parameters_read_empty(): Unit {
        // 测试流程: 创建Want实例使用默认参数，读取parameters属性
        // 预期结果: 返回空HashMap
        let want = Want()
        @Expect(want.parameters.size, 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_parameters_write_string(): Unit {
        // 测试流程: 创建Want实例，向parameters中添加StringValue类型的参数
        // 预期结果: 成功添加参数到parameters
        let want = Want()
        want.parameters.add("key1", WantValueType.StringValue("value1"))
        @Expect(want.parameters.size, 1)
        match (want.parameters.get("key1")) {
            case Some(WantValueType.StringValue(v)) => @Expect(v, "value1")
            case _ => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_parameters_write_int64(): Unit {
        // 测试流程: 创建Want实例，向parameters中添加Int64Value类型的参数
        // 预期结果: 成功添加Int64Value类型参数到parameters
        let want = Want()
        want.parameters.add("count", WantValueType.Int64Value(100i64))
        @Expect(want.parameters.size, 1)
        match (want.parameters.get("count")) {
            case Some(WantValueType.Int64Value(v)) => @Expect(v, 100i64)
            case _ => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_parameters_write_bool(): Unit {
        // 测试流程: 创建Want实例，向parameters中添加BoolValue类型的参数
        // 预期结果: 成功添加BoolValue类型参数到parameters
        let want = Want()
        want.parameters.add("flag", WantValueType.BoolValue(true))
        @Expect(want.parameters.size, 1)
        match (want.parameters.get("flag")) {
            case Some(WantValueType.BoolValue(v)) => @Expect(v, true)
            case _ => @Expect(0, 1)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_parameters_system_keys_auto_assigned(): Unit {
        // 测试流程: 尝试手动设置系统预置Key（如ohos.aafwk.param.callerPid）
        // 预期结果: 系统在数据传递时会自动修改为实际值
        let params = HashMap<String, WantValueType>()
        params.add("ohos.aafwk.param.callerPid", WantValueType.StringValue("0"))
        let want = Want(parameters: params)
        @Expect(want.parameters.size, 1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_parameters_multiple_types(): Unit {
        // 测试流程: 向parameters中添加多种类型的参数（String、Int64、Bool、Array）
        // 预期结果: 所有类型的参数均正确添加
        let params = HashMap<String, WantValueType>()
        params.add("str", WantValueType.StringValue("hello"))
        params.add("num", WantValueType.Int64Value(42i64))
        params.add("flag", WantValueType.BoolValue(true))
        let arr = [WantValueType.StringValue("a"), WantValueType.StringValue("b")]
        params.add("arr", WantValueType.ArrayValue(arr))
        let want = Want(parameters: params)
        @Expect(want.parameters.size, 4)
    }
}

@Test
class TestWantInitLltPart1 {
    // --- Want.init single param ---
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_deviceId_valid(): Unit {
        // 测试流程: 调用Want(deviceId: "device123")创建实例
        // 预期结果: 成功创建Want实例，deviceId为"device123"
        let want = Want(deviceId: "device123")
        @Expect(want.deviceId, "device123")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_deviceId_empty_current_device(): Unit {
        // 测试流程: 调用Want(deviceId: "")创建实例
        // 预期结果: 成功创建Want实例，deviceId为空字符串，表示当前设备
        let want = Want(deviceId: "")
        @Expect(want.deviceId, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_deviceId_empty(): Unit {
        // 测试流程: 调用Want(deviceId: "")创建实例
        // 预期结果: 成功创建Want实例，deviceId为空字符串
        let want = Want(deviceId: "")
        @Expect(want.deviceId, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_bundleName_valid(): Unit {
        // 测试流程: 调用Want(bundleName: "com.example.app")创建实例
        // 预期结果: 成功创建Want实例，bundleName为"com.example.app"
        let want = Want(bundleName: "com.example.app")
        @Expect(want.bundleName, "com.example.app")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_bundleName_not_exist(): Unit {
        // 测试流程: 调用Want(bundleName: "com.not.exist.app")创建实例
        // 预期结果: 成功创建Want实例，但在startAbility时可能因包名不存在而失败
        let want = Want(bundleName: "com.not.exist.app")
        @Expect(want.bundleName, "com.not.exist.app")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_bundleName_empty(): Unit {
        // 测试流程: 调用Want(bundleName: "")创建实例
        // 预期结果: 成功创建Want实例，bundleName为空字符串
        let want = Want(bundleName: "")
        @Expect(want.bundleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_abilityName_valid(): Unit {
        // 测试流程: 调用Want(abilityName: "MainAbility")创建实例
        // 预期结果: 成功创建Want实例，abilityName为"MainAbility"
        let want = Want(abilityName: "MainAbility")
        @Expect(want.abilityName, "MainAbility")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_abilityName_not_exist(): Unit {
        // 测试流程: 调用Want(abilityName: "NotExistAbility")创建实例
        // 预期结果: 成功创建Want实例，但在startAbility时可能因Ability名不存在而失败
        let want = Want(abilityName: "NotExistAbility")
        @Expect(want.abilityName, "NotExistAbility")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_abilityName_empty(): Unit {
        // 测试流程: 调用Want(abilityName: "")创建实例
        // 预期结果: 成功创建Want实例，abilityName为空字符串
        let want = Want(abilityName: "")
        @Expect(want.abilityName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_moduleName_valid(): Unit {
        // 测试流程: 调用Want(moduleName: "entry")创建实例
        // 预期结果: 成功创建Want实例，moduleName为"entry"
        let want = Want(moduleName: "entry")
        @Expect(want.moduleName, "entry")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_moduleName_empty(): Unit {
        // 测试流程: 调用Want(moduleName: "")创建实例
        // 预期结果: 成功创建Want实例，moduleName为空字符串
        let want = Want(moduleName: "")
        @Expect(want.moduleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_flags_zero(): Unit {
        // 测试流程: 调用Want(flags: 0)创建实例
        // 预期结果: 成功创建Want实例，flags为0
        let want = Want(flags: 0u32)
        @Expect(want.flags, 0u32)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_flags_read_permission(): Unit {
        // 测试流程: 调用Want(flags: 0x00000001)创建实例
        // 预期结果: 成功创建Want实例，flags为0x00000001（FLAG_AUTH_READ_URI_PERMISSION）
        let want = Want(flags: 0x00000001u32)
        @Expect(want.flags, Flags.FLAG_AUTH_READ_URI_PERMISSION)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_flags_write_permission(): Unit {
        // 测试流程: 调用Want(flags: 0x00000002)创建实例
        // 预期结果: 成功创建Want实例，flags为0x00000002（FLAG_AUTH_WRITE_URI_PERMISSION）
        let want = Want(flags: 0x00000002u32)
        @Expect(want.flags, Flags.FLAG_AUTH_WRITE_URI_PERMISSION)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_flags_persistable_permission(): Unit {
        // 测试流程: 调用Want(flags: 0x00000040)创建实例
        // 预期结果: 成功创建Want实例，flags为0x00000040（FLAG_AUTH_PERSISTABLE_URI_PERMISSION）
        let want = Want(flags: 0x00000040u32)
        @Expect(want.flags, Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_flags_install_on_demand(): Unit {
        // 测试流程: 调用Want(flags: 0x00000800)创建实例
        // 预期结果: 成功创建Want实例，flags为0x00000800（FLAG_INSTALL_ON_DEMAND）
        let want = Want(flags: 0x00000800u32)
        @Expect(want.flags, Flags.FLAG_INSTALL_ON_DEMAND)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_flags_start_without_tips(): Unit {
        // 测试流程: 调用Want(flags: 0x40000000)创建实例
        // 预期结果: 成功创建Want实例，flags为0x40000000（FLAG_START_WITHOUT_TIPS）
        let want = Want(flags: 0x40000000u32)
        @Expect(want.flags, Flags.FLAG_START_WITHOUT_TIPS)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_flags_combined(): Unit {
        // 测试流程: 调用Want(flags: 0x00000003)创建实例（读写权限组合）
        // 预期结果: 成功创建Want实例，flags为0x00000003
        let want = Want(flags: 0x00000003u32)
        @Expect(want.flags, 0x00000003u32)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_flags_boundary_zero(): Unit {
        // 测试流程: 调用Want(flags: 0)创建实例
        // 预期结果: 成功创建Want实例，flags为0
        let want = Want(flags: 0u32)
        @Expect(want.flags, 0u32)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_flags_boundary_max(): Unit {
        // 测试流程: 调用Want(flags: 0xFFFFFFFF)创建实例
        // 预期结果: 成功创建Want实例，flags为0xFFFFFFFF
        let want = Want(flags: 0xFFFFFFFFu32)
        @Expect(want.flags, 0xFFFFFFFFu32)
    }
}

@Test
class TestWantInitLltPart2 {
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_uri_valid_file(): Unit {
        // 测试流程: 调用Want(uri: "file://data/storage/test.txt")创建实例
        // 预期结果: 成功创建Want实例，uri为"file://data/storage/test.txt"
        let want = Want(uri: "file://data/storage/test.txt")
        @Expect(want.uri, "file://data/storage/test.txt")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_uri_valid_http(): Unit {
        // 测试流程: 调用Want(uri: "https://example.com/path")创建实例
        // 预期结果: 成功创建Want实例，uri为"https://example.com/path"
        let want = Want(uri: "https://example.com/path")
        @Expect(want.uri, "https://example.com/path")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_uri_empty(): Unit {
        // 测试流程: 调用Want(uri: "")创建实例
        // 预期结果: 成功创建Want实例，uri为空字符串
        let want = Want(uri: "")
        @Expect(want.uri, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_action_valid_view(): Unit {
        // 测试流程: 调用Want(action: "ohos.want.action.viewData")创建实例
        // 预期结果: 成功创建Want实例，action为"ohos.want.action.viewData"
        let want = Want(action: "ohos.want.action.viewData")
        @Expect(want.action, "ohos.want.action.viewData")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_action_valid_share(): Unit {
        // 测试流程: 调用Want(action: "ohos.want.action.sendData")创建实例
        // 预期结果: 成功创建Want实例，action为"ohos.want.action.sendData"
        let want = Want(action: "ohos.want.action.sendData")
        @Expect(want.action, "ohos.want.action.sendData")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_action_empty(): Unit {
        // 测试流程: 调用Want(action: "")创建实例
        // 预期结果: 成功创建Want实例，action为空字符串
        let want = Want(action: "")
        @Expect(want.action, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_entities_single(): Unit {
        // 测试流程: 调用Want(entities: ["entity.browser"])创建实例
        // 预期结果: 成功创建Want实例，entities包含一个元素"entity.browser"
        let want = Want(entities: ["entity.browser"])
        @Expect(want.entities.size, 1)
        @Expect(want.entities[0], "entity.browser")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_entities_multiple(): Unit {
        // 测试流程: 调用Want(entities: ["entity.browser", "entity.video"])创建实例
        // 预期结果: 成功创建Want实例，entities包含两个元素
        let want = Want(entities: ["entity.browser", "entity.video"])
        @Expect(want.entities.size, 2)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_entities_empty(): Unit {
        // 测试流程: 调用Want(entities: [])创建实例
        // 预期结果: 成功创建Want实例，entities为空数组
        let want = Want(entities: [])
        @Expect(want.entities.size, 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_dataType_text_xml(): Unit {
        // 测试流程: 调用Want(dataType: "text/xml")创建实例
        // 预期结果: 成功创建Want实例，dataType为"text/xml"
        let want = Want(dataType: "text/xml")
        @Expect(want.dataType, "text/xml")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_dataType_image_wildcard(): Unit {
        // 测试流程: 调用Want(dataType: "image/*")创建实例
        // 预期结果: 成功创建Want实例，dataType为"image/*"
        let want = Want(dataType: "image/*")
        @Expect(want.dataType, "image/*")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_dataType_text_plain(): Unit {
        // 测试流程: 调用Want(dataType: "text/plain")创建实例
        // 预期结果: 成功创建Want实例，dataType为"text/plain"
        let want = Want(dataType: "text/plain")
        @Expect(want.dataType, "text/plain")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_dataType_empty(): Unit {
        // 测试流程: 调用Want(dataType: "")创建实例
        // 预期结果: 成功创建Want实例，dataType为空字符串
        let want = Want(dataType: "")
        @Expect(want.dataType, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_parameters_string_value(): Unit {
        // 测试流程: 创建包含StringValue的HashMap，调用Want(parameters: map)创建实例
        // 预期结果: 成功创建Want实例，parameters包含StringValue类型参数
        let params = HashMap<String, WantValueType>()
        params.add("key", WantValueType.StringValue("value"))
        let want = Want(parameters: params)
        @Expect(want.parameters.size, 1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_parameters_int64_value(): Unit {
        // 测试流程: 创建包含Int64Value的HashMap，调用Want(parameters: map)创建实例
        // 预期结果: 成功创建Want实例，parameters包含Int64Value类型参数
        let params = HashMap<String, WantValueType>()
        params.add("num", WantValueType.Int64Value(123i64))
        let want = Want(parameters: params)
        @Expect(want.parameters.size, 1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_parameters_bool_value(): Unit {
        // 测试流程: 创建包含BoolValue的HashMap，调用Want(parameters: map)创建实例
        // 预期结果: 成功创建Want实例，parameters包含BoolValue类型参数
        let params = HashMap<String, WantValueType>()
        params.add("flag", WantValueType.BoolValue(false))
        let want = Want(parameters: params)
        @Expect(want.parameters.size, 1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_parameters_float64_value(): Unit {
        // 测试流程: 创建包含Float64Value的HashMap，调用Want(parameters: map)创建实例
        // 预期结果: 成功创建Want实例，parameters包含Float64Value类型参数
        let params = HashMap<String, WantValueType>()
        params.add("ratio", WantValueType.Float64Value(3.14))
        let want = Want(parameters: params)
        @Expect(want.parameters.size, 1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_parameters_array_value(): Unit {
        // 测试流程: 创建包含ArrayValue的HashMap，调用Want(parameters: map)创建实例
        // 预期结果: 成功创建Want实例，parameters包含ArrayValue类型参数
        let params = HashMap<String, WantValueType>()
        let arr = [WantValueType.StringValue("a")]
        params.add("arr", WantValueType.ArrayValue(arr))
        let want = Want(parameters: params)
        @Expect(want.parameters.size, 1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_parameters_hashmap_value(): Unit {
        // 测试流程: 创建包含HashMapValue的HashMap，调用Want(parameters: map)创建实例
        // 预期结果: 成功创建Want实例，parameters包含HashMapValue类型参数
        let innerMap = HashMap<String, WantValueType>()
        innerMap.add("k", WantValueType.StringValue("v"))
        let params = HashMap<String, WantValueType>()
        params.add("nested", WantValueType.HashMapValue(innerMap))
        let want = Want(parameters: params)
        @Expect(want.parameters.size, 1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_parameters_empty(): Unit {
        // 测试流程: 调用Want(parameters: HashMap<String, WantValueType>())创建实例
        // 预期结果: 成功创建Want实例，parameters为空HashMap
        let want = Want(parameters: HashMap<String, WantValueType>())
        @Expect(want.parameters.size, 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_fds_empty(): Unit {
        // 测试流程: 调用Want(fds: HashMap<String, Int32>())创建实例
        // 预期结果: 成功创建Want实例
        let want = Want(fds: HashMap<String, Int32>())
        @Expect(want.deviceId, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_fds_non_empty(): Unit {
        // 测试流程: 创建非空HashMap<String, Int32>，调用Want(fds: nonEmptyMap)创建实例
        // 预期结果: 抛出BusinessException，错误码16000050，错误信息"Internal error."
        let fdsMap = HashMap<String, Int32>()
        fdsMap.add("fd1", 1)
        try {
            let _ = Want(fds: fdsMap)
            @Expect(0, 1)
        } catch (e: BusinessException) {
            @Expect(e.code, 16000050)
            @Expect(e.message, "Internal error.")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_fds_non_empty_throws_exception(): Unit {
        // 测试流程: 传入非空的fds参数调用Want构造函数
        // 预期结果: 抛出BusinessException，错误码16000050，错误信息"Internal error."
        let fdsMap = HashMap<String, Int32>()
        fdsMap.add("key", 0)
        try {
            let _ = Want(fds: fdsMap)
            @Expect(0, 1)
        } catch (e: BusinessException) {
            @Expect(e.code, 16000050)
        }
    }
}

@Test
class TestWantInitLltPart3 {
    // --- Want.init pairwise ---
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_deviceId_bundleName(): Unit {
        // 测试流程: 调用Want(deviceId: "device123", bundleName: "com.example.app")创建实例
        // 预期结果: 成功创建Want实例，deviceId为"device123"，bundleName为"com.example.app"
        let want = Want(deviceId: "device123", bundleName: "com.example.app")
        @Expect(want.deviceId, "device123")
        @Expect(want.bundleName, "com.example.app")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_deviceId_empty_bundleName_valid(): Unit {
        // 测试流程: 调用Want(deviceId: "", bundleName: "com.example.app")创建实例
        // 预期结果: 成功创建Want实例，deviceId为空字符串（当前设备），bundleName为"com.example.app"
        let want = Want(deviceId: "", bundleName: "com.example.app")
        @Expect(want.deviceId, "")
        @Expect(want.bundleName, "com.example.app")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_bundleName_abilityName(): Unit {
        // 测试流程: 调用Want(bundleName: "com.example.app", abilityName: "MainAbility")创建实例
        // 预期结果: 成功创建Want实例，bundleName和abilityName均正确设置，构成显式Want
        let want = Want(bundleName: "com.example.app", abilityName: "MainAbility")
        @Expect(want.bundleName, "com.example.app")
        @Expect(want.abilityName, "MainAbility")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_bundleName_abilityName_moduleName(): Unit {
        // 测试流程: 调用Want(bundleName: "com.example.app", abilityName: "MainAbility", moduleName: "entry")创建实例
        // 预期结果: 成功创建Want实例，bundleName、abilityName和moduleName均正确设置
        let want = Want(bundleName: "com.example.app", abilityName: "MainAbility", moduleName: "entry")
        @Expect(want.bundleName, "com.example.app")
        @Expect(want.abilityName, "MainAbility")
        @Expect(want.moduleName, "entry")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_bundleName_empty_abilityName_valid(): Unit {
        // 测试流程: 调用Want(bundleName: "", abilityName: "MainAbility")创建实例
        // 预期结果: 成功创建Want实例，bundleName为空，abilityName为"MainAbility"
        let want = Want(bundleName: "", abilityName: "MainAbility")
        @Expect(want.bundleName, "")
        @Expect(want.abilityName, "MainAbility")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_flags_uri(): Unit {
        // 测试流程: 调用Want(flags: 0x00000001, uri: "file://test.txt")创建实例
        // 预期结果: 成功创建Want实例，flags为FLAG_AUTH_READ_URI_PERMISSION，uri为"file://test.txt"
        let want = Want(flags: 0x00000001u32, uri: "file://test.txt")
        @Expect(want.flags, Flags.FLAG_AUTH_READ_URI_PERMISSION)
        @Expect(want.uri, "file://test.txt")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_flags_write_uri(): Unit {
        // 测试流程: 调用Want(flags: 0x00000002, uri: "file://test.txt")创建实例
        // 预期结果: 成功创建Want实例，flags为FLAG_AUTH_WRITE_URI_PERMISSION，uri为"file://test.txt"
        let want = Want(flags: 0x00000002u32, uri: "file://test.txt")
        @Expect(want.flags, Flags.FLAG_AUTH_WRITE_URI_PERMISSION)
        @Expect(want.uri, "file://test.txt")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_flags_combined_uri(): Unit {
        // 测试流程: 调用Want(flags: 0x00000003, uri: "file://test.txt")创建实例
        // 预期结果: 成功创建Want实例，flags为读写权限组合，uri为"file://test.txt"
        let want = Want(flags: 0x00000003u32, uri: "file://test.txt")
        @Expect(want.flags, 0x00000003u32)
        @Expect(want.uri, "file://test.txt")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_uri_dataType(): Unit {
        // 测试流程: 调用Want(uri: "file://test.txt", dataType: "text/plain")创建实例
        // 预期结果: 成功创建Want实例，uri和dataType均正确设置
        let want = Want(uri: "file://test.txt", dataType: "text/plain")
        @Expect(want.uri, "file://test.txt")
        @Expect(want.dataType, "text/plain")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_uri_empty_dataType_valid(): Unit {
        // 测试流程: 调用Want(uri: "", dataType: "text/plain")创建实例
        // 预期结果: 成功创建Want实例，uri为空，dataType为"text/plain"
        let want = Want(uri: "", dataType: "text/plain")
        @Expect(want.uri, "")
        @Expect(want.dataType, "text/plain")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_action_entities(): Unit {
        // 测试流程: 调用Want(action: "ohos.want.action.viewData", entities: ["entity.browser"])创建实例
        // 预期结果: 成功创建Want实例，action和entities均正确设置，用于隐式Want
        let want = Want(action: "ohos.want.action.viewData", entities: ["entity.browser"])
        @Expect(want.action, "ohos.want.action.viewData")
        @Expect(want.entities.size, 1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_action_entities_multiple(): Unit {
        // 测试流程: 调用Want(action: "ohos.want.action.viewData", entities: ["entity.browser", "entity.video"])创建实例
        // 预期结果: 成功创建Want实例，action和多个entities均正确设置
        let want = Want(action: "ohos.want.action.viewData", entities: ["entity.browser", "entity.video"])
        @Expect(want.action, "ohos.want.action.viewData")
        @Expect(want.entities.size, 2)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_action_empty_entities_valid(): Unit {
        // 测试流程: 调用Want(action: "", entities: ["entity.browser"])创建实例
        // 预期结果: 成功创建Want实例，action为空，entities包含"entity.browser"
        let want = Want(action: "", entities: ["entity.browser"])
        @Expect(want.action, "")
        @Expect(want.entities.size, 1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_action_uri(): Unit {
        // 测试流程: 调用Want(action: "ohos.want.action.viewData", uri: "https://example.com")创建实例
        // 预期结果: 成功创建Want实例，action和uri均正确设置
        let want = Want(action: "ohos.want.action.viewData", uri: "https://example.com")
        @Expect(want.action, "ohos.want.action.viewData")
        @Expect(want.uri, "https://example.com")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_action_parameters(): Unit {
        // 测试流程: 调用Want(action: "ohos.want.action.viewData", parameters: map)创建实例，map包含StringValue
        // 预期结果: 成功创建Want实例，action和parameters均正确设置
        let params = HashMap<String, WantValueType>()
        params.add("key", WantValueType.StringValue("value"))
        let want = Want(action: "ohos.want.action.viewData", parameters: params)
        @Expect(want.action, "ohos.want.action.viewData")
        @Expect(want.parameters.size, 1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_parameters_string_int64(): Unit {
        // 测试流程: 创建包含StringValue和Int64Value的HashMap，调用Want(parameters: map)创建实例
        // 预期结果: 成功创建Want实例，parameters包含多种类型参数
        let params = HashMap<String, WantValueType>()
        params.add("str", WantValueType.StringValue("hello"))
        params.add("num", WantValueType.Int64Value(100i64))
        let want = Want(parameters: params)
        @Expect(want.parameters.size, 2)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_parameters_bool_float64(): Unit {
        // 测试流程: 创建包含BoolValue和Float64Value的HashMap，调用Want(parameters: map)创建实例
        // 预期结果: 成功创建Want实例，parameters包含BoolValue和Float64Value
        let params = HashMap<String, WantValueType>()
        params.add("flag", WantValueType.BoolValue(true))
        params.add("ratio", WantValueType.Float64Value(2.5))
        let want = Want(parameters: params)
        @Expect(want.parameters.size, 2)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_parameters_array_hashmap(): Unit {
        // 测试流程: 创建包含ArrayValue和HashMapValue的HashMap，调用Want(parameters: map)创建实例
        // 预期结果: 成功创建Want实例，parameters包含ArrayValue和HashMapValue
        let params = HashMap<String, WantValueType>()
        params.add("arr", WantValueType.ArrayValue([WantValueType.StringValue("x")]))
        let innerMap = HashMap<String, WantValueType>()
        innerMap.add("k", WantValueType.StringValue("v"))
        params.add("map", WantValueType.HashMapValue(innerMap))
        let want = Want(parameters: params)
        @Expect(want.parameters.size, 2)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_moduleName_abilityName(): Unit {
        // 测试流程: 调用Want(moduleName: "entry", abilityName: "MainAbility")创建实例
        // 预期结果: 成功创建Want实例，moduleName和abilityName均正确设置
        let want = Want(moduleName: "entry", abilityName: "MainAbility")
        @Expect(want.moduleName, "entry")
        @Expect(want.abilityName, "MainAbility")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_deviceId_flags(): Unit {
        // 测试流程: 调用Want(deviceId: "device123", flags: 0x00000800)创建实例
        // 预期结果: 成功创建Want实例，deviceId和flags均正确设置
        let want = Want(deviceId: "device123", flags: 0x00000800u32)
        @Expect(want.deviceId, "device123")
        @Expect(want.flags, Flags.FLAG_INSTALL_ON_DEMAND)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_dataType_action(): Unit {
        // 测试流程: 调用Want(dataType: "image/*", action: "ohos.want.action.viewData")创建实例
        // 预期结果: 成功创建Want实例，dataType和action均正确设置
        let want = Want(dataType: "image/*", action: "ohos.want.action.viewData")
        @Expect(want.dataType, "image/*")
        @Expect(want.action, "ohos.want.action.viewData")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_fds_empty_parameters_valid(): Unit {
        // 测试流程: 调用Want(fds: HashMap<String, Int32>(), parameters: map)创建实例，map包含StringValue
        // 预期结果: 成功创建Want实例，fds为空，parameters正确设置
        let params = HashMap<String, WantValueType>()
        params.add("key", WantValueType.StringValue("value"))
        let want = Want(fds: HashMap<String, Int32>(), parameters: params)
        @Expect(want.parameters.size, 1)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_explicit_want_full(): Unit {
        // 测试流程: 调用Want(deviceId: "", bundleName: "com.example.app", abilityName: "MainAbility", moduleName: "entry")创建实例
        // 预期结果: 成功创建完整的显式Want实例
        let want = Want(deviceId: "", bundleName: "com.example.app", abilityName: "MainAbility", moduleName: "entry")
        @Expect(want.deviceId, "")
        @Expect(want.bundleName, "com.example.app")
        @Expect(want.abilityName, "MainAbility")
        @Expect(want.moduleName, "entry")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_implicit_want_full(): Unit {
        // 测试流程: 调用Want(action: "ohos.want.action.viewData", entities: ["entity.browser"], uri: "https://example.com", dataType: "text/html")创建实例
        // 预期结果: 成功创建完整的隐式Want实例
        let want = Want(action: "ohos.want.action.viewData", entities: ["entity.browser"], uri: "https://example.com", dataType: "text/html")
        @Expect(want.action, "ohos.want.action.viewData")
        @Expect(want.entities.size, 1)
        @Expect(want.uri, "https://example.com")
        @Expect(want.dataType, "text/html")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_return_Want_instance(): Unit {
        // 测试流程: 调用Want()构造函数
        // 预期结果: 返回Want类型的实例
        let want = Want()
        @Expect(want.deviceId, "")
        @Expect(want.bundleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_default_values(): Unit {
        // 测试流程: 调用Want()使用所有默认参数创建实例
        // 预期结果: 所有属性均为默认值
        let want = Want()
        @Expect(want.deviceId, "")
        @Expect(want.bundleName, "")
        @Expect(want.abilityName, "")
        @Expect(want.moduleName, "")
        @Expect(want.flags, 0u32)
        @Expect(want.uri, "")
        @Expect(want.action, "")
        @Expect(want.entities.size, 0)
        @Expect(want.dataType, "")
        @Expect(want.parameters.size, 0)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_explicit_want(): Unit {
        // 测试流程: 同时传入bundleName和abilityName创建显式Want
        // 预期结果: 创建的Want可以直接匹配到指定的Ability
        let want = Want(bundleName: "com.example.app", abilityName: "MainAbility")
        @Expect(want.bundleName, "com.example.app")
        @Expect(want.abilityName, "MainAbility")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_implicit_want(): Unit {
        // 测试流程: 传入action和entities创建隐式Want，不传bundleName和abilityName
        // 预期结果: 创建的Want用于隐式匹配
        let want = Want(action: "ohos.want.action.viewData", entities: ["entity.browser"])
        @Expect(want.action, "ohos.want.action.viewData")
        @Expect(want.entities.size, 1)
        @Expect(want.bundleName, "")
        @Expect(want.abilityName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_use_in_startAbility(): Unit {
        // 测试流程: 创建Want实例作为startAbility的参数使用
        // 预期结果: startAbility正常执行（单元测试中仅验证Want可正确创建）
        let want = Want(bundleName: "com.example.app", abilityName: "MainAbility")
        @Expect(want.bundleName, "com.example.app")
        @Expect(want.abilityName, "MainAbility")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_all_parameters(): Unit {
        // 测试流程: 传入所有参数（除fds外）创建Want实例
        // 预期结果: 所有参数均正确设置到Want实例中
        let params = HashMap<String, WantValueType>()
        params.add("key", WantValueType.StringValue("val"))
        let want = Want(
            deviceId: "dev1",
            bundleName: "com.example.app",
            abilityName: "MainAbility",
            moduleName: "entry",
            flags: 0x00000001u32,
            uri: "file://test",
            action: "ohos.want.action.viewData",
            entities: ["entity.browser"],
            dataType: "text/plain",
            parameters: params
        )
        @Expect(want.deviceId, "dev1")
        @Expect(want.bundleName, "com.example.app")
        @Expect(want.abilityName, "MainAbility")
        @Expect(want.moduleName, "entry")
        @Expect(want.flags, 0x00000001u32)
        @Expect(want.uri, "file://test")
        @Expect(want.action, "ohos.want.action.viewData")
        @Expect(want.entities.size, 1)
        @Expect(want.dataType, "text/plain")
        @Expect(want.parameters.size, 1)
    }
}
