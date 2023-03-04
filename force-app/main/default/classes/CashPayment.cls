public class CashPayment extends Payment {
    public CashPayment() {

    }

    public override void info(Double ammount, Date payment_date) {
        System.debug('Bạn đã thực hiện một giao dịch bằng tiền mặt vào ngày ' + payment_date + ' với số tiền ' + ammount);
    }
}
