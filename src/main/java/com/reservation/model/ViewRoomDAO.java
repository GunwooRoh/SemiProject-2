package com.reservation.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.ConnectionPoolMgr2;
import com.hotel.model.hotelVO;

public class ViewRoomDAO {
	private ConnectionPoolMgr2 pool;
	
	public ViewRoomDAO() {
		pool = new ConnectionPoolMgr2();
	}
	

	
	public List<ViewRoomVO> selectByHotelNo(int hotelNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ViewRoomVO> list= new ArrayList<>();
		
		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select A.*, d.total_room, d.price_per_day, d.bed, d.WIFI, d.kitchen, d.ac "
					+ "from "
					+ "( "
					+ "select t.typeno TYPENO, h.hotelname, t.room_type, t.hotelno "
					+ "from room_type t join hotel h "
					+ "on t.hotelno=h.hotelno "
					+ ")A join room_detail d "
					+ "on d.typeno=A.TYPENO "
					+ "where hotelno=? ";
			ps=con.prepareStatement(sql);
			ps.setInt(1, hotelNo);

			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				int typeNo = rs.getInt(1);
				String hotelName = rs.getString(2);
				String room_type = rs.getString(3);
				int hotelNo2 = rs.getInt(4);
				int total_room = rs.getInt(5);
				int price_per_day = rs.getInt(6);
				int bed = rs.getInt(7);
				int wifi = rs.getInt(8);
				int kitchen = rs.getInt(9);
				int ac = rs.getInt(10);
				/*
				vo.setHotelName(hotelName);
				vo.setTypeNo(typeNo);
				vo.setRoom_type(room_type);
				vo.setHotelNo(hotelNo2);
				vo.setTotal_room(total_room);
				vo.setPrice_per_day(price_per_day);
				vo.setBed(bed);
				vo.setWifi(wifi);
				vo.setKitchen(kitchen);
				vo.setAc(ac);
				*/
				ViewRoomVO vo = new ViewRoomVO(hotelName,typeNo,room_type,hotelNo2,total_room,price_per_day,bed,wifi,kitchen,ac);
				list.add(vo);
			}//if

			System.out.println("객실정보 상세보기 결과, list="+list.size()+", 매개변수 hotelNo=" + hotelNo);
			return list;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

}
