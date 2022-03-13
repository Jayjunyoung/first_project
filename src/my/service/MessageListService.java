package my.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import my.util.*; 
import my.model.*; 
import my.dao.MessageDao;


public class MessageListService {
	private final int messageCountPerPage = 3; 
	
	public MessageListView getMessageList(int pageNumber){
		Connection conn = null; 
		List<Message> list = null; 
		int firstRow = 0; 
		int endRow = 0; 
		int messageTotalCount = 0;
		try {
			conn = ConnectionProvider.getConnection(); 
			MessageDao dao = new MessageDao(); 
			messageTotalCount = dao.selectCount(conn); 
			if (messageTotalCount >0){
				firstRow = (pageNumber -1)*messageCountPerPage +1;
				endRow = firstRow + messageCountPerPage -1;
				list = dao.selectList(conn, firstRow, endRow);
			} else {
				pageNumber = 0;
				list = null;
			}
		} catch (SQLException e) { 
			e.printStackTrace(); 
		} finally {
			JdbcUtil.close(conn);
		}
		return new MessageListView(messageTotalCount, pageNumber,
				list, messageCountPerPage, firstRow, endRow);
	}

}








