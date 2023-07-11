package com.reservation_detail.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.db.ConnectionPoolMgr2;

public class reservation_detailDAO {
	private ConnectionPoolMgr2 pool;

	public reservation_detailDAO() {
		pool=new ConnectionPoolMgr2();
	}

	/**
	 * 예약 상세 정보 등록 메서드
	 * @param vo
	 * @return
	 * @throws SQLException 
	 */
	public int insertReservation_detail(reservation_detailVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2 con
			con=pool.getConnection();

			//3. ps
			String sql="insert into reservation_detail(reCode, room_type, people_num, check_In_Date, check_Out_Date)"
					+ " values(reservation_detail_seq.nextval, ?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getReCode());
			ps.setString(2, vo.getRoom_type());
			ps.setInt(3, vo.getPeople_num());
			ps.setTimestamp(4, vo.getCheck_In_Date());
			ps.setTimestamp(5, vo.getCheck_Out_Date());

			//4 exec
			int cnt=ps.executeUpdate();
			System.out.println("예약상세정보 입력, cnt="+cnt +", 매개변수 vo="+vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	/**
	 * 예약 상세 정보 전체 보기 메서드
	 * @return
	 * @throws SQLException 
	 */
	public List<reservation_detailVO> selectAll(String keyword, String condition) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<reservation_detailVO> list = new ArrayList<>();
		try {
			//1,2
			con=pool.getConnection();

			String sql="select * from reservation_detail ";
			//검색의 경우 where 조건절 추가
			if(keyword != null && !keyword.isEmpty()) {
				sql+=" where "+condition+" like '%' || ? || '%'";
			}
			sql += " order by reDetailNo desc";
			ps=con.prepareStatement(sql);

			if(keyword != null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			//4
			rs=ps.executeQuery();
			while(rs.next()) {
				int reDetailNo = rs.getInt("reDetailNo");
				int reCode=rs.getInt("reCode");
				String room_type = rs.getString("room_type");
				int people_num = rs.getInt("people_num");
				Timestamp check_In_Date = rs.getTimestamp("check_In_Date");
				Timestamp check_Out_Date = rs.getTimestamp("check_Out_Date");

				reservation_detailVO vo
				=new reservation_detailVO(reDetailNo, reCode, room_type, people_num, check_In_Date, check_Out_Date);

				list.add(vo);
			}
			System.out.println("예약 상제 정보 전체 조회 결과, list.size="+list.size()
				+", 매개변수 keyword="+keyword+", condition="+condition);

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	/**
	 * 예약 상세 정보 수정 메서드
	 * @param vo
	 * @return
	 * @throws SQLException 
	 */
	public int updateReservation_detail(reservation_detailVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql = "update reservation_detail"
					+ " set reCode = ?  room_type =?, people_num = ?, check_In_Date = ?, check_Out_Date = ?"
					+ " where reDetailNo = ?";
			ps = con.prepareStatement(sql);

			ps.setInt(1, vo.getReCode());
			ps.setString(2, vo.getRoom_type());
			ps.setTimestamp(3, vo.getCheck_In_Date());
			ps.setTimestamp(4, vo.getCheck_Out_Date());

			//4
			int cnt = ps.executeUpdate();
			System.out.println("예약 상세 정보 결과 cnt = " + cnt + ", 매개변수 vo = " + vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	public int deleteReservation_detail(int reDetailNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			//1,2
			con = pool.getConnection();

			//3
			String sql = "delete from reservation_detail"
					+ " where reCode = ?";
			ps = con.prepareStatement(sql);

			ps.setInt(1, reDetailNo);
			

			//4
			int cnt = ps.executeUpdate();
			System.out.println("삭제 처리 결과 : " + cnt
					+", 매개변수 reDetailNo="+reDetailNo);
			
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}

	
}