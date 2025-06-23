public with sharing class ZTestTriggerFactory {
    @TestSetup
    static void setup(){
    }

    @IsTest
    static void testGetHandler(){
             
        String error = null;
        Test.startTest();
        Boolean errorOccured = false;
        try {
            TriggerFactory.createHandler(Account.getSObjectType());
        } catch (Exception e) {
            errorOccured = true
        }
    
        Test.stopTest();
        Assert.areEqual(errorOccured, false, 'No Exception is raised');)
               
    }

    @IsTest
    static void testGetHandlerError(){
        
        
        String error = null;
        Test.startTest();

        try {
            TriggerFactory.createHandler(Pricebook2.getSObjectType());
        } catch (Exception e) {
            error = e.getMessage();
        }
        
        Test.stopTest();
        System.assertNotEquals(null, error,'No error is showed');
            
    }
}

