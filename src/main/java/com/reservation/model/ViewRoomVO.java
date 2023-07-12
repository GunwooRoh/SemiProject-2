package com.reservation.model;

public class ViewRoomVO {
	
	private String hotelName;
	private int typeNo;
	private String room_type;
	private int hotelNo;
	private int total_room;
	private int price_per_day;
	private int bed;
	private int wifi;
	private int kitchen;
	private int ac;
	
	
	
	public ViewRoomVO() {
		super();
	}

	public ViewRoomVO(String hotelName, int typeNo, String room_type, int hotelNo, int total_room, int price_per_day,
			int bed, int wifi, int kitchen, int ac) {
		super();
		this.hotelName = hotelName;
		this.typeNo = typeNo;
		this.room_type = room_type;
		this.hotelNo = hotelNo;
		this.total_room = total_room;
		this.price_per_day = price_per_day;
		this.bed = bed;
		this.wifi = wifi;
		this.kitchen = kitchen;
		this.ac = ac;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public int getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public int getHotelNo() {
		return hotelNo;
	}

	public void setHotelNo(int hotelNo) {
		this.hotelNo = hotelNo;
	}

	public int getTotal_room() {
		return total_room;
	}

	public void setTotal_room(int total_room) {
		this.total_room = total_room;
	}

	public int getPrice_per_day() {
		return price_per_day;
	}

	public void setPrice_per_day(int price_per_day) {
		this.price_per_day = price_per_day;
	}

	public int getBed() {
		return bed;
	}

	public void setBed(int bed) {
		this.bed = bed;
	}

	public int getWifi() {
		return wifi;
	}

	public void setWifi(int wifi) {
		this.wifi = wifi;
	}

	public int getKitchen() {
		return kitchen;
	}

	public void setKitchen(int kitchen) {
		this.kitchen = kitchen;
	}

	public int getAc() {
		return ac;
	}

	public void setAc(int ac) {
		this.ac = ac;
	}

	@Override
	public String toString() {
		return "viewRoomVo [hotelName=" + hotelName + ", typeNo=" + typeNo + ", room_type=" + room_type + ", hotelNo="
				+ hotelNo + ", total_room=" + total_room + ", price_per_day=" + price_per_day + ", bed=" + bed
				+ ", wifi=" + wifi + ", kitchen=" + kitchen + ", ac=" + ac + "]";
	}
	
	

}
