trigger AccountTrigger on Account (before insert) {
    TriggerFactory.createHandler(Account.sObjectType);
}