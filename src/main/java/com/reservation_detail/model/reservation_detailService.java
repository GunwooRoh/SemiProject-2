package com.reservation_detail.model;

import java.sql.SQLException;
import java.util.List;

public class reservation_detailService {
	private reservation_detailDAO reservation_detailDAO;
	
	
	public reservation_detailService(){
		reservation_detailDAO  = new reservation_detailDAO ();
	}


	public int insertReservation_detail(reservation_detailVO vo) throws SQLException {
		return reservation_detailDAO.insertReservation_detail(vo);
	}


	public List<reservation_detailVO> selectAll(String keyword, String condition) throws SQLException {
		return reservation_detailDAO.selectAll(keyword, condition);
	}


	public int updateReservation_detail(reservation_detailVO vo) throws SQLException {
		return reservation_detailDAO.updateReservation_detail(vo);
	}


	public int deleteReservation_detail(int reDetailNo) throws SQLException {
		return reservation_detailDAO.deleteReservation_detail(reDetailNo);
	}

	public String toString() {
		return reservation_detailDAO.toString();
	}
}
