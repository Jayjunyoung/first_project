package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Sale;
import my.util.JdbcUtil;

public class SaleDao {
   
   public void insert(Connection conn, Sale sale) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      try {
         pstmt = conn.prepareStatement
         ("insert into sale (userId,pid,amount,totalprice,sdate)"
               + " values(?,?,?,?,?)");
         pstmt.setString(1, sale.getUserId());
         pstmt.setInt(2, sale.getPid());
         pstmt.setInt(3, sale.getAmount());
         pstmt.setInt(4, sale.gettotalprice());
         pstmt.setTimestamp(5, 
               new Timestamp(sale.getSdate().getTime()));
         pstmt.executeUpdate(); 
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
      }
   }
   
   public Sale selectById(Connection conn, int sid) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      ResultSet rs = null;
      Sale sale = null; 
      try {
         pstmt = conn.prepareStatement
         ("select * from sale where sid = ?");
         pstmt.setInt(1, sid);
         rs = pstmt.executeQuery();
         if (rs.next()){
            sale = new Sale(); 
            sale.setSid(rs.getInt(1));
            sale.setUserId(rs.getString(2));
            sale.setPid(rs.getInt(3));
            sale.setAmount(rs.getInt(4));
            sale.settotalprice(rs.getInt(5));
            sale.setSdate(rs.getTimestamp(6));
         }
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
         JdbcUtil.close(rs);
      }
      return sale;
   }
   
   
   
   
   public int selectCount(Connection conn) throws SQLException {
      Statement stmt = null; 
      ResultSet rs = null; 
      try {
         stmt = conn.createStatement();
         rs = stmt.executeQuery("select count(*) from sale");
         rs.next();
         return rs.getInt(1);
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(rs);
      }
   }
   
   public List<Sale> selectList(Connection conn) 
         throws SQLException {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Sale> saleList = null;
      try {
         pstmt = conn.prepareStatement
               ("select * from sale ");         
         rs  = pstmt.executeQuery(); 
         saleList = new ArrayList<Sale>();
         while (rs.next()){
            Sale sale = new Sale();
            sale.setSid(rs.getInt(1));
            sale.setUserId(rs.getString(2));
            sale.setPid(rs.getInt(3));
            sale.setAmount(rs.getInt(4));
            sale.settotalprice(rs.getInt(5));
            sale.setSdate(rs.getTimestamp(6));
            saleList.add(sale);
         }
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
      }
      return saleList;
   }
}






































