package com.reservation.model;

import java.sql.Timestamp;

public class ShowReservationVO {
		private int reCode;
		private int accNo;
		private int hotelNo;
		private int booked_room_count;
		private String room_type;
		private int people_num;
		private Timestamp check_In_Date;
		private Timestamp check_Out_Date;
		
		public ShowReservationVO() {
			super();
			// TODO Auto-generated constructor stub
		}
		
		
		
		
		
		public ShowReservationVO(int reCode, int accNo, int hotelNo, int booked_room_count, String room_type,
				int people_num, Timestamp check_In_Date, Timestamp check_Out_Date) {
			// TODO Auto-generated constructor stub
			super();
			this.reCode = reCode;
			this.accNo = accNo;
			this.hotelNo = hotelNo;
			this.booked_room_count = booked_room_count;
			this.room_type = room_type;
			this.people_num = people_num;
			this.check_In_Date = check_In_Date;
			this.check_Out_Date = check_Out_Date;
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
		
		@Override
		public String toString() {
			return "ShowReservationVO [reCode=" + reCode + ", accNo=" + accNo + ", hotelNo=" + hotelNo
					+ ", booked_room_count=" + booked_room_count + ", room_type=" + room_type + ", people_num="
					+ people_num + ", check_In_Date=" + check_In_Date + ", check_Out_Date=" + check_Out_Date + "]";
		}
	
		
		
}
