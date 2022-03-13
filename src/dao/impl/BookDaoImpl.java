package dao.impl;

import dao.IBookDao;
import entity.IndexBook;
import utils.DBUtil;
import utils.DBUtil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDaoImpl implements IBookDao {
	public List<IndexBook> SearchByName(String bname) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<IndexBook> books = new ArrayList<>();
		IndexBook book = null;
		try {
			String sql = "select * from book where b_name like \"%\"?\"%\" ";
			Object[] params = { bname };
			rs = DBUtil.executeQuery(sql, params);
			while (rs.next()) {
				String name = rs.getString("b_name");
				String author = rs.getString("author");
				String price = rs.getString("b_price");
				String path = rs.getString("img");
				book = new IndexBook(name, author, price, path);
				books.add(book);
			}
			return books;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			DBUtil.closeAll(rs, pstmt, DBUtil.connection);
		}
	}
	
	public List<IndexBook> SearchByAuthor(String bauthor) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<IndexBook> books = new ArrayList<>();
		IndexBook book = null;
		try {
			String sql = "select * from book where author like \"%\"?\"%\" ";
			Object[] params = { bauthor };
			rs = DBUtil.executeQuery(sql, params);
			while (rs.next()) {
				String name = rs.getString("b_name");
				String author = rs.getString("author");
				String price = rs.getString("b_price");
				String path = rs.getString("img");
				book = new IndexBook(name, author, price, path);
				books.add(book);
			}
			return books;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			DBUtil.closeAll(rs, pstmt, DBUtil.connection);
		}
	}

	public List<IndexBook> SearchByType(String type) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<IndexBook> books = new ArrayList<>();
		IndexBook book = null;
		try {
			String sql = "select * from book where type=? ";
			Object[] params = { type };
			rs = DBUtil.executeQuery(sql, params);
			while (rs.next()) {
				Integer id = rs.getInt("b_id");
				String name = rs.getString("b_name");
				String author = rs.getString("author");
				String price = rs.getString("b_price");
				String path = rs.getString("img");
				book = new IndexBook(id, name, price, author, path);
				books.add(book);
			}
			return books;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			DBUtil.closeAll(rs, pstmt, DBUtil.connection);
		}
	}
}
