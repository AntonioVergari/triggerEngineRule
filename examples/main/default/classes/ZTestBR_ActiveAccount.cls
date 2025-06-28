@isTest
public with sharing class ZTestBR_ActiveAccount {

    @isTest
    public static void testFullFlow() {
        Account validAccount = new Account(
            Name = 'TestAccount',
            AnnualRevenue = 10000000,
            is_Active__c = true
        );
        Test.startTest();
        BR_LowRevenueAccount testRule = new BR_LowRevenueAccount(validAccount, null);
        testRule.process();
        Test.stopTest();

        Assert.areEqual('Active', validAccount.Status__c, 'Account should have Active status');
    }

    @isTest
    public static void testValidExecute() {
        Account validAccount = new Account(
            Name = 'TestAccount',
            AnnualRevenue = 100000000
        );
        Test.startTest();
        BR_LowRevenueAccount testRule = new BR_LowRevenueAccount(validAccount, null);
        testRule.process();
        Test.stopTest();

        Assert.areEqual('Active', validAccount.Status__c, 'Account shouldn have active status');
    }
}