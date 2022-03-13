package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Phone;
import my.model.Product;
import my.util.JdbcUtil;

public class PhoneDao {
   
   public void insert(Connection conn, Phone phone) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      try {
         pstmt = conn.prepareStatement
         ("insert into phone (pcode,maker,mname,company,capacity,price,pdate,pimage,pcount)"
               + " values(?,?,?,?,?,?,?,?,?)");
         pstmt.setInt(1, phone.getPcode());
         pstmt.setString(2, phone.getMaker());
         pstmt.setString(3, phone.getMname());
         pstmt.setString(4, phone.getCompany());
         pstmt.setString(5, phone.getCapacity());
         pstmt.setInt(6, phone.getPrice());
         pstmt.setTimestamp(7, 
               new Timestamp(phone.getPdate().getTime()));
         pstmt.setString(8, phone.getPimage());
         pstmt.setInt(9, 0);
         pstmt.executeUpdate(); 
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
      }
   }
   
   public Phone selectById(Connection conn, int pid) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      ResultSet rs = null;
      Phone phone = null; 
      try {
         pstmt = conn.prepareStatement
         ("select * from phone where pid = ?");
         pstmt.setInt(1, pid);
         rs = pstmt.executeQuery();
         if (rs.next()){
            phone = new Phone(); 
            phone.setPid(rs.getInt(1));
            phone.setPcode(rs.getInt(2));
            phone.setMaker(rs.getString(3));
            phone.setMname(rs.getString(4));
            phone.setCompany(rs.getString(5));
            phone.setCapacity(rs.getString(6));
            phone.setPrice(rs.getInt(7));
            phone.setPdate(rs.getTimestamp(8));
            phone.setPimage(rs.getString(9));
            phone.setPcount(rs.getInt(10));
         }
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
         JdbcUtil.close(rs);
      }
      return phone;
   }

   public List<Phone> selectLike(Connection conn, String target, String keyword) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      ResultSet rs = null;
      Phone phone = null; 
      List<Phone> phones = new ArrayList<Phone>();
      try {
         pstmt = conn.prepareStatement
         ("select * from phone where " +target +" like ?");
         pstmt.setString(1, "%"+keyword+"%");
         rs = pstmt.executeQuery();
         while (rs.next()){
            phone = new Phone(); 
            phone.setPid(rs.getInt(1));
            phone.setPcode(rs.getInt(2));
            phone.setMaker(rs.getString(3));
            phone.setMname(rs.getString(4));
            phone.setCompany(rs.getString(5));
            phone.setCapacity(rs.getString(6));
            phone.setPrice(rs.getInt(7));
            phone.setPdate(rs.getTimestamp(8));
            phone.setPimage(rs.getString(9));
            phone.setPcount(rs.getInt(10));
            phones.add(phone);
         }
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
         JdbcUtil.close(rs);
      }
      return phones;
   }
   
   public void update(Connection conn, Phone phone) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      try {
         pstmt = conn.prepareStatement
         ("update phone set pcode=?,maker=?,mname=?,company=?,capacity=?, price=?, "
               + "   pdate=?, pimage=? where pid=?");
         pstmt.setInt(1, phone.getPcode());
         pstmt.setString(2, phone.getMaker());
         pstmt.setString(3, phone.getMname());
         pstmt.setString(4, phone.getCompany());
         pstmt.setString(5, phone.getCapacity());
         pstmt.setInt(6, phone.getPrice());
         pstmt.setTimestamp(7, new Timestamp(phone.getPdate().getTime()));
         pstmt.setString(8, phone.getPimage());
         pstmt.setInt(9, phone.getPid());
         pstmt.executeUpdate(); 
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
      }
   }
   public void intPcount(Connection conn, int pid, int pcount) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      try {
         pstmt = conn.prepareStatement
         ("update phone set pcount= pcount+? where pid=?");
         pstmt.setInt(1, pcount);
         pstmt.setInt(2, pid);
         pstmt.executeUpdate(); 
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
      }
   }
   public void deleteById(Connection conn, int pid) 
         throws SQLException {
      PreparedStatement pstmt=null;       
      try {
         pstmt = conn.prepareStatement
         ("delete from phone where pid = ?");
         pstmt.setInt(1, pid);
         pstmt.executeUpdate();         
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
      }
   }
   
   public int selectCount(Connection conn) throws SQLException {
      Statement stmt = null; 
      ResultSet rs = null; 
      try {
         stmt = conn.createStatement();
         rs = stmt.executeQuery("select count(*) from phone");
         rs.next();
         return rs.getInt(1);
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(rs);
      }
   }
   
   public List<Phone> selectList(Connection conn) 
         throws SQLException {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Phone> phoneList = null;
      try {
         pstmt = conn.prepareStatement
               ("select * from phone");         
         rs  = pstmt.executeQuery(); 
         phoneList = new ArrayList<Phone>();
         while (rs.next()){
            Phone phone = new Phone();
            phone.setPid(rs.getInt(1));
            phone.setPcode(rs.getInt(2));
            phone.setMaker(rs.getString(3));
            phone.setMname(rs.getString(4));
            phone.setCompany(rs.getString(5));
            phone.setCapacity(rs.getString(6));
            phone.setPrice(rs.getInt(7));
            phone.setPdate(rs.getTimestamp(8));
            phone.setPimage(rs.getString(9));
            phone.setPcount(rs.getInt(10));
            phoneList.add(phone);
         }
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
      }
      return phoneList;
   }
   public List<Phone> selectListcode(Connection conn, int pcode) 
         throws SQLException {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Phone> phoneList = null;
      try {
         pstmt = conn.prepareStatement
               ("select * from phone where pcode=?");
               pstmt.setInt(1, pcode);
         rs  = pstmt.executeQuery(); 
         phoneList = new ArrayList<Phone>();
         while (rs.next()){
            Phone phone = new Phone();
            phone.setPid(rs.getInt(1));
            phone.setPcode(rs.getInt(2));
            phone.setMaker(rs.getString(3));
            phone.setMname(rs.getString(4));
            phone.setCompany(rs.getString(5));
            phone.setCapacity(rs.getString(6));
            phone.setPrice(rs.getInt(7));
            phone.setPdate(rs.getTimestamp(8));
            phone.setPimage(rs.getString(9));
            phone.setPcount(rs.getInt(10));
            phoneList.add(phone);
         }
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
      }
      return phoneList;
   }
   public List<Phone> listByPcount(Connection conn) 
         throws SQLException {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Phone> phoneList = null;
      try {
         pstmt = conn.prepareStatement
               ("select * from phone order by pcount desc");         
         rs  = pstmt.executeQuery(); 
         phoneList = new ArrayList<Phone>();
         while (rs.next()){
            Phone phone = new Phone();
            phone.setPid(rs.getInt(1));
            phone.setPcode(rs.getInt(2));
            phone.setMaker(rs.getString(3));
            phone.setMname(rs.getString(4));
            phone.setCompany(rs.getString(5));
            phone.setCapacity(rs.getString(6));
            phone.setPrice(rs.getInt(7));
            phone.setPdate(rs.getTimestamp(8));
            phone.setPimage(rs.getString(9));
            phone.setPcount(rs.getInt(10));
            phoneList.add(phone);
         }
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
      }
      return phoneList;
   }
   public List<Phone> listByPcountcode(Connection conn,int pcode) 
         throws SQLException {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Phone> phoneList = null;
      try {
         pstmt = conn.prepareStatement
               ("select * from phone where pcode=? order by pcount desc");   
         pstmt.setInt(1, pcode);   
         rs  = pstmt.executeQuery(); 
         phoneList = new ArrayList<Phone>();
         while (rs.next()){
            Phone phone = new Phone();
            phone.setPid(rs.getInt(1));
            phone.setPcode(rs.getInt(2));
            phone.setMaker(rs.getString(3));
            phone.setMname(rs.getString(4));
            phone.setCompany(rs.getString(5));
            phone.setCapacity(rs.getString(6));
            phone.setPrice(rs.getInt(7));
            phone.setPdate(rs.getTimestamp(8));
            phone.setPimage(rs.getString(9));
            phone.setPcount(rs.getInt(10));
            phoneList.add(phone);
         }
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
      }
      return phoneList;
   }
   public List<Phone> listByPdate(Connection conn) 
         throws SQLException {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Phone> phoneList = null;
      try {
         pstmt = conn.prepareStatement
               ("select * from phone order by pdate desc");         
         rs  = pstmt.executeQuery(); 
         phoneList = new ArrayList<Phone>();
         while (rs.next()){
            Phone phone = new Phone();
            phone.setPid(rs.getInt(1));
            phone.setPcode(rs.getInt(2));
            phone.setMaker(rs.getString(3));
            phone.setMname(rs.getString(4));
            phone.setCompany(rs.getString(5));
            phone.setCapacity(rs.getString(6));
            phone.setPrice(rs.getInt(7));
            phone.setPdate(rs.getTimestamp(8));
            phone.setPimage(rs.getString(9));
            phone.setPcount(rs.getInt(10));
            phoneList.add(phone);
         }
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
      }
      return phoneList;
   }
   public List<Phone> listByPdatecode(Connection conn, int pcode) 
         throws SQLException {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Phone> phoneList = null;
      try {
         pstmt = conn.prepareStatement
               ("select * from phone where pcode=? order by pdate desc");   
         pstmt.setInt(1, pcode);   
         rs  = pstmt.executeQuery(); 
         phoneList = new ArrayList<Phone>();
         while (rs.next()){
            Phone phone = new Phone();
            phone.setPid(rs.getInt(1));
            phone.setPcode(rs.getInt(2));
            phone.setMaker(rs.getString(3));
            phone.setMname(rs.getString(4));
            phone.setCompany(rs.getString(5));
            phone.setCapacity(rs.getString(6));
            phone.setPrice(rs.getInt(7));
            phone.setPdate(rs.getTimestamp(8));
            phone.setPimage(rs.getString(9));
            phone.setPcount(rs.getInt(10));
            phoneList.add(phone);
         }
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
      }
      return phoneList;
   }
   public List<Phone> listByMaker(Connection conn) 
         throws SQLException {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Phone> phoneList = null;
      try {
         pstmt = conn.prepareStatement
               ("select * from phone group by maker desc");         
         rs  = pstmt.executeQuery(); 
         phoneList = new ArrayList<Phone>();
         while (rs.next()){
            Phone phone = new Phone();
            phone.setPid(rs.getInt(1));
            phone.setPcode(rs.getInt(2));
            phone.setMaker(rs.getString(3));
            phone.setMname(rs.getString(4));
            phone.setCompany(rs.getString(5));
            phone.setCapacity(rs.getString(6));
            phone.setPrice(rs.getInt(7));
            phone.setPdate(rs.getTimestamp(8));
            phone.setPimage(rs.getString(9));
            phone.setPcount(rs.getInt(10));
            phoneList.add(phone);
         }
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
      }
      return phoneList;
   }
}



















