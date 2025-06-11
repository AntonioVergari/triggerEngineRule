public abstract class BR_AbstractAccountStatus extends AbstractBusinessRule {
    protected Account newAccount;
    protected Account oldAccount;

    public BR_AbstractAccountStatus(Account newAccount, Account oldAccount) {
        super();
        this.newAccount = newAccount;
        this.oldAccount = oldAccount;
    }
}