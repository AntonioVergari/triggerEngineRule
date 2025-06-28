@isTest
public with sharing class ZTestBR_InactiveAccount {

    @isTest
    public static void testValidExecute() {
        Account validAccount = new Account(
            Is_Active__c = false
        );
        Account oldAccount = new Account(
            Is_Active__c = true
        );
        Test.startTest();
        BR_InactiveAccount testRule = new BR_InactiveAccount(validAccount, oldAccount);
        testRule.process();
        Test.stopTest();

        Assert.areEqual('Inactive', validAccount.Status__c, 'Account should have inactive status');
    }

    @isTest
    public static void testInvalidExecute() {
        Account validAccount = new Account(
            Is_Active__c = false
        );
        Account oldAccount = new Account(
            Is_Active__c = true
        );
        Test.startTest();
        BR_InactiveAccount testRule = new BR_InactiveAccount(validAccount, oldAccount);
        testRule.process();
        Test.stopTest();

        Assert.areEqual('Inactive', validAccount.Status__c, 'Account should have inactive status');
    }

    @isTest
    public static void testInvalidExecute2() {
        Account validAccount = new Account(
            Is_Active__c = false
        );
        Test.startTest();
        BR_InactiveAccount testRule = new BR_InactiveAccount(validAccount, null);
        testRule.process();
        Test.stopTest();

        Assert.areEqual('Inactive', validAccount.Status__c, 'Account should have inactive status');
    }
}