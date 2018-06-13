package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class SectorDAO {
	public static boolean add_sector(long sectorid, String sid, String sectorName, int sectorQuota, double sectorPoint){
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
		if(i > 0){
			return true;
		}
		return false;
	}
}
