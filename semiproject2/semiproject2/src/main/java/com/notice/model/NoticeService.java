package com.semiJY.notice.model;

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
	
	public List<NoticeVO> selectAll() throws SQLException{
		return noticeDao.selectAll();
	}
}
