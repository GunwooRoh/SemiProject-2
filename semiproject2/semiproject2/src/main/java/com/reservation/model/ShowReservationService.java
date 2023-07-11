package com.reservation.model;

import java.sql.SQLException;
import java.util.List;

public class ShowReservationService {
	private ShowReservationDAO ShowReservationDAO;
	
	public ShowReservationService() {
		ShowReservationDAO = new ShowReservationDAO();
	}

	public List<ShowReservationVO> selectByaccNo(int accNo) throws SQLException {
		return ShowReservationDAO.selectByaccNo(accNo);
	}

	public List<ShowReservationVO> selectByhotelNo(int hotelNo) throws SQLException {
		return ShowReservationDAO.selectByhotelNo(hotelNo);
	}

	public int hashCode() {
		return ShowReservationDAO.hashCode();
	}

	public boolean equals(Object obj) {
		return ShowReservationDAO.equals(obj);
	}

	public String toString() {
		return ShowReservationDAO.toString();
	}
	
	
}
