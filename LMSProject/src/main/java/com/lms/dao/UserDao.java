package com.lms.dao;



import com.lms.model.User;
import java.sql.*;

public class UserDao {

	public User findByUsernamePasswordAndRole(String username, String password, String role) {
	    User user = null;
	    String sql = "SELECT * FROM users WHERE username=? AND password=? AND role=?";
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setString(1, username);
	        ps.setString(2, password);
	        ps.setString(3, role);

	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            user = new User(rs.getInt("id"), rs.getString("username"),
	                    rs.getString("password"), rs.getString("role"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return user;
	}


    // Other methods like createUser, findById, updatePassword etc.
}

