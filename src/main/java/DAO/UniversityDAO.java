package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UniversityDAO {
	public static void addUniversity(int id, String sid, String sname, String saddress, double benchmark, int quota,
			String website, double lng, double lat) {
		try {
			Connection conn = DataBaseConnection.getConnection();
			String sql = "select st_add_universitys(?, ?, ?, ?, ?, ?, ?, ?, ?);";
			PreparedStatement pr = conn.prepareStatement(sql);
			pr.setInt(1, id);
			pr.setString(2, sid);
			pr.setString(3, sname);
			pr.setString(4, saddress);
			pr.setDouble(5, benchmark);
			pr.setInt(6, quota);
			pr.setString(7, website);
			pr.setDouble(8, lng);
			pr.setDouble(9, lat);
			pr.executeQuery();
			conn.close();
		} catch (Exception e) {
			System.err.println("Loi ham addUniversity tai DAO.UniversityDAO");
			e.printStackTrace();
		}
	}
}
