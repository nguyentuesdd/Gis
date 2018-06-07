package model;

/**
 * 
 * @author nguyen tu
 *
 */
public class University {
	private int id;
	private String sid;
	private String sname;
	private String saddress;
	private double benchmark;
	private int quota;
	private String website;
	private double lng;
	private double lat;

	/**
	 * Constructor
	 * @param id Số thứ tự
	 * @param sid Mã trường
	 * @param sname Tên trường
	 * @param saddress Địa chỉ trường
	 * @param benchmark Điểm chuẩn
	 * @param quota Tiêu chí
	 * @param website tên trang web
	 * @param lng Tọa độ x
	 * @param lat Tọa độ y
	 */
	public University(int id, String sid, String sname, String saddress, double benchmark, int quota, String website,
			double lng, double lat) {
		this.id = id;
		this.sid = sid;
		this.sname = sname;
		this.saddress = saddress;
		this.benchmark = benchmark;
		this.quota = quota;
		this.website = website;
		this.lng = lng;
		this.lat = lat;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSaddress() {
		return saddress;
	}

	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}

	public double getBenchmark() {
		return benchmark;
	}

	public void setBenchmark(double benchmark) {
		this.benchmark = benchmark;
	}

	public int getQuota() {
		return quota;
	}

	public void setQuota(int quota) {
		this.quota = quota;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
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
}
