# 元能力仓颉接口

## 简介

**元能力仓颉接口**元能力仓颉接口是在 OpenHarmony 上基于元能力子系统能力之上封装的仓颉API。而元能力子系统实现对Ability的运行及生命周期进行统一的调度和管理，应用进程能够支撑多个Ability，Ability具有跨应用进程间和同一进程内调用的能力。Ability管理服务统一调度和管理应用中各Ability，并对Ability的生命周期变更进行管理。

![](figures/ability_cangjie_wrapper_architecture_zh.png)

## 目录

```
foundation/ability/ability_cangjie_wrapper
├── ohos                       # 仓颉元能力接口层实现
├── kit                        # 仓颉kit化代码
├── figures                    # 存放readme中的架构图
```

## 约束

当前开放的元能力仓颉接口仅支持standard设备。

## 使用说明

如架构图所示，元能力仓颉接口提供了以下功能接口，开发者可以根据使用诉求，综合使用一类或多类接口：

  - UIAbility是包含UI界面的应用组件，提供UIAbility组件创建、销毁、前后台切换等生命周期回调的能力。用户可通过继承此类来实现对UIAbility组件的监控能力。
  - 应用上下文提供了获取组件信息的能力。UIAbility组件的上下文提供了拉起其他UIAbility、销毁UIAbility的能力。用户可通过UIAbilityContext获取相关信息或拉起其他UIAbility。
  - 错误观测管理模块提供了对错误观察器的注册和注销能力。当用户需要注册或注销错误观察器时，可以使用其提供的接口。
  - 用户可通过自动化测试框架使用指南模块来监视指定的Ability的生命周期状态更改和获取测试参数。
  - 用户可通过框架测试模块准备单元测试环境、运行测试用例。

与ArkTS相比，暂不支持以下功能：

  - 支持特定场景拓展能力的ExtensionAbility。
  - 对接端侧意图框架的意图执行基类。
  - 启动任务的相关能力。

## 相关仓

**元能力子系统**

[ability_ability_runtime](https://gitee.com/openharmony/ability_ability_runtime)
