public with sharing class AccountHandler implements ITrigger {
    public AccountHandler() {

    }

    /**
     * bulkBefore
     *
     * This method is called prior to execution of a BEFORE trigger. Use this to cache
     * any data required into maps prior execution of the trigger.
     */
    public void bulkBefore() {

    }
    
    /**
     * bulkAfter
     *
     * This method is called prior to execution of an AFTER trigger. Use this to cache
     * any data required into maps prior execution of the trigger.
     */
    public void bulkAfter() {

    }
    
    /**
     * beforeInsert
     *
     * This method is called iteratively for each record to be inserted during a BEFORE
     * trigger. Never execute any SOQL/SOSL etc in this and other iterative methods.
     */
    public List<IBusinessRule> beforeInsert(SObject so) {
        Account newAccount = (Account) so;
        List<IBusinessRule> rules = new List<IBusinessRule>();
        
        rules.add(new BR_InactiveAccount(newAccount, null));

        return rules;
    }
    
    /**
     * beforeUpdate
     *
     * This method is called iteratively for each record to be updated during a BEFORE
     * trigger.
     */
    public List<IBusinessRule> beforeUpdate(SObject oldSo, SObject so) {
        List<IBusinessRule> rules = new List<IBusinessRule>();
        
        return rules;
    }

    /**
     * beforeDelete
     *
     * This method is called iteratively for each record to be deleted during a BEFORE
     * trigger.
     */
    public List<IBusinessRule> beforeDelete(SObject so) {
        List<IBusinessRule> rules = new List<IBusinessRule>();
        
        return rules;
    }

    /**
     * afterInsert
     *
     * This method is called iteratively for each record inserted during an AFTER
     * trigger. Always put field validation in the 'After' methods in case another trigger
     * has modified any values. The record is 'read only' by this point.
     */
    public List<IBusinessRule> afterInsert(SObject so) {
        List<IBusinessRule> rules = new List<IBusinessRule>();
        
        return rules;
    }

    /**
     * afterUpdate
     *
     * This method is called iteratively for each record updated during an AFTER
     * trigger.
     */
    public List<IBusinessRule> afterUpdate(SObject oldSo, SObject so) {
        List<IBusinessRule> rules = new List<IBusinessRule>();
        
        return rules;
    }

    /**
     * afterDelete
     *
     * This method is called iteratively for each record deleted during an AFTER
     * trigger.
     */
    public List<IBusinessRule> afterDelete(SObject so) {
        List<IBusinessRule> rules = new List<IBusinessRule>();
        
        return rules;
    }

    /**
     * andFinally
     *
     * This method is called once all records have been processed by the trigger. Use this 
     * method to accomplish any final operations such as creation or updates of other records.
     */
    public List<IBusinessRule> andFinally() {
        List<IBusinessRule> rules = new List<IBusinessRule>();
        
        return rules;
    }
}