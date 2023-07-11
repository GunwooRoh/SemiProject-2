package com.review.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.db.ConnectionPoolMgr2;


public class reviewDAO {
	private ConnectionPoolMgr2 pool;

	public reviewDAO() {
		pool=new ConnectionPoolMgr2();		
	}

	//리뷰 입력
	public int insertReview(reviewVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2 con
			con=pool.getConnection();

			//3. ps
			String sql="insert into review(reviewNo, score, content, regdate, accNo, hotelNo, room_type)"
					+ " values(reviewNo_seq.nextval, ?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getScore());
			ps.setString(2, vo.getContent());
			ps.setTimestamp(3, vo.getRegdate());
			ps.setInt(4, vo.getAccNo());
			ps.setInt(5, vo.getHotelNo());
			ps.setString(6,vo.getRoom_type());

			//4 exec
			int cnt=ps.executeUpdate();
			System.out.println("후기입력, cnt="+cnt +", 매개변수 vo="+vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}	
	//리뷰 수정
	public int updateReview(reviewVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql = "update review"
					+ " set score = ?  content =?, regdate = ?, accNo = ?, hotelNo = ?, room_type = ?"
					+ " where reviewNo = ?";
			ps = con.prepareStatement(sql);

			ps.setInt(1, vo.getScore());
			ps.setString(2, vo.getContent());
			ps.setTimestamp(3, vo.getRegdate());
			ps.setInt(4, vo.getAccNo());
			ps.setInt(5, vo.getHotelNo());
			ps.setString(6,vo.getRoom_type());

			//4
			int cnt = ps.executeUpdate();
			System.out.println("리뷰 수정 결과 cnt = " + cnt + ", 매개변수 vo = " + vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	//리뷰 삭제
	public int deleteReview(int reviewNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			//1,2
			con = pool.getConnection();

			//3
			String sql = "delete from review"
					+ " where reviewNo = ?";
			ps = con.prepareStatement(sql);

			ps.setInt(1, reviewNo);


			//4
			int cnt = ps.executeUpdate();
			System.out.println("삭제 처리 결과 : " + cnt
					+", 매개변수 reCode="+reviewNo);

			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}

	//호텔별 리뷰 조회
	public List<reviewVO> selectByhotelNo(String keyword, String condition) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<reviewVO> list = new ArrayList<>();
		try {
			//1,2
			con=pool.getConnection();

			String sql="select * from review ";
			//검색의 경우 where 조건절 추가
			if(keyword != null && !keyword.isEmpty()) {
				sql+=" where "+condition+" like '%' || ? || '%'";
			}
			sql += " order by reviewNo desc";
			ps=con.prepareStatement(sql);

			if(keyword != null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}

			//4
			rs=ps.executeQuery();
			while(rs.next()) {
				int reviewNo=rs.getInt("reviewNo");
				int score = rs.getInt("score");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int accNo = rs.getInt("accNo");
				int hotelNo=rs.getInt("hotelNo");
				String room_type = rs.getString("room_type");

				reviewVO vo
				=new reviewVO(reviewNo, score, content, regdate, accNo, hotelNo, room_type);

				list.add(vo);
			}
			System.out.println("호텔별 리뷰 조회 결과, list.size="+list.size()
			+", 매개변수 keyword="+keyword+", condition="+condition);

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	//회원별 작성 리뷰 조회
	public List<reviewVO> selectByaccNo(String keyword, String condition) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<reviewVO> list = new ArrayList<>();
		try {
			//1,2
			con=pool.getConnection();

			String sql="select * from review";
			//검색의 경우 where 조건절 추가
			if(keyword != null && !keyword.isEmpty()) {
				sql+=" where "+condition+" like '%' || ? || '%'";
			}
			sql += " order by reviewNo desc";
			ps=con.prepareStatement(sql);

			if(keyword != null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}

			//4
			rs=ps.executeQuery();
			while(rs.next()) {
				int reviewNo=rs.getInt("reviewNo");
				int score = rs.getInt("score");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int accNo = rs.getInt("accNo");
				int hotelNo=rs.getInt("hotelNo");
				String room_type = rs.getString("room_type");

				reviewVO vo
				=new reviewVO(reviewNo, score, content, regdate, accNo, hotelNo, room_type);

				list.add(vo);
			}
			System.out.println("회원별 리뷰 조회 결과, list.size="+list.size()
			+", 매개변수 keyword="+keyword+", condition="+condition);

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}


}
