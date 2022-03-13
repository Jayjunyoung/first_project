package my.service;

import java.sql.Connection;
import java.sql.SQLException;

import my.dao.MessageDao;
import my.model.Message;
import my.util.ConnectionProvider;
import my.util.JdbcUtil;

public class WriteMessageService {
	
	public void write(Message message){
		Connection conn = null; 
		try {
			conn = ConnectionProvider.getConnection(); 
			MessageDao dao = new MessageDao(); 
			dao.insert(conn, message);
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
	}

}
