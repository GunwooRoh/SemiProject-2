package com.facilities.model;

public class facilitiesVO {
	private int hotelNo;
	private int conv_store;
	private int laundry_room;
	private int accompany_pet;
	private int parking;
	private int valet_parking;
	private int breakfast;
	private int pool;
	private int lounge_bar;
	
	public facilitiesVO(int hotelNo, int conv_store, int laundry_room, int accompany_pet, int parking,
			int valet_parking, int breakfast, int pool, int lounge_bar) {
		super();
		
		this.hotelNo = hotelNo;
		this.conv_store = conv_store;
		this.laundry_room = laundry_room;
		this.accompany_pet = accompany_pet;
		this.parking = parking;
		this.valet_parking = valet_parking;
		this.breakfast = breakfast;
		this.pool = pool;
		this.lounge_bar = lounge_bar;
	}
	
	public facilitiesVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getHotelNo() {
		return hotelNo;
	}
	public void setHotelNo(int hotelNo) {
		this.hotelNo = hotelNo;
	}
	public int getConv_store() {
		return conv_store;
	}
	public void setConv_store(int conv_store) {
		this.conv_store = conv_store;
	}
	public int getLaundry_room() {
		return laundry_room;
	}
	public void setLaundry_room(int laundry_room) {
		this.laundry_room = laundry_room;
	}
	public int getAccompany_pet() {
		return accompany_pet;
	}
	public void setAccompany_pet(int accompany_pet) {
		this.accompany_pet = accompany_pet;
	}
	public int getParking() {
		return parking;
	}
	public void setParking(int parking) {
		this.parking = parking;
	}
	public int getValet_parking() {
		return valet_parking;
	}
	public void setValet_parking(int valet_parking) {
		this.valet_parking = valet_parking;
	}
	public int getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(int breakfast) {
		this.breakfast = breakfast;
	}
	public int getPool() {
		return pool;
	}
	public void setPool(int pool) {
		this.pool = pool;
	}
	public int getLounge_bar() {
		return lounge_bar;
	}
	public void setLounge_bar(int lounge_bar) {
		this.lounge_bar = lounge_bar;
	}
}
