public with sharing class TriggerUtils {

    public static String getTriggerName(Schema.sObjectType soType) {
        String objName = soType.getDescribe().getName();
        if (objName.contains('__c')) {
            objName = objName.split('__c').get(0);
        }
        System.debug(objName);
        return objName + 'Handler';
    }
}