package my.model;

import java.util.Date;

public class Payment {
   private int payId;
   private String userId;
   private String cardCompany;
   private String cardNumber;
   private Date validDate;
   private int totalPrice;
   private Date payDate;
   
   public Payment() {}

   public Payment(String userId, String cardCompany, String cardNumber, Date valideDate, int totalPrice,
         Date payDate) {
      super();
      this.userId = userId;
      this.cardCompany = cardCompany;
      this.cardNumber = cardNumber;
      this.validDate = valideDate;
      this.totalPrice = totalPrice;
      this.payDate = payDate;
   }

   public int getPayId() {
      return payId;
   }

   public void setPayId(int payId) {
      this.payId = payId;
   }

   public String getUserId() {
      return userId;
   }

   public void setUserId(String userId) {
      this.userId = userId;
   }

   public String getCardCompany() {
      return cardCompany;
   }

   public void setCardCompany(String cardCompany) {
      this.cardCompany = cardCompany;
   }

   public String getCardNumber() {
      return cardNumber;
   }

   public void setCardNumber(String cardNumber) {
      this.cardNumber = cardNumber;
   }

   public Date getValidDate() {
      return validDate;
   }

   public void setValidDate(Date validDate) {
      this.validDate = validDate;
   }

   public int getTotalPrice() {
      return totalPrice;
   }

   public void setTotalPrice(int totalPrice) {
      this.totalPrice = totalPrice;
   }

   public Date getPayDate() {
      return payDate;
   }

   public void setPayDate(Date payDate) {
      this.payDate = payDate;
   }

   

   
}
