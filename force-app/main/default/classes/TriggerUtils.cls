public with sharing class TriggerUtils {

    public static String getTriggerName(String objName) {
        List<String> objParts = objName.split('__');
        String result;
        System.debug(objParts);
        if(objParts.size() == 1) {
            // standard obj
            return handleStandardObj(objName);
        } else if (objParts.size() == 2) {
            // custom obj no namespace
            return handleCustoObjNoNamespace(objParts);
        } else if (objParts.size() == 3) {
            // custom obj with namespace
            return handleCustoObjWithNamespace(objParts);
        } 

        //no valid strategy, throw excetion
        throw new TriggerException('invalid objName: ' + objName);
    }


    @testVisible
    private static String handleStandardObj(String objName) {
        return objName + 'Handler';
    }

    @testVisible
    private static String handleCustoObjNoNamespace(List<String> objParts) {
        return objParts[0] + 'Handler';
    }

    @testVisible
    private static String handleCustoObjWithNamespace(List<String> objParts) {
        return objParts[1] + 'Handler';
    }
}