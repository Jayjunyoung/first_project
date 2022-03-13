package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Book;
import my.util.JdbcUtil;

public class BookDao {
	
	public void insert(Connection conn, Book book) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into book (bookName,author,price,publishDate)"
					+ " values(?,?,?,?)");
			pstmt.setString(1, book.getBookName());
			pstmt.setString(2, book.getAuthor());
			pstmt.setInt(3, book.getPrice());
			pstmt.setTimestamp(4, 
					new Timestamp(book.getPublishDate().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Book selectById(Connection conn, int bookId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Book book = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from book where bookId = ?");
			pstmt.setInt(1, bookId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				book = new Book(); 
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getInt(4));
				book.setPublishDate(rs.getTimestamp(5));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return book;
	}
	
	public List<Book> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Book book = null; 
		List<Book> books = new ArrayList<Book>();
		try {
			pstmt = conn.prepareStatement
			("select * from book where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				book = new Book(); 
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getInt(4));
				book.setPublishDate(rs.getTimestamp(5));
				books.add(book);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return books;
	}
	
	public void update(Connection conn, Book book) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update book set bookname=?,author=?,price=?, "
					+ "   publishdate=? where bookId=?");
			pstmt.setString(1, book.getBookName());
			pstmt.setString(2, book.getAuthor());
			pstmt.setInt(3, book.getPrice());
			pstmt.setTimestamp(4, new Timestamp(book.getPublishDate().getTime()));
			pstmt.setInt(5, book.getBookId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, int bookId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from book where bookId = ?");
			pstmt.setInt(1, bookId);
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
			rs = stmt.executeQuery("select count(*) from book");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Book> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Book> bookList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from book ");			
			rs  = pstmt.executeQuery(); 
			bookList = new ArrayList<Book>();
			while (rs.next()){
				Book book = new Book();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getInt(4));
				book.setPublishDate(rs.getTimestamp(5));
				bookList.add(book);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return bookList;
	}
}




















