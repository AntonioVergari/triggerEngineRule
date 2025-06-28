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

 /**
 * Class TriggerFactory
 *
 * Used to instantiate and execute Trigger Handlers associated with sObjects.
 */
public with sharing class TriggerFactory {
    private static String triggerName;
    /**
     * Public static method to create and execute a trigger handler
     *
     * Arguments:   Schema.sObjectType soType - Object type to process (SObject.sObjectType)
     *
     * Throws a TriggerException if no handler has been coded.
     */
    public static void createHandler(Schema.sObjectType soType) {
        String objName = soType.getDescribe().getName();
        createHandler(objName);
    }


    public static void createHandler(String objName) {
        // Get a handler appropriate to the object being processed
        ITrigger handler = null;
        try {
            handler = getHandler(objName);
        } catch (Exception ex) {
            throw new TriggerException(
                'No Trigger Handler registered for Object Type: ' + objName
            );
        }
        execute(handler);
    }

    /**
     * private static method to control the execution of the handler
     *
     * Arguments:   ITrigger handler - A Trigger Handler to execute
     */
    private static void execute(ITrigger handler) {
        System.debug(
            'DTGN QUERY START ' +
            Limits.getQueries() +
            ' FROM handler ' +
            handler
        );
        TriggerLock lock = TriggerLockBuilder.getTriggerLock(triggerName);
        if (Trigger.isBefore) {
            // Call the bulk before to handle any caching of data and enable bulkificatio
            // Before Trigger
            handler.bulkBefore();

            // Iterate through the records to be deleted passing them to the handler.
            if (
                Trigger.isDelete && 
                !lock.isDisabled(EnumTriggerPhase.BEFORE_DELETE) &&
                !lock.isDisabled(EnumTriggerPhase.ALL_DELETE)
            ) {
                for (SObject so : Trigger.old) {
                    RuleEngine.applyRules(
                        handler.beforeDelete(so)
                    );
                }
            } else if (
                Trigger.isInsert &&
                !lock.isDisabled(EnumTriggerPhase.BEFORE_INSERT) &&
                !lock.isDisabled(EnumTriggerPhase.ALL_INSERT)
            ) {
            // Iterate through the records to be inserted passing them to the handler.
                for (SObject so : Trigger.new) {
                    RuleEngine.applyRules(
                        handler.beforeInsert(so)
                    );
                }
            } else if (
                Trigger.isUpdate && 
                !lock.isDisabled(EnumTriggerPhase.BEFORE_UPDATE) &&
                !lock.isDisabled(EnumTriggerPhase.ALL_UPDATE)
            ) {
                // Iterate through the records to be updated passing them to the handler.
                for (SObject so : Trigger.old) {
                    RuleEngine.applyRules(
                        handler.beforeUpdate(so, Trigger.newMap.get(so.Id))
                    );
                }
            }
        } else {
            // Call the bulk after to handle any caching of data and enable bulkification
            handler.bulkAfter();

            // Iterate through the records deleted passing them to the handler.
            if (
                Trigger.isDelete && 
                !lock.isDisabled(EnumTriggerPhase.AFTER_DELETE) &&
                !lock.isDisabled(EnumTriggerPhase.ALL_DELETE)
            ) {
                for (SObject so : Trigger.old) {
                    RuleEngine.applyRules(
                        handler.afterDelete(so)
                    );
                }
            } else if (
                Trigger.isInsert &&
                !lock.isDisabled(EnumTriggerPhase.AFTER_INSERT) &&
                !lock.isDisabled(EnumTriggerPhase.ALL_INSERT)
            ) {
                // Iterate through the records inserted passing them to the handler.
                for (SObject so : Trigger.new) {
                    RuleEngine.applyRules(
                        handler.afterInsert(so)
                    );
                }
            } else if (
                Trigger.isUpdate &&
                !lock.isDisabled(EnumTriggerPhase.AFTER_UPDATE) &&
                !lock.isDisabled(EnumTriggerPhase.ALL_UPDATE)
            ) {
                // Iterate through the records updated passing them to the handler.
                for (SObject so : Trigger.old) {
                    RuleEngine.applyRules(
                        handler.afterUpdate(so, Trigger.newMap.get(so.Id))
                    );
                }
            }
        }
        // Perform any post processing
        if(!lock.isDisabled(EnumTriggerPhase.FINALLY_BLOCK)) {
            RuleEngine.applyRules(
                handler.andFinally()
            );
        }
    }

    /**
     * private static method to get the appropriate handler for the object type.
     * Modify this method to add any additional handlers.
     *
     * Arguments:   String objName - Object apiname tolocate
     *
     * Returns:     ITrigger - A trigger handler if one exists or null.
     */
    private static ITrigger getHandler(String objName) {
        triggerName = TriggerUtils.getTriggerName(objName);
        System.Type objType = Type.forName(triggerName);
        System.debug('objType:' + objType);
        Object obj = objType.newInstance();

        return (ITrigger) obj;
    }

}
