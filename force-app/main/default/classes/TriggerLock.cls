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

 public with sharing class TriggerLock {
    private final Map<EnumTriggerPhase, Phase> phases;
    private static final Map<EnumTriggerPhase, String> PHASE_METADATA_MAPPING = new Map<EnumTriggerPhase, String>{
        EnumTriggerPhase.BEFORE_INSERT => 'Disable_Before_Insert__c',
        EnumTriggerPhase.BEFORE_UPDATE => 'Disable_Before_Update__c',
        EnumTriggerPhase.BEFORE_DELETE => 'Disable_Before_Delete__c',
        EnumTriggerPhase.AFTER_INSERT => 'Disable_After_Insert__c',
        EnumTriggerPhase.AFTER_UPDATE => 'Disable_After_Update__c',
        EnumTriggerPhase.AFTER_DELETE => 'Disable_After_Delete__c',
        EnumTriggerPhase.ALL_UPDATE => 'Disable_Update__c',
        EnumTriggerPhase.ALL_DELETE => 'Disable_Delete__c',
        EnumTriggerPhase.ALL_INSERT => 'Disable_Insert__c',
        EnumTriggerPhase.FINALLY_BLOCK => 'Disable_Finally__c',
        EnumTriggerPhase.ALL => 'Disable_Trigger__c'
    };

    public TriggerLock(String triggerName) {
        this.phases = new Map<EnumTriggerPhase, Phase>();
        Trigger_Setting__mdt setting = fetchSettings(triggerName);
        //load metadata config if exists
        for (EnumTriggerPhase phase : PHASE_METADATA_MAPPING.keySet()) {
            Boolean phaseDisabledByMetadata = setting != null? 
                (Boolean) setting.get(PHASE_METADATA_MAPPING.get(phase)) :
                false;
            phases.put(phase, new Phase(phaseDisabledByMetadata));
        }
    }

    public Boolean isDisabled(EnumTriggerPhase phase) {
        return (phases.containsKey(phase) && phases.get(phase).isDisabled()) || 
        (phases.containsKey(phase) && phases.get(EnumTriggerPhase.ALL).isDisabled());
    }

    
    public void lock(EnumTriggerPhase phase) {
        if (phases.containsKey(phase) && !phases.get(phase).metadataDisabled) {
            phases.get(phase).lock();
        }
    }

    public void unlock(EnumTriggerPhase phase) {
        if (phases.containsKey(phase) && !phases.get(phase).metadataDisabled) {
            phases.get(phase).unlock();
        }
    }

    private Trigger_Setting__mdt fetchSettings(String triggerName) {
        List<Trigger_Setting__mdt> settings = [
            SELECT 
            Disable_Before_Insert__c, Disable_Before_Update__c,
            Disable_Before_Delete__c, Disable_After_Insert__c,
            Disable_After_Update__c, Disable_After_Delete__c,
            Disable_Finally__c, Disable_Trigger__c,Disable_Update__c,
            Disable_Insert__c, Disable_Delete__c
            FROM Trigger_Setting__mdt
            WHERE DeveloperName = :triggerName
            LIMIT 1
        ];
        return settings.isEmpty() ? null : settings.get(0);
    }

    
    private class Phase {
        private final Boolean metadataDisabled;
        private Boolean runtimeLocked = false;

        public Phase(Boolean metadataDisabled) {
            this.metadataDisabled = metadataDisabled;
        }

        public Boolean isDisabled() {
            return metadataDisabled || runtimeLocked;
        }

        public void lock() { 
            runtimeLocked = true; 
        }
        public void unlock() { 
            runtimeLocked = false; 
        }
    }
}