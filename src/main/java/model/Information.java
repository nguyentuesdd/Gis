package model;

public class Information {
	private String sid;
	private double lng;
	private double lat;
	private int sectorid;
	private String sectorName;
	private int sectorQuota;
	private double sectorPoint;
	private String sname;
	public Information(String sid, double lng, double lat, int sectorid, String sectorName, int sectorQuota,
			double sectorPoint, String sname) {
		this.sid = sid;
		this.lng = lng;
		this.lat = lat;
		this.sectorid = sectorid;
		this.sectorName = sectorName;
		this.sectorQuota = sectorQuota;
		this.sectorPoint = sectorPoint;
		this.sname = sname;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public int getSectorid() {
		return sectorid;
	}
	public void setSectorid(int sectorid) {
		this.sectorid = sectorid;
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
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	
	
}
