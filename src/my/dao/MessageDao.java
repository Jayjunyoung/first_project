package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Message;
import my.util.JdbcUtil;

public class MessageDao {
	
	public void insert(Connection conn, Message message) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into message (guestname,password,message,registertime)"
					+ " values(?,?,?,?)");
			pstmt.setString(1, message.getGuestName());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());
			pstmt.setTimestamp(4, 
					new Timestamp(message.getRegisterTime().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Message selectById(Connection conn, int messageId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Message message = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from message where messageId = ?");
			pstmt.setInt(1, messageId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				message = new Message(); 
				message.setMessageId(rs.getInt(1));
				message.setGuestName(rs.getString(2));
				message.setPassword(rs.getString(3));
				message.setMessage(rs.getString(4));
				message.setRegisterTime(rs.getTimestamp(5));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return message;
	}
	
	public void update(Connection conn, Message message) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update message set guestname=?,password=?,message=?, "
					+ "   registertime=? where messageId=?");
			pstmt.setString(1, message.getGuestName());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());
			pstmt.setTimestamp(4, new Timestamp(message.getRegisterTime().getTime()));
			pstmt.setInt(5, message.getMessageId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, int messageId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from message where messageId = ?");
			pstmt.setInt(1, messageId);
			pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from message");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Message> selectList(Connection conn, int firstRow, int endRow) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Message> messageList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from message limit ?,?");
			pstmt.setInt(1, firstRow-1);
			pstmt.setInt(2, endRow);
			rs  = pstmt.executeQuery(); 
			messageList = new ArrayList<Message>();
			while (rs.next()){
				Message message = new Message();
				message.setMessageId(rs.getInt(1));
				message.setGuestName(rs.getString(2));
				message.setPassword(rs.getString(3));
				message.setMessage(rs.getString(4));
				message.setRegisterTime(rs.getTimestamp(5));
				messageList.add(message);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return messageList;
	}
}




















