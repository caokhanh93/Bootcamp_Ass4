public with sharing class PaymentTriggerHandler {
    Map<Id, Payment__c> oldMap = new Map<Id, Payment__c>();
    List<Payment__c> newList = new List<Payment__c>();

    private String DONE_STATUS = 'DONE';

    // Constructor
    public PaymentTriggerHandler() {
    }
    // Constructor
    public PaymentTriggerHandler(Map<Id, Payment__c> oldMap, List<Payment__c> newList) {
        this.oldMap = oldMap;
        this.newList = newList;
    }
    // Logic run on before insert
    public void beforeInsert() {
        
    }
    // Logic run on after insert
    public void afterInsert() {
        autoCreateTask();
    }
    // Logic run on before update
    public void beforeUpdate() {
        updateFinalAmount();
        preventChangeStatus();
    }
    // Logic run on after update
    public void afterUpdate() {

    }
    /**
     * tự động update Final Amount = Amount 
     * khi Status chuyển thành Done nếu Final Amount không được nhập dữ liệu
     * 
     * params: 
     * return: 
     */
    private void updateFinalAmount() {
        for (Payment__c pm : this.newList) {
            if (pm.Status__c == this.DONE_STATUS && pm.Final_Amount__c == null) {
                pm.Final_Amount__c = pm.Amount__c;
            }
        }
    }
    /**
     * Ngawn người dùng chuyển status từ Done sang các giá trị khác
     * 
     * params: 
     * return: 
     */
    private void preventChangeStatus() {
        List<Payment__c> updatePms = new List<Payment__c>();
        for (Payment__c pm : this.newList) {
            Payment__c oldPm = this.oldMap.get(pm.id);
            if (oldPm.Status__c == this.DONE_STATUS && pm.Status__c != this.DONE_STATUS) {
                pm.addError('Can not change status from Done to other values');
            }
        }
    }
    /**
     * Tự động tạo task cho owner khi một payment được tạo ra với payment method là Chuyển Khoản 
     * 
     * params: 
     * return: 
     */
    private void autoCreateTask() {
        List<Task> tasks = new List<Task>();
        for (Payment__c pm : this.newList) {
            if (pm.Payment_method__c == 'Chuyển Khoản') {
                Task t = new Task();
                t.Subject = 'verify payment' + pm.Name;
                t.Priority = 'High';
                t.OwnerId = pm.OwnerId;
                t.ActivityDate = pm.Payment_date__c.addDays(1);
                t.Status = 'Not Started';
                t.WhatId = pm.Id;
                tasks.add(t);
            }
        }
        insert tasks;
    }
}