package com.notice.model;

import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		
		try {
			//3
			String sql = "INSERT INTO ANNOUNCEMENT(ANNNO, ADMINNO, ANNTITLE, ANNCONTENT, FILENAME, ORIGINFILENAME, FILESIZE)"
					+ " VALUES(ANNO_SEQ.NEXTVAL, 1, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1,  vo.getTitle());
			ps.setString(2,  vo.getContent());
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
	public List<NoticeVO> selectAll() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<NoticeVO> list = null;
		
		//1,2
		con = pool.getConnection();
		
		try {
			//3
			String sql = "SELECT * FROM ANNOUNCEMENT ORDER BY NO DESC";
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int adminNo = rs.getInt("adminNo");
				String fileName = rs.getString("fileName");
				String originFileName = rs.getString("originFileName");
				long fileSize = rs.getLong("fileSize");
				int viewCount = rs.getInt("viewCount");
				
				NoticeVO vo = new NoticeVO(no, title, content, regdate, adminNo, fileName, originFileName, fileSize, viewCount);
				
				list.add(vo);
				System.out.println("조회 완료, list.size = " + list.size());
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
	public NoticeVO selectByNo(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		//1,2
		con = pool.getConnection();
		
		try {
			//3
			String sql = "SELECT * FROM ANNOUNCEMENT WHERE ANNNO = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1,  no);
			
			//4.
			rs = ps.executeQuery();
			NoticeVO vo = null;
			if(rs.next()) {
				String title = rs.getString("anntitle");
				String content = rs.getString("anncontent");
				Timestamp regdate = rs.getTimestamp("regdate");
				int adminno = rs.getInt("adminno");
				String fileName = rs.getString("fileName");
				String originfileName = rs.getString("originfileName");
				long fileSize = rs.getLong("fileSize");
				int readCount = rs.getInt("readCount");
				
				vo.setTitle(title);
				vo.setContent(content);
				vo.setRegdate(regdate);
				vo.setAdminNo(adminno);
				vo.setFileName(fileName);
				vo.setOriginFileName(originfileName);
				vo.setFileSize(fileSize);
				vo.setViewCount(readCount);
				
				System.out.println("조회완료, vo = " + vo + ", 조회번호 no = " + no);
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
			ps.setString(1,  vo.getTitle());
			ps.setString(2,  vo.getContent());
			ps.setString(3, vo.getFileName());
			ps.setString(4, vo.getOriginFileName());
			ps.setLong(5, vo.getFileSize());
			ps.setInt(6,  vo.getNo());
			
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
}
