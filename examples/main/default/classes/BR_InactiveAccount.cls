public with sharing class BR_InactiveAccount extends BR_AbstractAccountStatus{


    public BR_InactiveAccount (Account newAccount, Account oldAccount) {
        super(newAccount, oldAccount);

        nextRule = new BR_LowRevenueAccount(newAccount, oldAccount);
    }

    
    public override Boolean shouldExecute() {
        return !newAccount.Is_Active__c && oldAccount != null && oldAccount.Is_Active__c;
    }

    public override void execute() {
        newAccount.Status__c = 'Inactive';
    }

}