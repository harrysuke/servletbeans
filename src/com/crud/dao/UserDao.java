package com.crud.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import com.crud.bean.User;

public class UserDao {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");;
		}catch(SQLException e) {
			System.out.println(e);
		}catch(ClassNotFoundException e) {
			System.out.println(e);
		}
		return con;
	}
	
	public static User login(String email, String password, HttpSession session) {
		try {
			Connection con = getConnection();
			String sql = "SELECT * FROM register WHERE email=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			User u = null;
			if(rs.next()) {
				u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setEmail(rs.getString("email"));
				u.setSex(rs.getString("sex"));
				u.setCountry(rs.getString("country"));
				
				if(session.isNew()) {
					session.setAttribute("userIDKey", rs.getString("id"));
					session.setAttribute("name", rs.getString("name"));
					session.setAttribute("password", rs.getString("password"));
					session.setAttribute("email", rs.getString("email"));
					session.setAttribute("sex", rs.getString("sex"));
					session.setAttribute("country", rs.getString("country"));
				}
			}
			return u;
		}catch(Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public static void logout(HttpSession session) {
		session.removeAttribute("UserIDKey");
		session.removeAttribute("name");
		session.removeAttribute("password");
		session.removeAttribute("email");
		session.removeAttribute("sex");
		session.removeAttribute("country");
	}
	
	public static int save(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			String sql = "INSERT INTO register (name, password, email, sex, country) VALUES (?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getSex());
			ps.setString(5, u.getCountry());
			status = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int update(User u) {
		int status = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = getConnection();
			String sql = "UPDATE register SET name=?, password=?, email=?, sex=?, country=? WHERE id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getSex());
			ps.setString(5, u.getCountry());
			ps.setInt(6, u.getId());
			status = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(con != null) {
					con.close();
				}
			}catch(SQLException e) {
				System.out.println(e);
			}
		}
		return status;
	}
	
	public static int delete(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			String sql = "DELETE FROM register WHERE id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, u.getId());
			status = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static List<User> searchUsers(String searchTerm) {
		Connection con = null;
		PreparedStatement  ps = null;
		ResultSet rs = null;
		List<User> userList = new ArrayList<>();
		try {
			con = getConnection();
			String sql = "SELECT * FROM register WHERE name LIKE ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+searchTerm+"%");
			rs = ps.executeQuery();
			while(rs.next()) {
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setEmail(rs.getString("email"));
				u.setSex(rs.getString("sex"));
				u.setCountry(rs.getString("country"));
				userList.add(u);
			}
		}catch(SQLException e) {
			System.out.println(e);
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
				if(con != null) {
					con.close();
				}
			}catch(SQLException e) {
				System.out.println(e);
			}
		}
		return userList;
	}
	
	public static List<User> getAllRecords(){
		List<User> list = new ArrayList<User>();
		try {
			Connection con = getConnection();
			String sql = "SELECT * FROM register";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setEmail(rs.getString("email"));
				u.setSex(rs.getString("sex"));
				u.setCountry(rs.getString("Country"));
				list.add(u);
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public static User getRecordById(int id) {
		User u = null;
		try {
			Connection con = getConnection();
			String sql = "SELECT * FROM register WHERE id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setEmail(rs.getString("email"));
				u.setSex(rs.getString("sex"));
				u.setCountry(rs.getString("country"));
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return u;
	}
	
}