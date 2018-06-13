package model;

public class Sector {
	private int sectorid;
	private String sid;
	private String sectorName;
	private int sectorQuota;
	private double sectorPoint;

	public Sector(int sectorid, String sid, String sectorName, int sectorQuota, double sectorPoint) {
		this.sectorid = sectorid;
		this.sid = sid;
		this.sectorName = sectorName;
		this.sectorQuota = sectorQuota;
		this.sectorPoint = sectorPoint;
	}

	public int getSectorid() {
		return sectorid;
	}

	public void setSectorid(int sectorid) {
		this.sectorid = sectorid;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSectorName() {
		return sectorName;
	}

	public void setSectorName(String sectorName) {
		this.sectorName = sectorName;
	}

	public int getSectorQuota() {
		return sectorQuota;
	}

	public void setSectorQuota(int sectorQuota) {
		this.sectorQuota = sectorQuota;
	}

	public double getSectorPoint() {
		return sectorPoint;
	}

	public void setSectorPoint(double sectorPoint) {
		this.sectorPoint = sectorPoint;
	}
}
