public with sharing class PaymentTriggerHandler {
    List<Payment__c> triggerOld = new List<Payment__c>();
    List<Payment__c> triggerNew = new List<Payment__c>();

    private String DONE_STATUS = 'DONE';

    public PaymentTriggerHandler() {
    }

    public PaymentTriggerHandler(List<sObject> triggerOld, List<sObject> triggerNew) {
        this.triggerOld = triggerOld;
        this.triggerNew = triggerNew;
    }

    public void beforeInsert() {
        
    }
    public void afterInsert() {

    }
    public void beforeUpdate() {
        updateFinalAmount();
    }
    public void afterUpdate() {

    }

    private void updateFinalAmount() {
        List<Payment__c> updatePms = new List<Payment__c>();
        for (Payment__c pm : this.triggerNew) {
            if (pm.Status__c == this.DONE_STATUS && pm.Final_Amount__c == null) {
                Payment__c newPm = new Payment__c();
                newPm.Final_Amount__c = pm.Amount__c;
                updatePms.add(pm);
            }
        }
        update updatePms;
    }
}