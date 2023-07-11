package com.facilities.model;

import java.sql.SQLException;


public class facilitiesService {
	private facilitiesDAO facilitiesDAO;
	
	public facilitiesService() {
		facilitiesDAO = new facilitiesDAO();
	}
	
	public facilitiesVO selectByhotelNo(int hotelNo) throws SQLException {
		return facilitiesDAO.selectByhotelNo(hotelNo);
	}
}
