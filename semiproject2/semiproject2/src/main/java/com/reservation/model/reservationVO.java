package com.reservation.model;

public class reservationVO {
	private int reCode;
	private int accNo;
	private int hotelNo;
	private int booked_room_count;
	
	
	
	public reservationVO(int reCode, int accNo, int hotelNo, int booked_room_count) {
		super();
		this.reCode = reCode;
		this.accNo = accNo;
		this.hotelNo = hotelNo;
		this.booked_room_count = booked_room_count;
	}
	
	public reservationVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getReCode() {
		return reCode;
	}
	public void setReCode(int reCode) {
		this.reCode = reCode;
	}
	public int getAccNo() {
		return accNo;
	}
	public void setAccNo(int accNo) {
		this.accNo = accNo;
	}
	public int getHotelNo() {
		return hotelNo;
	}
	public void setHotelNo(int hotelNo) {
		this.hotelNo = hotelNo;
	}
	public int getBooked_room_count() {
		return booked_room_count;
	}
	public void setBooked_room_count(int booked_room_count) {
		this.booked_room_count = booked_room_count;
	}
	
}
