# ability_ability_cangjie_wrapper

## Overview

The ability_ability_cangjie_wrapper is a Cangjie API encapsulated on OpenHarmony based on the capabilities of the Ability subsystem. The **ability framework** (also called the ability management framework) is used to centrally schedule and manage the running and lifecycle of abilities. An application process can support multiple abilities, and an ability can be called either within a process or across processes. The Ability Manager Service provided in the framework schedules and manages abilities in an application and manages the lifecycle changes of these abilities.

![](figures/ability_cangjie_wrapper_architecture_en.png)

## Directory Structure

```
foundation/ability/ability_cangjie_wrapper
├── ohos             # Cangjie Ability code
├── kit              # Cangjie kit code
├── figures          # architecture pictures
```

## Constraints

The currently open Ability Cangjie api only supports standard devices.

## Usage Guidelines

The following features are provided:

  - UIAbility is an application component that has the UI. It provides lifecycle callbacks such as component creation, destruction, and foreground/background switching. Users can inherit this class to implement monitoring capabilities for UIAbility components.
  - The Context provides the capabilities to obtain component information. The UIAbilityContext provides the capabilities to launch or destroy other UIAbility. Users can obtain relevant information or launch other UIAbility through UIAbilityContext.
  - The ErrorManager Module provides the capabilities to register and unregister error observers. When users need to register or unregister an error observer, they can use the interfaces provided by this module.
  - Users can monitor lifecycle state changes of a specified Ability and obtain test parameters through the AbilityDelegatorRegistry Module.
  - Users can prepare the unit testing environment and run test cases through the TestRunner Module.

The following features are not provided yet:

 - ExtensionAbility which for scenario-specific ExtensionAbilities.
 - InsightIntent Module.
 - Startup Module.

## Repositories Involved

[ability_runtime](https://gitee.com/openharmony/ability_ability_runtime)
