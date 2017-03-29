package exercises;

import java.io.*;
/*
 * JDBC_Tester.java
 * Created on March 28, 2017, 8:00 PM 
 * Purpose: Connect to a database using the Oracle Thin driver
 */
import java.sql.*;
public class JDBC_Tester
{
		static Connection conn 	=	null;
		static Statement stmt = null;
		static String URL 	= 	"jdbc:oracle:thin:@127.0.0.1:1521:XE";
		static String user	=	"projects";
		static String password = "projects";
		static BufferedReader br = new BufferedReader (new InputStreamReader(System.in));
		static String option = "1";
		static final String tabw3 = "\t\t\t";
		static final String tabw2 = "\t\t";
		static final String tabw4 = "\t\t\t\t";
		
		/** Create new instance **/ 
		public JDBC_Tester () {}
	public static void main(String[] args) throws SQLException, IOException
	{
		/* Register the driver with the class manager */
		try { 
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}
		catch (ClassNotFoundException e) {
			System.err.println(e.getMessage());
		}
		/* While loop to allow for user input until X is entered */
		while (!option.equalsIgnoreCase("X")) {
			System.out.println("Want to do Q1 (1) or Q2 (2) or (X) exit: ");
			option = br.readLine();
			System.out.println("");
			/* Open and close the connection, performing all necessary statement executions. */
			try {
				conn = DriverManager.getConnection(URL,user,password);
				conn.clearWarnings();
				System.out.println("Connection opened for driver ===>Oracle 11XE");
				if (option.equalsIgnoreCase("1")) {
					stmt = conn.createStatement();
					ResultSet rs1 = stmt.executeQuery("select * from VQ1");
					System.out.println("Lab 10 - Ryker Munn");
					System.out.println("Order" + tabw2 + "Product" + tabw4+ "Price");
					System.out.println("=====" + tabw2 + "=======" + tabw4+ "=====");
					while (rs1.next()) {
						System.out.println(rs1.getString("productIDC") + "\t " + rs1.getString("productNameC") + "\t  " + rs1.getString("unitPriceC"));
					}
					rs1.close();
				}
				if (option.equalsIgnoreCase("2")) {
					stmt = conn.createStatement();
					ResultSet rs1 = stmt.executeQuery("select * from VQ2");
					System.out.println("Lab 10 - Ryker Munn");
					System.out.println("Order" + tabw2 + "Order Date" + tabw2+ "Ship Date" + tabw2 + "Company");
					System.out.println("=====" + tabw2 + "==========" + tabw2+ "=========" + tabw2 + "=======");
					while (rs1.next()) {
						System.out.println(rs1.getString("ORDERID") + "\t "  + rs1.getString("OrderDate") + "\t "  + rs1.getString("ShippedDateOut") + "\t "  + rs1.getString("Company"));
					}
					rs1.close();
				}
				if (option.equalsIgnoreCase("X")) {
					break;
				}
			}//end try
			catch (SQLException e) {
				System.err.println(e.getMessage());
			} // end catch
			finally {
				if (!conn.isClosed())
					conn.close();
				System.out.println("Connection successfully closed.");
			}// end finally
		}//end while 

	} //end main

} // end class
