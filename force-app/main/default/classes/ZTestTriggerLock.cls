@isTest
public with sharing class ZTestTriggerLock {


    @isTest
    public static void testMetadataGlobalLock() {
        Test.startTest();
        TriggerLock lock = new TriggerLock('TestTriggerLockGlobally');
        Test.stopTest();

        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.BEFORE_INSERT), 'Lock must be enabled');
        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.BEFORE_UPDATE), 'Lock must be enabled');
        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.BEFORE_DELETE), 'Lock must be enabled');
        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.AFTER_INSERT), 'Lock must be enabled');
        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.AFTER_UPDATE), 'Lock must be enabled');
        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.AFTER_DELETE), 'Lock must be enabled');
        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.ALL_UPDATE), 'Lock must be enabled');
        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.ALL_DELETE), 'Lock must be enabled');
        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.ALL_INSERT), 'Lock must be enabled');
        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.FINALLY_BLOCK), 'Lock must be enabled');

    }


    @isTest
    public static void testMetadataAfterLock() {
        Test.startTest();
        TriggerLock lock = new TriggerLock('TestTriggerLockAfter');
        Test.stopTest();

        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.BEFORE_INSERT), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.BEFORE_UPDATE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.BEFORE_DELETE), 'Lock must be disabled');
        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.AFTER_INSERT), 'Lock must be enabled');
        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.AFTER_UPDATE), 'Lock must be enabled');
        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.AFTER_DELETE), 'Lock must be enabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.ALL_UPDATE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.ALL_DELETE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.ALL_INSERT), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.FINALLY_BLOCK), 'Lock must be disabled');

    }
    
    @isTest
    public static void testMetadataBeforeLock() {
        Test.startTest();
        TriggerLock lock = new TriggerLock('TestTriggerLockBefore');
        Test.stopTest();

        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.BEFORE_INSERT), 'Lock must be enabled');
        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.BEFORE_UPDATE), 'Lock must be enabled');
        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.BEFORE_DELETE), 'Lock must be enabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.AFTER_INSERT), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.AFTER_UPDATE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.AFTER_DELETE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.ALL_UPDATE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.ALL_DELETE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.ALL_INSERT), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.FINALLY_BLOCK), 'Lock must be disabled');

    }

    @isTest
    public static void testMetadataInsertLock() {
        Test.startTest();
        TriggerLock lock = new TriggerLock('TestTriggerLockInsert');
        Test.stopTest();

        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.BEFORE_INSERT), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.BEFORE_UPDATE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.BEFORE_DELETE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.AFTER_INSERT), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.AFTER_UPDATE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.AFTER_DELETE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.ALL_UPDATE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.ALL_DELETE), 'Lock must be disabled');
        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.ALL_INSERT), 'Lock must be enabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.FINALLY_BLOCK), 'Lock must be disabled');

    }

    @isTest
    public static void testMetadataUpdateLock() {
        Test.startTest();
        TriggerLock lock = new TriggerLock('TestTriggerLockUpdate');
        Test.stopTest();

        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.BEFORE_INSERT), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.BEFORE_UPDATE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.BEFORE_DELETE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.AFTER_INSERT), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.AFTER_UPDATE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.AFTER_DELETE), 'Lock must be disabled');
        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.ALL_UPDATE), 'Lock must be enabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.ALL_DELETE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.ALL_INSERT), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.FINALLY_BLOCK), 'Lock must be disabled');

    }

    @isTest
    public static void testMetadataDeleteLock() {
        Test.startTest();
        TriggerLock lock = new TriggerLock('TestTriggerLockDelete');
        Test.stopTest();

        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.BEFORE_INSERT), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.BEFORE_UPDATE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.BEFORE_DELETE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.AFTER_INSERT), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.AFTER_UPDATE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.AFTER_DELETE), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.ALL_UPDATE), 'Lock must be disabled');
        Assert.AreEqual(true, lock.isDisabled(EnumTriggerPhase.ALL_DELETE), 'Lock must be enabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.ALL_INSERT), 'Lock must be disabled');
        Assert.AreEqual(false, lock.isDisabled(EnumTriggerPhase.FINALLY_BLOCK), 'Lock must be disabled');

    }

    @isTest
    public static void testRuntimeLock() {
        Test.startTest();
        TriggerLock triggerLock = new TriggerLock('noMetdata');
        triggerLock.lock(EnumTriggerPhase.BEFORE_DELETE);
        triggerLock.lock(EnumTriggerPhase.AFTER_DELETE);
        Test.stopTest();

        Assert.AreEqual(false, triggerLock.isDisabled(EnumTriggerPhase.BEFORE_INSERT), 'Lock must be disabled');
        Assert.AreEqual(false, triggerLock.isDisabled(EnumTriggerPhase.BEFORE_UPDATE), 'Lock must be disabled');
        Assert.AreEqual(true, triggerLock.isDisabled(EnumTriggerPhase.BEFORE_DELETE), 'Lock must be enabled');
        Assert.AreEqual(false, triggerLock.isDisabled(EnumTriggerPhase.AFTER_INSERT), 'Lock must be disabled');
        Assert.AreEqual(false, triggerLock.isDisabled(EnumTriggerPhase.AFTER_UPDATE), 'Lock must be disabled');
        Assert.AreEqual(true, triggerLock.isDisabled(EnumTriggerPhase.AFTER_DELETE), 'Lock must be enabled');
        Assert.AreEqual(false, triggerLock.isDisabled(EnumTriggerPhase.ALL_UPDATE), 'Lock must be disabled');
        Assert.AreEqual(false, triggerLock.isDisabled(EnumTriggerPhase.ALL_DELETE), 'Lock must be disabled');
        Assert.AreEqual(false, triggerLock.isDisabled(EnumTriggerPhase.ALL_INSERT), 'Lock must be disabled');
        Assert.AreEqual(false, triggerLock.isDisabled(EnumTriggerPhase.FINALLY_BLOCK), 'Lock must be disabled');

    }


    @isTest
    public static void testRuntimeUnLock() {
        Test.startTest();
        TriggerLock triggerLock = new TriggerLock('noMetdata');
        triggerLock.lock(EnumTriggerPhase.BEFORE_DELETE);
        Assert.AreEqual(true, triggerLock.isDisabled(EnumTriggerPhase.BEFORE_DELETE), 'Lock must be enabled');
        triggerLock.unlock(EnumTriggerPhase.BEFORE_DELETE);
        Test.stopTest();

        Assert.AreEqual(false, triggerLock.isDisabled(EnumTriggerPhase.BEFORE_INSERT), 'Lock must be disabled');
        Assert.AreEqual(false, triggerLock.isDisabled(EnumTriggerPhase.BEFORE_UPDATE), 'Lock must be disabled');
        Assert.AreEqual(false, triggerLock.isDisabled(EnumTriggerPhase.BEFORE_DELETE), 'Lock must be disabled');
        Assert.AreEqual(false, triggerLock.isDisabled(EnumTriggerPhase.AFTER_INSERT), 'Lock must be disabled');
        Assert.AreEqual(false, triggerLock.isDisabled(EnumTriggerPhase.AFTER_UPDATE), 'Lock must be disabled');
        Assert.AreEqual(false, triggerLock.isDisabled(EnumTriggerPhase.AFTER_DELETE), 'Lock must be disabled');
        Assert.AreEqual(false, triggerLock.isDisabled(EnumTriggerPhase.ALL_UPDATE), 'Lock must be disabled');
        Assert.AreEqual(false, triggerLock.isDisabled(EnumTriggerPhase.ALL_DELETE), 'Lock must be disabled');
        Assert.AreEqual(false, triggerLock.isDisabled(EnumTriggerPhase.ALL_INSERT), 'Lock must be disabled');
        Assert.AreEqual(false, triggerLock.isDisabled(EnumTriggerPhase.FINALLY_BLOCK), 'Lock must be disabled');

    }
}