package com.facilities.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.db.ConnectionPoolMgr2;


public class facilitiesDAO {
	private ConnectionPoolMgr2 pool;

	public facilitiesDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	/**
	 * 부대시설 보기 메서드
	 * @param no
	 * @return
	 * @throws SQLException 
	 */
	public facilitiesVO selectByhotelNo(int hotelNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		facilitiesVO vo = new facilitiesVO();
		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select * from facilities where hotelNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, hotelNo);

			//4
			rs=ps.executeQuery();
			
			if(rs.next()) {
				int conv_store = rs.getInt("conv_store");
				int laundry_room = rs.getInt("laundry_room");
				int accompany_pet = rs.getInt("accompany_pet");
				int parking = rs.getInt("parking");
				int valet_parking = rs.getInt("valet_parking");
				int breakfast = rs.getInt("breakfast");
				int pool = rs.getInt("pool");
				int lounge_bar = rs.getInt("lounge_bar");
				
				vo.setConv_store(conv_store);
				vo.setLaundry_room(laundry_room);
				vo.setAccompany_pet(accompany_pet);
				vo.setParking(valet_parking);
				vo.setValet_parking(valet_parking);
				vo.setBreakfast(breakfast);
				vo.setPool(pool);
				vo.setLounge_bar(lounge_bar);
			}//if

			System.out.println("부대시설 상세보기 결과, vo="+vo+", 매개변수 no=" + hotelNo);
			return vo;	
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
}