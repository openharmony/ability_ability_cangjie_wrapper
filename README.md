# ability_cangjie_wrapper

## Overview

The ability_cangjie_wrapper is a Cangjie API encapsulated on OpenHarmony based on the capabilities of the Ability subsystem. The **ability framework** (also called the ability management framework) is used to centrally schedule and manage the running and lifecycle of abilities. An application process can support multiple abilities, and an ability can be called either within a process or across processes. The Ability Manager Service provided in the framework schedules and manages abilities in an application and manages the lifecycle changes of these abilities. The currently open Ability Cangjie api only supports standard devices.

## System Architecture

**Figure 1** System architecture of ability_cangjie_wrapper

![System architecture of ability_cangjie_wrapper](figures/ability_cangjie_wrapper_architecture_en.png)

As shown in the architecture:

- UIAbility: UIAbility is an application component that has the UI. It provides lifecycle callbacks such as component creation, destruction, and foreground/background switching. Users can inherit this class to implement monitoring capabilities for UIAbility components.
- Context: The Context provides the capabilities to obtain component information. The UIAbilityContext provides the capabilities to launch or destroy other UIAbility. Users can obtain relevant information or launch other UIAbility through UIAbilityContext.
- AbilityStage: AbilityStage is a component container at the module level. When the HAP or HSP of an application is loaded for the first time, an AbilityStage instance is created. You can use the instance to perform initialization operations such as resource preloading and thread creation at the module level.
- ErrorManager: The ErrorManager Module provides the capabilities to register and unregister error observers. When users need to register or unregister an error observer, they can use the interfaces provided by this module.
- AbilityDelegatorRegistry: Users can monitor lifecycle state changes of a specified Ability and obtain test parameters through the AbilityDelegatorRegistry Module.
- Cangjie Ability FFI interface: Based on cross-language interoperability via C interfaces to implement ability Cangjie API.
- ability_runtime: It is responsible for providing basic functions of ability, and encapsulates C interfaces to provide interoperability for Cangjie.

## Directory Structure

```
foundation/ability/ability_cangjie_wrapper                
├── figures                   # architecture pictures
├── kit                       # Cangjie AbilityKit kit code
│   └── AbilityKit
├── ohos                      # Cangjie Ability code  
│   ├── BUILD.gn
│   ├── ability
│   ├── app
│   └── application
└── test                      # Cangjie test code
```


## Usage Guidelines

The following features are provided:

  - UIAbility is an application component that has the UI. It provides lifecycle callbacks such as component creation, destruction, and foreground/background switching.
  - The Context provides the capabilities to obtain component information. The UIAbilityContext provides the capabilities to launch or destroy other UIAbility.
  - AbilityStage is a component container at the module level. You can use the instance to perform initialization operations such as resource preloading and thread creation at the module level.
  - The ErrorManager Module provides the capabilities to register and unregister error observers.
  - AbilityDelegatorRegistry Module can be used to monitor lifecycle state changes of a specified Ability and obtain test parameters through.
  - Test cases can be run through the TestRunner Module.


The following features are not provided yet:

 - ExtensionAbility which for scenario-specific ExtensionAbilities.
 - InsightIntent Module.
 - Startup Module.

For Ability-related APIs, please refer to [ohos.app.ability (Ability)](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md). For relevant guidance, please refer to [Ability Kit Guide](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/tree/master/doc/Dev_Guide/source_en/application-models).

## Code Contribution

Developers are welcome to contribute code, documentation, etc. For specific contribution processes and methods, please refer to [Code Contribution](https://gitcode.com/openharmony/docs/blob/master/en/contribute/code-contribution.md).

## Repositories Involved

[ability_ability_runtime](https://gitee.com/openharmony/ability_ability_runtime)

[security_access_token](https://gitee.com/openharmony/security_access_token)

[arkcompiler_cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop)

[global_global_cangjie_wrapper](https://gitcode.com/openharmony-sig/global_global_cangjie_wrapper)

[arkui_arkui_cangjie_wrapper](https://gitcode.com/openharmony-sig/arkui_arkui_cangjie_wrapper)

[hiviewdfx_hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper)

[bundlemanager_bundlemanager_cangjie_wrapper](https://gitcode.com/openharmony-sig/bundlemanager_bundlemanager_cangjie_wrapper)

[communication_communication_cangjie_wrapper](https://gitcode.com/openharmony-sig/communication_communication_cangjie_wrapper)

[multimedia_multimedia_cangjie_wrapper](https://gitcode.com/openharmony-sig/multimedia_multimedia_cangjie_wrapper)

[window_window_cangjie_wrapper](https://gitcode.com/openharmony-sig/window_window_cangjie_wrapper)
