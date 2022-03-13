package utils;

import java.sql.*;

public class DBUtil {
	static String URL = "jdbc:mysql://localhost:3306/bookshop?serverTimezone = UTC";
	static String USERNAME = "root";
	static String PWD = "123456";
	public static Connection connection = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null ; 

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(URL, USERNAME, PWD);
	}

	public static PreparedStatement createPreParedStatement(String sql, Object[] params)
			throws ClassNotFoundException, SQLException {
		pstmt = getConnection().prepareStatement(sql);
		if (params != null) {
			for (int i = 0; i < params.length; i++) {
				pstmt.setObject(i + 1, params[i]);
			}
		}
		return pstmt;
	}

	public static void closeAll(ResultSet rs, Statement stmt, Connection connection) {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (connection != null)
				connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 增删改
	public static boolean executeUpdate(String sql, Object[] params) {
		try {
			pstmt = createPreParedStatement(sql, params);
			int count = pstmt.executeUpdate();
			if (count > 0)
				return true;
			else
				return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			closeAll(null, pstmt, connection);
		}
	}

	// 查询
	public static ResultSet executeQuery(String sql, Object[] params) {
		// select xxx from xx where name=? or id=?
		try {
			pstmt = createPreParedStatement(sql, params);
			rs = pstmt.executeQuery();
			return rs;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
