package com.semiJY.notice.model;

import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.semiJY.db.ConnectionPoolMgr2;

public class NoticeDAO {
	private ConnectionPoolMgr2 pool;
	
	public NoticeDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public int insertNotice(NoticeVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		//1,2 
		con = pool.getConnection();
		
		try {
			//3
			String sql = "";
			ps = con.prepareStatement(sql);
			
			//4
			int cnt = ps.executeUpdate();
			System.out.println("삽입완료, cnt = " + cnt + ", 매개변수 vo = " + vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public List<NoticeVO> selectAll() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<NoticeVO> list = null;
		
		//1,2
		con = pool.getConnection();
		
		try {
			//3
			String sql = "";
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
				int fileSize = rs.getInt("fileSize");
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
}
