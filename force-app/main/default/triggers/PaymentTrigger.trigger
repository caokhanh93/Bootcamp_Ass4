trigger PaymentTrigger on Payment__c (before insert, after insert, before update, after update) {
    PaymentTriggerHandler handler = new PaymentTriggerHandler(Trigger.old, Trigger.new);

    if (Trigger.isBefore & Trigger.isInsert) {
        handler.beforeInsert();
    }

    if (Trigger.isAfter & Trigger.isInsert) {
        handler.afterInsert();
    }

    if (Trigger.isBefore & Trigger.isUpdate) {
        handler.beforeUpdate();
    }

    if (Trigger.isAfter & Trigger.isUpdate) {
        handler.afterUpdate();
    }
}