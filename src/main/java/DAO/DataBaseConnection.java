package DAO;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBaseConnection {
	public static Connection getConnection() {
		Connection connection = null;
		/*String driver = "org.postgresql.Driver";
		String url = "jdbc:postgresql://localhost:5432/finaltest";
		String user = "postgres";
		String pass = "123456";*/
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433;databaseName=finaltest";
		String user = "sa";
		String pass = "123456";
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			System.err.println("DAO: " + e);
		}
		return connection;
	}
	public static Connection getConnectionAzure() {
		Connection connection = null;
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://projectmid.database.windows.net:1433;database=NotiApp";
		String user = "nguyentu@projectmid";
		String pass = "Microsoft24";
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			System.err.println("DAO: " + e);
		}
		return connection;
	}

	public static void main(String[] args) {
		Connection connection = DataBaseConnection.getConnectionAzure();
		if (connection != null) {
			System.out.println("Kết nối database thành công");
		} else {
			System.out.println("Kết nối database thất bại");
		}
	}
}
