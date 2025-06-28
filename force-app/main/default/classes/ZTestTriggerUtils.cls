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
public with sharing class ZTestTriggerUtils {


    @IsTest
    static void testValidObjectFormat(){
        
        Test.startTest();
        String standardObj = TriggerUtils.getTriggerName('Account');
        String customObj = TriggerUtils.getTriggerName('Dossier__c');
        String customObjNamespace = TriggerUtils.getTriggerName('Namespace__Dossier__c');
        String customObjComplex = TriggerUtils.getTriggerName('Dossier_File__c');
        String customObjComplexNmspace = TriggerUtils.getTriggerName('Namespace__Dossier_File__c');

        Test.stopTest();
        Assert.areEqual(standardObj, 'AccountHandler',' Invalid TriggerName');
        Assert.areEqual(customObj, 'DossierHandler',' Invalid TriggerName');
        Assert.areEqual(customObjNamespace, 'DossierHandler',' Invalid TriggerName');
        Assert.areEqual(customObjComplex, 'Dossier_FileHandler',' Invalid TriggerName');
        Assert.areEqual(customObjComplexNmspace, 'Dossier_FileHandler',' Invalid TriggerName');
    }

    @IsTest
    static void testInvalidValidObjectFormat(){
        
        Test.startTest();
        Boolean exceptionOccurred = false;
        try {
            
            String standardObj = TriggerUtils.getTriggerName('Invalid__Object__Name__c');
        } catch (Exception e) {
            exceptionOccurred = true;
        }

        Test.stopTest();
        Assert.areEqual(exceptionOccurred, true,'No exception occurred for invalid object name');
    }
}