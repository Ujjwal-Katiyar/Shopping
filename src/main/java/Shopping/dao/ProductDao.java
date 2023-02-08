package Shopping.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Shopping.model.Categories;
import Shopping.model.Product;


public class ProductDao {
	Connection con;

	public ProductDao(Connection con) {
		this.con = con;
	}

	public List<Product> getAllProduct() {
		List<Product> p = new ArrayList<Product>();
		try {
			String query = "select * from product";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getInt(5));
				p.add(product);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}

	public List<Categories> getAllCategories() {
		List<Categories> p = new ArrayList<Categories>();
		try {
			String query = "select * from categories";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				Categories categories = new Categories(rs.getInt(1), rs.getString(2));
				p.add(categories);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}

	public Product getProductById(int pid) {
		Product product = null;
		try {
			// creat query
			String query = "Select * from product where pid=?";
			// cerate Statement
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, pid);
			
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return product;
	}

}
