package Shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Shopping.model.Cart;

	public class CartDao {
		Connection con;
	
		public CartDao(Connection con) {
			this.con = con;
		}

	public List<Cart> getAllCartItemByUserId(int id) {
		List<Cart> p = new ArrayList<Cart>();
		try {
			String query = "select * from cart where id=" + id;
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				Cart cart = new Cart(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5),
						rs.getInt(6), rs.getString(7),rs.getString(8));
				p.add(cart);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;

	}

	public boolean saveCart(Cart cart) {
		boolean flag = false;
		String query = "insert into cart(id,pid,itemname,price,size,colour) values(?,?,?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, cart.getId());
			ps.setInt(2, cart.getPid());
			ps.setString(3, cart.getItemname());
			ps.setInt(4, cart.getPrice());
			ps.setString(5, cart.getSize());
			ps.setString(6,cart.getColour());
			ps.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;

	}

	public boolean getCartItemByidAndSizeAndColour(int id, int pid, String size,String colour) {

		boolean result = false;
		// char c=String.

		try {

			String query = "select count(*) from cart  where id=" + id + " and pid=" + pid + " and size='" + size + "'"+" and colour='"+colour+"'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			if (rs.next()) {

				int count = rs.getInt(1);
				System.out.println("This is the count " + count);
				if (count == 0) {
					result = false;
				} else {
					result = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return result;
	}
	public boolean deleteCartProductById(int cid)
	{ 
		boolean result=false;
		try
		{
			
			String query="Delete from cart where cid="+cid;
			Statement s=con.createStatement();
		    System.out.print("Affacte row in delete" +s.executeUpdate(query));
			result=true;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return result;
		
	}

}
