package dao.impl;

import dao.IUserDao;
import entity.IndexUser;
import utils.DBUtil;
import utils.DBUtil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements IUserDao {

	public boolean login(IndexUser login) {
		ResultSet rs = null;
		boolean flag = false;
		String sql = "select * from user where user=? and pwd =?";
		Object[] params = { login.getName(), login.getPwd() };
		rs = DBUtil.executeQuery(sql, params);
		try {
			if (rs.next()) {
				flag = true;
			}
			return flag;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public List<IndexUser> All(IndexUser login) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<IndexUser> users = new ArrayList<>();
		IndexUser user = null;
		try {
			String sql = "select * from user";
			Object[] params = { };
			rs = DBUtil.executeQuery(sql, params);
			while (rs.next()) {
				String name = rs.getString("user");
				String pwd = rs.getString("pwd");
				String email = rs.getString("email");
				user = new IndexUser(name, pwd, email);
				users.add(user);
			}
			return users;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			DBUtil.closeAll(rs, pstmt, DBUtil.connection);
		}
	}

	public boolean regist(IndexUser regist) {
		String sql = "insert into user(user,pwd,email) value(?,?,?)";
		Object[] params = { regist.getName(), regist.getPwd(), regist.getEmail() };
		return DBUtil.executeUpdate(sql, params);
	}

	public boolean update(IndexUser user) {
		String sql = "update user set sex=?,email=? where user=?";
		Object[] params = { user.getSex(), user.getEmail(), user.getName() };
		return DBUtil.executeUpdate(sql, params);
	}

	public IndexUser UserByName(String name) {
		ResultSet rs = null;
		IndexUser user = null;
		String sql = "select * from user where user=?";
		Object[] params = { name };
		rs = DBUtil.executeQuery(sql, params);
		try {
			if (rs.next()) {
				String pwd = rs.getString("pwd");
				String type = rs.getString("s_type");
				String email = rs.getString("email");
				int sex = rs.getInt("sex");
				user = new IndexUser(name, pwd, email, type, sex);
			}
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean isExit(String name) {
		ResultSet rs = null;
		boolean flag = false;
		String sql = "select * from user where user=?";
		Object[] params = { name };
		rs = DBUtil.executeQuery(sql, params);
		try {
			if (rs.next()) {
				flag = true;
			}
			return flag;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}

}