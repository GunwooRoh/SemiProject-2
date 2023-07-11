package com.reservation.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.ConnectionPoolMgr2;


public class reservationDAO {
	private ConnectionPoolMgr2 pool;

	public reservationDAO() {
		pool=new ConnectionPoolMgr2();
	}

	/**
	 * 예약 등록 메서드
	 * @param vo
	 * @return
	 * @throws SQLException 
	 */
	public int insertReservation(reservationVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2 con
			con=pool.getConnection();

			//3. ps
			String sql="insert into reservation(reCode, accNo, hotelNo, booked_room_count)"
					+ " values(reservation_seq.nextval, ?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getAccNo());
			ps.setInt(2, vo.getHotelNo());
			ps.setInt(3, vo.getBooked_room_count());

			//4 exec
			int cnt=ps.executeUpdate();
			System.out.println("예약 입력, cnt="+cnt +", 매개변수 vo="+vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	/**
	 * 예약 정보 전체 보기 메서드
	 * @return
	 * @throws SQLException 
	 */
	public List<reservationVO> selectAll(String keyword, String condition) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<reservationVO> list = new ArrayList<>();
		try {
			//1,2
			con=pool.getConnection();

			String sql="select * from reservation ";
			//검색의 경우 where 조건절 추가
			if(keyword != null && !keyword.isEmpty()) {
				sql+=" where "+condition+" like '%' || ? || '%'";
			}
			sql += " order by reCode desc";
			ps=con.prepareStatement(sql);

			if(keyword != null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			//4
			rs=ps.executeQuery();
			while(rs.next()) {
				int reCode=rs.getInt("reCode");
				int accNo = rs.getInt("accNo");
				int hotelNo=rs.getInt("hotelNo");
				int booked_room_count = rs.getInt("booked_room_count");
						
				reservationVO vo
				=new reservationVO(reCode, accNo, hotelNo, booked_room_count);

				list.add(vo);
			}
			System.out.println("예약 전체 조회 결과, list.size="+list.size()
				+", 매개변수 keyword="+keyword+", condition="+condition);

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
	/**
	 * 회원별 예약 정보 전체 보기 메서드
	 * @return
	 * @throws SQLException 
	 */
	public List<reservationVO> selectByAccNo(String keyword, String condition) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<reservationVO> list = new ArrayList<>();
		try {
			//1,2
			con=pool.getConnection();

			String sql="select * from reservation ";
			//검색의 경우 where 조건절 추가
			if(keyword != null && !keyword.isEmpty()) {
				sql+=" where "+condition+" like '%' || ? || '%'";
			}
			sql += " order by reCode desc";
			ps=con.prepareStatement(sql);

			if(keyword != null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			//4
			rs=ps.executeQuery();
			while(rs.next()) {
				int reCode=rs.getInt("reCode");
				int accNo = rs.getInt("accNo");
				int hotelNo=rs.getInt("hotelNo");
				int booked_room_count = rs.getInt("booked_room_count");
						
				reservationVO vo
				=new reservationVO(reCode, accNo, hotelNo, booked_room_count);

				list.add(vo);
			}
			System.out.println("예약 전체 조회 결과, list.size="+list.size()
				+", 매개변수 keyword="+keyword+", condition="+condition);

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	/**
	 * 예약 정보 수정 메서드
	 * @param vo
	 * @return
	 * @throws SQLException 
	 */
	public int updateReservation(reservationVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql = "update reservation"
					+ " set accNo = ?  hotelNo =?, booked_room_count = ?"
					+ " where reCode = ?";
			ps = con.prepareStatement(sql);

			ps.setInt(1, vo.getAccNo());
			ps.setInt(2, vo.getHotelNo());
			ps.setInt(3, vo.getBooked_room_count());

			//4
			int cnt = ps.executeUpdate();
			System.out.println("예약 정보 결과 cnt = " + cnt + ", 매개변수 vo = " + vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	public int deleteReservation(int reCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			//1,2
			con = pool.getConnection();

			//3
			String sql = "delete from reservation"
					+ " where reCode = ?";
			ps = con.prepareStatement(sql);

			ps.setInt(1, reCode);
			

			//4
			int cnt = ps.executeUpdate();
			System.out.println("삭제 처리 결과 : " + cnt
					+", 매개변수 reCode="+reCode);
			
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}

	
}
