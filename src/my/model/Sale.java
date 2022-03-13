package my.model;

import java.util.Date;

   public class Sale{
      private int sid;
      private String userId;
      private int pid;
      private int amount;
      private int totalprice;
      private Date sdate;
      
      public Sale() {}

      
      public Sale(String userId, int pid, int amount, int totalprice, Date sdate) {
         super();
         this.userId = userId;
         this.pid = pid;
         this.amount = amount;
         this.totalprice = totalprice;
         this.sdate = sdate;
      }


      public int getSid() {
         return sid;
      }


      public void setSid(int sid) {
         this.sid = sid;
      }


      public String getUserId() {
         return userId;
      }


      public void setUserId(String userId) {
         this.userId = userId;
      }


      public int getPid() {
         return pid;
      }


      public void setPid(int pid) {
         this.pid = pid;
      }


      public int getAmount() {
         return amount;
      }


      public void setAmount(int amount) {
         this.amount = amount;
      }


      public int gettotalprice() {
         return totalprice;
      }


      public void settotalprice(int totalprice) {
         this.totalprice = totalprice;
      }


      public Date getSdate() {
         return sdate;
      }


      public void setSdate(Date sdate) {
         this.sdate = sdate;
      }


      
      
}