@IsTest
public with sharing class ZTestTriggerFactory {
    @TestSetup
    public static void setup(){
    }

    @IsTest
    public static void testGetHandler(){
             
        String error = null;
        Test.startTest();
        Boolean errorOccured = false;
        try {
            TriggerFactory.createHandler(Account.getSObjectType());
        } catch (Exception e) {
            errorOccured = true;
        }
    
        Test.stopTest();
        Assert.areEqual(errorOccured, true, 'No Exception is raised');        
    }

    /** This test will fail if you create an handler on Pricebook2,
     *  be sure that the object doesn't have an Handler that implements ITrigger inteface
    **/
    @IsTest
    public static void testGetHandlerError(){
        String errorMessage = null;
        Test.startTest();

        try {
            TriggerFactory.createHandler(Pricebook2.getSObjectType());
        } catch (Exception e) {
            errorMessage = e.getMessage();
        }
        
        Test.stopTest();
        String objName = Pricebook2.getSObjectType().getDescribe().getName();
        System.assertNotEquals(null, errorMessage,'No error is showed');
        System.assertEquals(
            'No Trigger Handler registered for Object Type: ' + objName,
            errorMessage,
            'Invalid error message'
        );      
    }


}

