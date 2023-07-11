package com.hotel.model;

import java.sql.SQLException;
import java.util.List;

public class hotelService {
	private hotelDAO hotelDAO;
	
	public hotelService() {
		hotelDAO = new hotelDAO();
	}

	public int insertBoard(hotelVO vo) throws SQLException {
		return hotelDAO.insertBoard(vo);
	}

	public List<hotelVO> selectAll(String keyword) throws SQLException {
		return hotelDAO.selectAll(keyword);
	}

	public int hashCode() {
		return hotelDAO.hashCode();
	}

	public hotelVO selectByhotelNo(int hotelNo) throws SQLException {
		return hotelDAO.selectByhotelNo(hotelNo);
	}

	public int updateHotel(hotelVO vo) throws SQLException {
		return hotelDAO.updateHotel(vo);
	}

	public boolean equals(Object obj) {
		return hotelDAO.equals(obj);
	}

	public int deleteHotel(int hotelNo) throws SQLException {
		return hotelDAO.deleteHotel(hotelNo);
	}

	public String toString() {
		return hotelDAO.toString();
	}
}
