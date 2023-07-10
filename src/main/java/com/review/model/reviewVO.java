package com.review.model;

import java.sql.Timestamp;

public class reviewVO {
	private int reviewNo;
	private int score;
	private String content;
	
	public reviewVO(int reviewNo, int score, String content, Timestamp regdate, int accNo, int hotelNo,
			String room_type) {
		super();
		this.reviewNo = reviewNo;
		this.score = score;
		this.content = content;
		this.regdate = regdate;
		this.accNo = accNo;
		this.hotelNo = hotelNo;
		this.room_type = room_type;
	}
	
	public reviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
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
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	private Timestamp regdate;
	private int accNo;
	private int hotelNo;
	private String room_type;
}
