public with sharing class BR_ActiveAccount extends BR_AbstractAccountStatus{
    Account newAccount;

    public BR_ActiveAccount(Account newAccount) {
        super(newAccount, null);
        this.newAccount = newAccount;
    }

    public override void execute() {
        newAccount.Status__c = 'Active';
    }
}