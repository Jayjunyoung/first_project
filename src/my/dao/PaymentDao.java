package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Payment;
import my.util.JdbcUtil;

public class PaymentDao {
   
   public void insert(Connection conn, Payment payment) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      try {
         pstmt = conn.prepareStatement
         ("insert into payment (userId,cardcompany,cardnumber,validDate,totalprice,paydate)"
               + " values(?,?,?,?,?,?)");
         pstmt.setString(1, payment.getUserId());
         pstmt.setString(2, payment.getCardCompany());
         pstmt.setString(3, payment.getCardNumber());
         pstmt.setTimestamp(4, new Timestamp(payment.getValidDate().getTime()));
         pstmt.setInt(5, payment.getTotalPrice());
         pstmt.setTimestamp(6, 
               new Timestamp(payment.getPayDate().getTime()));
         pstmt.executeUpdate(); 
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
      }
   }
   
   
   
   public List<Payment> selectList(Connection conn) 
         throws SQLException {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Payment> paymentList = null;
      try {
         pstmt = conn.prepareStatement
               ("select * from payment ");         
         rs  = pstmt.executeQuery(); 
         paymentList = new ArrayList<Payment>();
         while (rs.next()){
            Payment payment = new Payment();
            payment.setPayId(rs.getInt(1));
            payment.setUserId(rs.getString(2));
            payment.setCardCompany(rs.getString(3));
            payment.setCardNumber(rs.getString(4));
            payment.setValidDate(rs.getTimestamp(5));
            payment.setTotalPrice(rs.getInt(6));
            payment.setPayDate(rs.getTimestamp(7));
            paymentList.add(payment);
         }
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
      }
      return paymentList;
   }
}





















