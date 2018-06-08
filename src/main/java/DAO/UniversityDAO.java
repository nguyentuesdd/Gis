package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.University;

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

	public static List<University> getAllUniversities() {
		List<University> list = new ArrayList<University>();
		try {
			Connection conn = DataBaseConnection.getConnection();
			String sql = "select * from universitys";
			PreparedStatement pr = conn.prepareStatement(sql);
			ResultSet rs = pr.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String sid = rs.getString("sid");
				String sname = rs.getString("sname");
				String saddress = rs.getString("saddress");
				double benchmark = rs.getDouble("benchmark");
				int quota = rs.getInt("quota");
				String website = rs.getString("website");
				double lng = rs.getDouble("lng");
				double lat = rs.getDouble("lat");
				list.add(new University(id, sid, sname, saddress, benchmark, quota, website, lng, lat));
			}
			return list;
		} catch (Exception e) {
			System.out.println("Loi ham getAllUniversities tai DAO.UniversityDAO");
			e.printStackTrace();
			return list;
		}
	}
}
