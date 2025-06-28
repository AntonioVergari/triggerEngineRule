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

 public with sharing class TriggerUtils {

    public Static String getTriggerName(Schema.sObjectType soType ) {
        String objName = soType.getDescribe().getName();
        return getTriggerName(objName);
    }

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