package com.reservation_detail.model;

import java.sql.Timestamp;

public class reservation_detailVO {
	private int reDetailNo;
	private int reCode;
	private String room_type;
	private int people_num;
	private Timestamp check_In_Date;
	private Timestamp check_Out_Date;
	
	public reservation_detailVO() {
		super();
	}
	
	
	public reservation_detailVO(int reDetailNo, int reCode, String room_type, int people_num, Timestamp check_In_Date,
			Timestamp check_Out_Date) {
		super();
		this.reDetailNo = reDetailNo;
		this.reCode = reCode;
		this.room_type = room_type;
		this.people_num = people_num;
		this.check_In_Date = check_In_Date;
		this.check_Out_Date = check_Out_Date;
	}


	public int getReDetailNo() {
		return reDetailNo;
	}
	public void setReDetailNo(int reDetailNo) {
		this.reDetailNo = reDetailNo;
	}
	public int getReCode() {
		return reCode;
	}
	public void setReCode(int reCode) {
		this.reCode = reCode;
	}
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public int getPeople_num() {
		return people_num;
	}
	public void setPeople_num(int people_num) {
		this.people_num = people_num;
	}
	public Timestamp getCheck_In_Date() {
		return check_In_Date;
	}
	public void setCheck_In_Date(Timestamp check_In_Date) {
		this.check_In_Date = check_In_Date;
	}
	public Timestamp getCheck_Out_Date() {
		return check_Out_Date;
	}
	public void setCheck_Out_Date(Timestamp check_Out_Date) {
		this.check_Out_Date = check_Out_Date;
	}
}
