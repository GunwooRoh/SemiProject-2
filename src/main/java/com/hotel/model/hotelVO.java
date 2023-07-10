package com.hotel.model; 

public class hotelVO {
	private int hotelNo;
	private String hotelName;
	public double longitude;
	public double latitude;
	private String address;
	private int hotelGrade;
	private String hotelDetail;
	private int adminNo;
	private String image;
	
	
	public hotelVO() {
		super();
	}
	
	public hotelVO(int hotelNo, String hotelName, double longitude, double latitude, String address, int hotelGrade, String hotelDetail, int adminNo, String image) {
		super();
		this.hotelNo = hotelNo;
		this.hotelName = hotelName;
		this.longitude = longitude;
		this.latitude = latitude;
		this.address = address;
		this.hotelGrade = hotelGrade;
		this.hotelDetail = hotelDetail;
		this.adminNo = adminNo;
		this.image = image;
	}
	
	public int getHotelNo() {
		return hotelNo;
	}

	public void setHotelNo(int hotelNo) {
		this.hotelNo = hotelNo;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getHotelGrade() {
		return hotelGrade;
	}

	public void setHotelGrade(int hotelGrade) {
		this.hotelGrade = hotelGrade;
	}

	public String getHotelDetail() {
		return hotelDetail;
	}

	public void setHotelDetail(String hotelDetail) {
		this.hotelDetail = hotelDetail;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "hotelVO [hotelNo=" + hotelNo + ", hotelName=" + hotelName + ", longitude=" + longitude + ", latitude="
				+ latitude + ", address=" + address + ", hotelGrade=" + hotelGrade + ", hotelDetail=" + hotelDetail
				+ ", adminNo=" + adminNo + ", image=" + image + ", getHotelNo()=" + getHotelNo() + ", getHotelName()="
				+ getHotelName() + ", getLongitude()=" + getLongitude() + ", getLatitude()=" + getLatitude()
				+ ", getAddress()=" + getAddress() + ", getHotelGrade()=" + getHotelGrade() + ", getHotelDetail()="
				+ getHotelDetail() + ", getAdminNo()=" + getAdminNo() + ", getImage()=" + getImage() + "]";
	}

	
	
}
