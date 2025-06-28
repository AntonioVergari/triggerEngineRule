# Salesforce Trigger Engine Rule with Chain of Responsibility

This Salesforce project implements an Apex trigger following the **Engine Rule** and **Chain of Responsibility** design patterns, providing a modular, scalable, and easily extendible structure for business logic management.

## Key Features

- ✅ **Engine Rule Pattern**: Enables definition of modular, reusable rules for event handling.
- 🔗 **Chain of Responsibility**: Each rule is encapsulated in a separate class and executed sequentially until a condition is met or the chain ends.
- 🔒 **Trigger Blocking**: The trigger features a dual blocking mechanism:
    - **Runtime**: Block trigger execution using an Apex class
    - **Configuration**: Add a Custom Metadata record with the trigger name (always takes priority over runtime settings)

## Project Structure

The project is organized into two packages:

- **force-app**: Contains all metadata and classes implementing the core functionality.
- **examples**: Contains sample implementation with rules.

## How It Works

1. Create a trigger and call triggerFactory
```java
trigger AccountTrigger on Account (before insert) {
    triggerFactory.getHandler(Account.getSobjectType());
}
```

2. Define a handler for the object implementing ITrigger interface. For Account, the handler must be named AccountHandler
```java
public with sharing AccountHandler implements ITrigger {
    // implements all methods defined in ITrigger interface
}
```
3. Define a Business Rule. Must extend **AbstractBusinessRule** or a child class, define constructor with required data, and implement **shouldExecute** and **execute** methods
```java
public with sharing BR_NewRule extends AbstractBusinessRule {
    private Account newAccount;
    public BR_NewRule(Account newAccount) {
        this.newAccount = newAccount;
        // add next action if current shouldn't execute
        //this.nextAction = new BR_NextAction(params); 
    }

    public override Boolean shouldExecute() {
        return newAccount.Status__c == 'new';
    }

    public override void execute() {
        newAccount.Is_Active__c = true;
        // add more operations or call another BR
        //new Br_anotherRule(params).process()
    }
}
```
4. Add the rule in the relevant handler method
```java
public List<IBusinessRule> beforeInsert(SObject so) {
    Account newAccount = (Account) so;
    List<IBusinessRule> rules = new List<IBusinessRule>();
    rule.add(new BR_MyRule(newAccount));

    return rule;
}
```

## Benefits

- 🔄 Maintainability: Each rule is isolated and easily testable. Avoids complex methods with multiple nested conditionals.

- 📈 Scalability: Add, remove, or reorder rules without modifying triggers.

- 🛠️ Configurability: Enable/disable triggers in production via Custom Metadata.

## Deployment

Three deployment modes:

- **npm run deploy**: Deploys only force-app content

- **npm run deploy-examples**: Deploys examples (fails if force-app isn't deployed)

- **npm run all**: Deploys both project folders

## TODOS
- add support for flow actions using BR
- add metadata to defining action on trigger
- add examples of BR usage outside of triggers

## License

Distributed under Apache License 2.0