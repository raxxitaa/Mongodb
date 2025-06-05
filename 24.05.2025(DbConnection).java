package Connection;

import java.sql.*;

public class DbConnection {

	public static void main(String[] args) {
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver"); // To register and insert the required driver and it to be visible in Reference Libraries
			
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/vit","root","Rakesh@123"); // jdbc:database://localhost:portnumber/databasename","username","passsword"
			
			//Creating a Statement -- help to translate the sql query to java and vice-versa
			Statement stmt = con.createStatement();
			
			//to access
			ResultSet rs = stmt.executeQuery("select*from student");
			//to print
			while(rs.next())
				System.out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getInt(3));
			
			//Close the connection
			con.close();
		}
		
		catch(Exception e){
			System.out.println("Sorry for incovience's pls check the credientials");
		}
		
	}

}
