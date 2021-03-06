package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.University;

public class UniversityDAO {
	public static boolean addUniversity(int id, String sid, String sname, String saddress, double benchmark, int quota,
			String website, double lng, double lat) {
		int i = 0;
		try {
			Connection conn = DataBaseConnection.getConnection();
			String sql = "insert into universitys values(?, ?, ?, ?, ?, ?, ?, ?, ?);";
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
			i = pr.executeUpdate();
			conn.close();
		} catch (Exception e) {
			System.err.println("Loi ham addUniversity tai DAO.UniversityDAO");
			e.printStackTrace();
			return false;
		}
		if (i > 0) {
			return true;
		}
		return false;
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

	public static List<University> getUniversitiesByBenchMark(double bm) {
		List<University> list = new ArrayList<University>();
		try {
			Connection conn = DataBaseConnection.getConnectionAzure();
			String sql = "select * from universitys where benchmark <= ?;";
			PreparedStatement pr = conn.prepareStatement(sql);
			
			pr.setDouble(1, bm);
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
			e.printStackTrace();
			return list;
		}
	}

	public static List<University> getUniversitiesByQuota(int quotaIn) {
		List<University> list = new ArrayList<University>();
		try {
			Connection conn = DataBaseConnection.getConnection();
			String sql = "select * from universitys where quota <= ?";
			PreparedStatement pr = conn.prepareStatement(sql);
			pr.setInt(1, quotaIn);
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
			conn.close();
			return list;
		} catch (Exception e) {
			System.out.println("Loi ham getUniversitiesByQuota tai DAO.UniversityDAO");
			e.printStackTrace();
			return list;
		}

	}

	public static double distanceBetween2Points(double la1, double lo1, double la2, double lo2) {
		double R = 6371e3;
		double dLat = (la2 - la1) * (Math.PI / 180);
		double dLon = (lo2 - lo1) * (Math.PI / 180);
		double la1ToRad = la1 * (Math.PI / 180);
		double la2ToRad = la2 * (Math.PI / 180);
		double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
				+ Math.cos(la1ToRad) * Math.cos(la2ToRad) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
		double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
		double d = R * c;
		return d;
	}
}
