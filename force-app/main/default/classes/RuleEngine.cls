public with sharing class RuleEngine {

    public static void applyRules(List<IBusinessRule> rules) {
        for(IBusinessRule rule: rules) {
            rule.process();
        }
    }
}

