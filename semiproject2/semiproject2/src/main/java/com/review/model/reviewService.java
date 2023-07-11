package com.review.model;

import java.sql.SQLException;
import java.util.List;

public class reviewService {
	private reviewDAO reviewDAO;
	
	public reviewService() {
		reviewDAO = new reviewDAO();
	}

	public int insertReview(reviewVO vo) throws SQLException {
		return reviewDAO.insertReview(vo);
	}

	public int updateReview(reviewVO vo) throws SQLException {
		return reviewDAO.updateReview(vo);
	}

	public int deleteReview(int reviewNo) throws SQLException {
		return reviewDAO.deleteReview(reviewNo);
	}

	public int hashCode() {
		return reviewDAO.hashCode();
	}
	/*
	public List<reviewVO> selectByhotelNo(String keyword, String condition) throws SQLException {
		return reviewDAO.selectByhotelNo(keyword, condition);
	}*/

	public List<reviewVO> selectByaccNo(String keyword, String condition) throws SQLException {
		return reviewDAO.selectByaccNo(keyword, condition);
	}

	public boolean equals(Object obj) {
		return reviewDAO.equals(obj);
	}

	public String toString() {
		return reviewDAO.toString();
	}

	
}
