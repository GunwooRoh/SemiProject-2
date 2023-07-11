package com.hotel.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.ConnectionPoolMgr2;

public class hotelDAO {
	private ConnectionPoolMgr2 pool;

	public hotelDAO() {
		pool=new ConnectionPoolMgr2();
	}

	/**
	 * 호텔 등록 메서드
	 * @param vo
	 * @return
	 * @throws SQLException 
	 */
	public int insertBoard(hotelVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2 con
			con=pool.getConnection();

			//3. ps
			String sql="insert into hotel(hotelNo, hotelName, longitude, latitude, address, hotelGrade, hotelDeatil, adminNo, image)"
					+ " values(hotel_seq.nextval, ?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getHotelName());
			ps.setDouble(2, vo.getLongitude());
			ps.setDouble(3, vo.getLatitude());
			ps.setString(4, vo.getAddress());
			ps.setInt(5, vo.getHotelGrade());
			ps.setString(6, vo.getHotelDetail());
			ps.setInt(7, vo.getAdminNo());
			ps.setString(8, vo.getImage());

			//4 exec
			int cnt=ps.executeUpdate();
			System.out.println("호텔 입력, cnt="+cnt +", 매개변수 vo="+vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	/**
	 * 호텔 정보 전체 보기 메서드
	 * @return
	 * @throws SQLException 
	 */
	public List<hotelVO> selectAll(String keyword) throws SQLException{
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<hotelVO> list = new ArrayList<>();
		try {
			//1,2
			con=pool.getConnection();

			String sql="select * from hotel ";
			//검색의 경우 where 조건절 추가
			if(keyword != null && !keyword.isEmpty()) {
				sql+="where hotelname like '%' || ? || '%' "
					+ "or address like '%' || ? || '%' ";
			}
			sql += " order by hotelNo desc";
			ps=con.prepareStatement(sql);

			if(keyword != null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
				ps.setString(2, keyword);
			}
			
			//4
			rs=ps.executeQuery();
			while(rs.next()) {
				int hotelNo=rs.getInt("hotelNo");
				String hotelName=rs.getString("hotelName");
				double longitude = rs.getDouble("longitude");
				double latitude = rs.getDouble("latitude");
				String address=rs.getString("address");
				int hotelGrade = rs.getInt("hotelGrade");
				String hotelDetail = rs.getString("hotelDetail");
				int adminNo = rs.getInt("adminNo");
				String image = rs.getString("main_image");

				hotelVO vo
				=new hotelVO(hotelNo, hotelName, longitude, latitude, address, hotelGrade, hotelDetail, adminNo, image);

				list.add(vo);
			}
			System.out.println("글 전체 조회 결과, list.size="+list.size()
				+", 매개변수 keyword="+keyword);

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	/**
	 * 호텔정보 상세보기 메서드
	 * @param no
	 * @return
	 * @throws SQLException 
	 */
	public hotelVO selectByhotelNo(int hotelNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		hotelVO vo = new hotelVO();
		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select * from hotel where hotelNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, hotelNo);

			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				String hotelName=rs.getString("hotelName");
				double longitude = rs.getDouble("longitude");
				double latitude = rs.getDouble("latitude");
				String address=rs.getString("address");
				int hotelGrade = rs.getInt("hotelGrade");
				String hotelDetail = rs.getString("hotelDetail");
				int adminNo = rs.getInt("adminNo");
				String image = rs.getString("main_image");
				
				vo.setHotelName(hotelName);
				vo.setLongitude(longitude);
				vo.setLatitude(latitude);
				vo.setAddress(address);
				vo.setHotelGrade(hotelGrade);
				vo.setHotelDetail(hotelDetail);
				vo.setAdminNo(adminNo);
				vo.setImage(image);
			}//if

			System.out.println("호텔정보 상세보기 결과, vo="+vo+", 매개변수 no=" + hotelNo);
			return vo;	
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	/**
	 * 호텔 정보 수정 메서드
	 * @param vo
	 * @return
	 * @throws SQLException 
	 */
	public int updateHotel(hotelVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql = "update hotel"
					+ " set hotelName =?, longitude= ?, latitude = ?, address = ?, hotelGrade = ?, hotelDetail = ? , adminNo = ?, image = ?"
					+ " where hotelNo= ?";
			ps = con.prepareStatement(sql);

			ps.setString(1, vo.getHotelName());
			ps.setDouble(2, vo.getLongitude());
			ps.setDouble(3, vo.getLatitude());
			ps.setString(4, vo.getAddress());
			ps.setInt(5, vo.getHotelGrade());
			ps.setString(6, vo.getHotelDetail());
			ps.setInt(7, vo.getAdminNo());
			ps.setString(8, vo.getImage());

			//4
			int cnt = ps.executeUpdate();
			System.out.println("호텔정보 결과 cnt = " + cnt + ", 매개변수 vo = " + vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	public int deleteHotel(int hotelNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			//1,2
			con = pool.getConnection();

			//3
			String sql = "delete from hotel"
					+ " where hotelNo = ?";
			ps = con.prepareStatement(sql);

			ps.setInt(1, hotelNo);
			

			//4
			int cnt = ps.executeUpdate();
			System.out.println("삭제 처리 결과 : " + cnt
					+", 매개변수 hotelNo="+hotelNo);
			
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}

	
}
