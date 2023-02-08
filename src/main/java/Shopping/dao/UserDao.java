package Shopping.dao;
import java.sql.*;
import Shopping.model.User;
public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}

// method to insert user data
	public boolean saveUser(User user) {
		boolean flag = false;
		try {
			String query = "insert into user(name,email,password,gender)values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getGender());

			ps.executeUpdate();
			flag = true;
			System.out.println(flag);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;
		try {
			// create query
			String query = "Select * from user where email=? and password=?";
			// create Statement
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				System.out.println("login sucess");
				user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));

				/* user.setDateTime(rs.getTimestamp("rdate")); */
				user.setProfile(rs.getString("uprofile"));

			} else {
				System.out.println("login again");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;

	}

	public boolean updateUser(User user) {
		boolean f = false;

		try {
			String query = "update user set name=?,email=?,password=?,uprofile=? where id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getProfile());
			ps.setInt(5, user.getId());
			ps.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	public User getUserById(int id)
	{
		User user = null;
		try {
			// create query
			String query = "Select * from user where id=?";
			// create Statement
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
		
	}
}
