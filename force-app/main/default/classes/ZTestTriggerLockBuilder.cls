@isTest
public with sharing class ZTestTriggerLockBuilder {

    @IsTest
    public static void testSameLock() {
        TriggerLock lock1 = TriggerLockBuilder.getTriggerLock(Account.getSObjectType());
        lock1.lock(EnumTriggerPhase.BEFORE_INSERT);
        TriggerLock lock2 = TriggerLockBuilder.getTriggerLock(Account.getSObjectType());

        Assert.areEqual(
            lock1.isDisabled(EnumTriggerPhase.BEFORE_INSERT), 
            lock2.isDisabled(EnumTriggerPhase.BEFORE_INSERT), 
            'Lock2 must have BEFORE_INSERT Locked like lock1');
    }

        
    @IsTest
    public static void testDifferentLock() {
        TriggerLock lock1 = TriggerLockBuilder.getTriggerLock(Account.getSObjectType());
        lock1.lock(EnumTriggerPhase.BEFORE_INSERT);
        TriggerLock lock2 = TriggerLockBuilder.getTriggerLock(Contact.getSObjectType());

        Assert.areEqual(
            false, 
            lock2.isDisabled(EnumTriggerPhase.BEFORE_INSERT), 
            'Lock2 shouldn\' have BEFORE_INSERT locked');
    }
}