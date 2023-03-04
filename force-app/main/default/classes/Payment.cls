public virtual class Payment {
    public Payment() {
    }

    private Id AccountId;

    private Double Ammount;

    private Id ClassId;

    private Id CreatedById;

    private Id LastModifiedById;

    private Date Payment_date;

    private String Payment_method;

    private String Name;

    public Id getAccountId(){
        return this.AccountId;
    }

    public void setAccountId(String AccountId) {
        this.AccountId = AccountId;
    }

    public Double getAmmount(){
        return this.Ammount;
    }

    public void setAmmount(Double Ammount) {
        this.Ammount = Ammount;
    }

    public Id getClassId(){
        return this.ClassId;
    }

    public void setClassId(String ClassId) {
        this.ClassId = ClassId;
    }
    public Id getCreatedById(){
        return this.CreatedById;
    }

    public void setCreatedById(String CreatedById) {
        this.CreatedById = CreatedById;
    }
    public Id getLastModifiedById(){
        return this.LastModifiedById;
    }

    public void setLastModifiedById(String LastModifiedById) {
        this.LastModifiedById = LastModifiedById;
    }
    public Date getPayment_date(){
        return this.Payment_date;
    }

    public void setPaymentDate(Date Payment_date) {
        this.Payment_date = Payment_date;
    }
    public String getPaymentMethod(){
        return this.Payment_method;
    }

    public void setPaymentMethod(String Payment_method) {
        this.Payment_method = Payment_method;
    }
    public String getName(){
        return this.Name;
    }

    public void setName(String name) {
        this.Name = name;
    }

    public void info(Date payment_date) {
        System.debug('Bạn đã thực hiện một giao dịch vào ngày ' + payment_method);
    }

    public virtual void info(Double ammount, Date payment_date) {
        System.debug('Bạn đã thực hiện một giao dịch vào ngày ' + payment_date + ' với số tiền ' + ammount);
    }
}
