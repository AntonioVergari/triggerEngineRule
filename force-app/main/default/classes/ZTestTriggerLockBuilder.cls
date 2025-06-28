/*
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

	https://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

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