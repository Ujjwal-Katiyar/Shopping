package Shopping.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	public static Connection con;
	public static Connection getConnection()
	{
		
		
		try
		{
		if(con==null)
		{	
			//driver class load
			Class.forName("com.mysql.cj.jdbc.Driver");
			//create the connection
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping","root","root1");
			System.out.println(con);
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return con;
	}

}
