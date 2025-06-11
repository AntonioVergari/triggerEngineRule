public with sharing class BR_LowRevenueAccount extends BR_AbstractAccountStatus{

    public BR_LowRevenueAccount(Account newAccount, Account oldAccount) {
        super(newAccount, oldAccount);

        nextRule = new BR_ActiveAccount(newAccount);
    }
    
    public override Boolean shouldExecute() {
        return newAccount.AnnualRevenue < 1000000; // lower than a milion
    }

    public override void execute() {
        newAccount.Status__c = 'Low Revenue';
    }

}