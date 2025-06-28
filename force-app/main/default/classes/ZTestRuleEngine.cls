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
public with sharing class ZTestRuleEngine {

    @IsTest
    public static void emptyList(){
        
        Test.startTest();
        Boolean exceptionOccurred = false;
        try {
            RuleEngine.applyRules(new List<IBusinessRule>());
        } catch (Exception e) {
            exceptionOccurred = true;
        }
        Test.stopTest();
        Assert.areNotEqual(exceptionOccurred, true, 'An Exception occurred');
    }

    @IsTest
    public static void BRList(){
        
        Test.startTest();
        Boolean exceptionOccurred = false;
        Account newAccount = new Account(
            name = 'no_BR_Applied'
        );
        try {
            List<IBusinessRule> rules = new List<IBusinessRule>();
            rules.add(new BR_Test(newAccount));
            RuleEngine.applyRules(rules);
        } catch (Exception e) {
            exceptionOccurred = true;
        }
        Test.stopTest();
        Assert.areNotEqual(exceptionOccurred, true, 'An Exception occurred');
        Assert.areEqual(newAccount.name, 'BR_applied', 'Business Rules is not applied');
    }



    private class BR_Test extends AbstractBusinessRule {
        private Account newAccount;
        public BR_Test(Account newAccount) {

        super();
        this.newAccount = newAccount;
        }

        public override void execute() {
            newAccount.name = 'BR_applied';
        }
    }

        
    
}