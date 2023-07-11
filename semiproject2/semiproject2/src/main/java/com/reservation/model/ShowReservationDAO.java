package com.reservation.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.db.ConnectionPoolMgr2;

public class ShowReservationDAO {
	private ConnectionPoolMgr2 pool;
	
	public ShowReservationDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	//회원별 예약 정보 조회
	public List<ShowReservationVO> selectByaccNo (int accNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		List<ShowReservationVO> list = new ArrayList<>();
		try {
			con = pool.getConnection();
			
			
			String sql = "select a.*, b.room_type, b.people_num, b.check_In_Date, b.check_Out_date\r\n"
		               + "from reservation a join reservation_detail b\r\n"
		               + "on a.reCode = b.reCode\r\n"
		               + "where a.accNo = ?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, accNo);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				int reCode = rs.getInt(1);
				int accNo2 = rs.getInt(2);
				int hotelNo = rs.getInt(3);
				int booked_room_count = rs.getInt(4);
				String room_type = rs.getString(5);
				int people_num = rs.getInt(6);
				Timestamp check_In_Date = rs.getTimestamp(7);
				Timestamp check_Out_Date = rs.getTimestamp(8);
				
				ShowReservationVO vo = new ShowReservationVO(reCode, accNo2, hotelNo, booked_room_count, room_type, people_num, check_In_Date, check_Out_Date);
				list.add(vo);
			}
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	//호텔별 예약 정보 조회
	public List<ShowReservationVO> selectByhotelNo (int hotelNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		List<ShowReservationVO> list = new ArrayList<>();
		try {
			con = pool.getConnection();
			
			
			String sql = "select a.*, b.room_type, b.people_num, b.check_In_Date, b.check_Out_date\r\n"
		               + "from reservation a join reservation_detail b\r\n"
		               + "on a.reCode = b.reCode\r\n"
		               + "where a.hotelNo = ?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, hotelNo);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				int reCode = rs.getInt(1);
				int accNo = rs.getInt(2);
				int hotelNo2 = rs.getInt(3);
				int booked_room_count = rs.getInt(4);
				String room_type = rs.getString(5);
				int people_num = rs.getInt(6);
				Timestamp check_In_Date = rs.getTimestamp(7);
				Timestamp check_Out_Date = rs.getTimestamp(8);
				
				ShowReservationVO vo = new ShowReservationVO(reCode, accNo, hotelNo2, booked_room_count, room_type, people_num, check_In_Date, check_Out_Date);
				list.add(vo);
			}
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
	
	
	
}
