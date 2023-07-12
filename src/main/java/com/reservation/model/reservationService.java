package com.reservation.model;

import java.sql.SQLException;
import java.util.List;

import com.reservation.model.reservationDAO;

public class reservationService {
	private reservationDAO reservationDAO;
	
	public reservationService(){
		reservationDAO = new reservationDAO();
	}

	public int insertReservation(reservationVO vo) throws SQLException {
		return reservationDAO.insertReservation(vo);
	}

	public List<reservationVO> selectAll(String keyword, String condition) throws SQLException {
		return reservationDAO.selectAll(keyword, condition);
	}

	public int updateReservation(reservationVO vo) throws SQLException {
		return reservationDAO.updateReservation(vo);
	}

	public int deleteReservation(int reCode) throws SQLException {
		return reservationDAO.deleteReservation(reCode);
	}

	public String toString() {
		return reservationDAO.toString();
	}
}
