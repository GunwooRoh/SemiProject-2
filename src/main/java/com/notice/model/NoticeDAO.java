package com.notice.model;

import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.ConnectionPoolMgr2;

public class NoticeDAO {
	private ConnectionPoolMgr2 pool;
	
	public NoticeDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	/**
	 * 글 등록
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertNotice(NoticeVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		//1,2 
		con = pool.getConnection();
		System.out.println("con 연결 성공");
		try {
			//3
			String sql = "INSERT INTO ANNOUNCEMENT(ANNNO, ANNTITLE, ANNCONTENT, ADMINNO, FILENAME, ORIGINFILENAME, FILESIZE)\r\n"
					+ "VALUES(ANNO_SEQ.NEXTVAL, ?, ?, 1, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1,  vo.getAnnTitle());
			ps.setString(2,  vo.getAnnContent());
			ps.setString(3,  vo.getFileName());
			ps.setString(4,  vo.getOriginFileName());
			ps.setLong(5,  vo.getFileSize());
			
			
			
			//4
			int cnt = ps.executeUpdate();
			System.out.println("삽입완료, cnt = " + cnt + ", 매개변수 vo = " + vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	/**
	 * 글 조회
	 * @return
	 * @throws SQLException
	 */
	public List<NoticeVO> selectAll(String keyword) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<NoticeVO> list = new ArrayList<>();
		
		//1,2
		con = pool.getConnection();
		
		try {
			//3
			String sql = "SELECT * FROM ANNOUNCEMENT";
			
			if(keyword!=null && !keyword.isEmpty()) {
				sql += " WHERE ANNTITLE LIKE '%' || ? || '%'";
			}
			sql += " ORDER BY ANNNO DESC";
			ps = con.prepareStatement(sql);
			
			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(1,  keyword);
			}
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int annNo = rs.getInt("annNo");
				String annTitle = rs.getString("annTitle");
				String annContent = rs.getString("annContent");
				Timestamp regdate = rs.getTimestamp("regdate");
				int adminNo = rs.getInt("adminNo");
				int readCount= rs.getInt("readCount");
				String fileName = rs.getString("fileName");
				String originFileName = rs.getString("originFileName");
				long fileSize = rs.getLong("fileSize");
				int downCount = rs.getInt("downCount");
				
				NoticeVO vo = new NoticeVO(annNo, annTitle, annContent, regdate, adminNo, readCount, fileName, originFileName, fileSize, downCount);
				
				list.add(vo);
				System.out.println("조회 완료, list.size = " + list.size() + "매개변수 keyword = " + keyword);
			}
			return list;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	/**
	 * 번호로 조회
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public NoticeVO selectByNo(int annNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		//1,2
		con = pool.getConnection();
		
		try {
			//3
			String sql = "SELECT * FROM ANNOUNCEMENT WHERE ANNNO = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1,  annNo);
			
			//4.
			rs = ps.executeQuery();
			NoticeVO vo = null;
			if(rs.next()) {
				vo = new NoticeVO();
				String annTitle = rs.getString("anntitle");
				String annContent = rs.getString("anncontent");
				Timestamp regdate = rs.getTimestamp("regdate");
				int adminno = rs.getInt("adminno");
				int readCount = rs.getInt("readCount");
				String fileName = rs.getString("fileName");
				String originfileName = rs.getString("originfileName");
				long fileSize = rs.getLong("fileSize");
				int downCount = rs.getInt("downCount");
				
				vo.setAnnNo(annNo);
				vo.setAnnTitle(annTitle);
				vo.setAnnContent(annContent);
				vo.setRegdate(regdate);
				vo.setAdminNo(adminno);
				vo.setFileName(fileName);
				vo.setOriginFileName(originfileName);
				vo.setFileSize(fileSize);
				vo.setReadCount(readCount);
				vo.setDownCount(downCount);
				
				System.out.println("조회완료, vo = " + vo + ", 조회번호 annNo = " + annNo);
			}
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	/**
	 * 수정
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int updateNotice(NoticeVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		//1,2
		con = pool.getConnection();
		
		//3. 
		try {
			//3
			String sql = "UPDATE ANNOUNCEMENT"
					+ " SET ANNTITLE = ?, ANNCONTENT = ?, FILENAME = ?,"
					+ " ORIGINFILENAME = ?, FILESIZE = ?"
					+ " WHERE ANNNO = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1,  vo.getAnnTitle());
			ps.setString(2,  vo.getAnnContent());
			ps.setString(3, vo.getFileName());
			ps.setString(4, vo.getOriginFileName());
			ps.setLong(5, vo.getFileSize());
			ps.setInt(6,  vo.getAnnNo());
			
			int cnt = ps.executeUpdate();
			System.out.println("수정 완료, cnt = " + cnt + ", 매개변수 vo = " + vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	/**
	 * 삭제
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public int deleteNotice(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		//1,2
		con = pool.getConnection();
		
		try {
			//3
			String sql = "DELETE FROM ANNOUNCEMENT WHERE ANNNO = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			
			int cnt = ps.executeUpdate();
			System.out.println("삭제 완료, cnt = " + cnt + ", 조회번호 no = " + no);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
			
		}
	}
	
	/**
	 * 조회수 증가
	 * @throws SQLException 
	 */
	public int updateViewCount(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		//1,2
		con = pool.getConnection();
		
		try {
			//3.
			String sql = "UPDATE ANNOUNCEMENT"
					+ " SET READCOUNT = READCOUNT+1"
					+ " WHERE ANNNO=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			
			//4
			int cnt = ps.executeUpdate();
			System.out.println("다운로드수 증가 결과, cnt="+cnt+", 매개변수 no="+no);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int updateDownCount(int annNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			//1,2
			con= pool.getConnection();
			
			String sql = "UPDATE ANNOUNCEMENT SET DOWNCOUNT = DOWNCOUNT + 1"
					    + " WHERE ANNNO = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, annNo);
			
			int cnt = ps.executeUpdate();
			System.out.println("다운로드 수 증가 결과, cnt = " + cnt + ", 조회번호 annNo = " + annNo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
