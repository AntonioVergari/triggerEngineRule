@isTest
public with sharing class ZTestBR_LowRevenueAccount {

    @isTest
    public static void testValidExecute() {
        Account validAccount = new Account(
            Name = 'TestAccount',
            AnnualRevenue = 100000
        );
        Test.startTest();
        BR_LowRevenueAccount testRule = new BR_LowRevenueAccount(validAccount, null);
        testRule.process();
        Test.stopTest();

        Assert.areEqual('Low Revenue', validAccount.Status__c, 'Account should have low revenue status');
    }

    @isTest
    public static void testInvalidExecute() {
        Account validAccount = new Account(
            Name = 'TestAccount',
            AnnualRevenue = 10000000
        );
        Test.startTest();
        BR_LowRevenueAccount testRule = new BR_LowRevenueAccount(validAccount, null);
        testRule.process();
        Test.stopTest();

        Assert.areNotEqual('Low Revenue', validAccount.Status__c, 'Account shouldn\'t have low revenue status');
    }
}