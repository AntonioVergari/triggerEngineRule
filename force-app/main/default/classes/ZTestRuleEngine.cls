@isTest
public with sharing class ZTestRuleEngine {

    @IsTest
    public static void emptyList(){
        
        Test.startTest();
        Boolean exceptionOccurred = false;
        try {
            RuleEngine.applyRules(new List<IBusinessRule>());
        } catch (Exception e) {
            exceptionOccurred = true;
        }
        Test.stopTest();
        Assert.areNotEqual(exceptionOccurred, true, 'An Exception occurred');
    }

    @IsTest
    public static void BRList(){
        
        Test.startTest();
        Boolean exceptionOccurred = false;
        Account newAccount = new Account(
            name = 'no_BR_Applied'
        );
        try {
            List<IBusinessRule> rules = new List<IBusinessRule>();
            rules.add(new BR_Test(newAccount));
            RuleEngine.applyRules(rules);
        } catch (Exception e) {
            exceptionOccurred = true;
        }
        Test.stopTest();
        Assert.areNotEqual(exceptionOccurred, true, 'An Exception occurred');
        Assert.areEqual(newAccount.name, 'BR_applied', 'Business Rules is not applied');
    }



    private class BR_Test extends AbstractBusinessRule {
        private Account newAccount;
        public BR_Test(Account newAccount) {

        super();
        this.newAccount = newAccount;
        }

        public override void execute() {
            newAccount.name = 'BR_applied';
        }
    }

        
    
}