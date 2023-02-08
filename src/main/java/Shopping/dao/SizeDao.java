package Shopping.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SizeDao {
	private Connection con;

	public SizeDao(Connection con) {
		this.con = con;
	}

	public List<String> getSizebyPid(int pid) {
		List<String> size = new ArrayList<String>();
		try {
			String query = "select distinct(size) from sizes where pid=" + pid + " order by size desc";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {

				size.add(rs.getString(1));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return size;
	}
	
	public List<String> getColorbyPid(int pid) {
		List<String> size = new ArrayList<String>();
		try {
			String query = "select distinct(colour) from sizes where pid=" + pid + " order by colour desc";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {

				size.add(rs.getString(1));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return size;
	}

}
