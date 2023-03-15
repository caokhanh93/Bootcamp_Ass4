trigger PaymentTrigger on Payment__c (before insert, after insert, before update, after update) {
    PaymentTriggerHandler handler = new PaymentTriggerHandler(Trigger.old, Trigger.new);

    
}