public with sharing class TriggerLockBuilder {
	static Map<String, TriggerLock> triggerLockMap = new Map<String, TriggerLock>();

	public static TriggerLock getTriggerLock(String triggerName) {
		if (triggerLockMap.containsKey(triggerName)) {
		return triggerLockMap.get(triggerName);
		} else {
		TriggerLock lock = new TriggerLock(triggerName);
		triggerLockMap.put(triggerName, lock);
		return lock;
		}
	}

	public static TriggerLock getTriggerLock(Schema.sObjectType soType) {
		String triggerName = TriggerUtils.getTriggerName(soType);
		return getTriggerLock(triggerName);
	}
}