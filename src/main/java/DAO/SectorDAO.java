package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Information;
import model.Sector;

public class SectorDAO {
	public static boolean add_sector(long sectorid, String sid, String sectorName, int sectorQuota,
			double sectorPoint) {
		long i = 0;
		try {
			Connection conn = DataBaseConnection.getConnection();
			String sql = "insert into Sectors values(?, ?, ?, ?, ?);";
			PreparedStatement pr = conn.prepareStatement(sql);
			pr.setLong(1, sectorid);
			pr.setString(2, sid);
			pr.setString(3, sectorName);
			pr.setInt(4, sectorQuota);
			pr.setDouble(5, sectorPoint);
			i = pr.executeUpdate();
			conn.close();
		} catch (Exception e) {
			System.out.println("Loi ham add_sector tai DAO.SectorDAO");
			e.printStackTrace();
			return false;
		}
		if (i > 0) {
			return true;
		}
		return false;
	}

	public static List<Information> getSectors(String namesector) {
		List<Information> list = new ArrayList<Information>();
		try {
			Connection conn = DataBaseConnection.getConnection();
			String sql = "select s.*, u.lat, u.lng, u.sname from sectors s join universitys u on s.sid=u.sid where s.namesector=?;";
			PreparedStatement pr = conn.prepareStatement(sql);
			pr.setString(1, namesector);
			ResultSet rs = pr.executeQuery();
			while (rs.next()) {
				int sectorid = rs.getInt("idsector");
				String sid = rs.getString("sid");
				String sectorName = rs.getString("namesector");
				int sectorQuota = rs.getInt("quotasector");
				double sectorPoint = rs.getDouble("pointsector");
				double lng = rs.getDouble("lng");
				double lat = rs.getDouble("lat");
				String sname =rs.getString("sname");
				list.add(new Information(sid, lng, lat, sectorid, sectorName, sectorQuota, sectorPoint, sname));
			}
			conn.close();
		} catch (Exception e) {
			System.out.println("Lỗi hàm getSectors tại SectorDAO");
			e.printStackTrace();
		}
		return list;
	}
}
