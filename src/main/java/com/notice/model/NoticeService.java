package com.notice.model;

import java.sql.SQLException;
import java.util.List;

public class NoticeService {
	private NoticeDAO noticeDao;
	
	public NoticeService() {
		noticeDao = new NoticeDAO();
	}
	
	public int insertNotice(NoticeVO vo) throws SQLException {
		return noticeDao.insertNotice(vo);
	}
	
	public List<NoticeVO> selectAll(String keyword) throws SQLException{
		return noticeDao.selectAll(keyword);
	}
	
	public NoticeVO selectByNo(int annNo) throws SQLException {
		return noticeDao.selectByNo(annNo);
	}
	
	public int updateNotice(NoticeVO vo) throws SQLException {
		return noticeDao.updateNotice(vo);
	}
	
	public int deleteNotice(int no) throws SQLException {
		return noticeDao.deleteNotice(no);
	}
	
	public int updateViewCount(int no) throws SQLException {
		return noticeDao.updateViewCount(no);
	}
	
	public int updateDownCount(int annNo) throws SQLException {
		return noticeDao.updateDownCount(annNo);
	}
}
