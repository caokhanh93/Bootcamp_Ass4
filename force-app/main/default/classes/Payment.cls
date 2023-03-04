public with sharing class Payment {
    public Payment() {

    }
    private Id AccountId {set;get;}

    private Double Ammount {set; get;}

    private Id ClassId {set; get;}

    private Id CreatedById {set; get;}

    private Id LastModifiedById {set; get;}

    private Date Payment_date {set; get;}

    private List<String> Payment_method {set; get;}

    private String Name;

    public String getName(){
        return this.Name;
    }

    public void setName(String name) {
        this.Name = name;
    }
}
