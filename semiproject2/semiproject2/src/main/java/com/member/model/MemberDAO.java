package com.member.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.db.ConnectionPoolMgr2;

public class MemberDAO {
	private ConnectionPoolMgr2 pool;

	public MemberDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	/**
	 * 로그인
	 * @param userid
	 * @param pwd
	 * @return
	 * @throws SQLException
	 */
	public int checkLogin(String id, String pwd) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		try {
			//1,2
			con=pool.getConnection();

			//3.
			String sql="select pwd from member where id=? and outdate is null";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);

			//4
			int result=0;
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbPwd=rs.getString(1);
				if(dbPwd.equals(pwd)) {
					result=MemberService.LOGIN_OK;  //로그인 성공
				}else {
					result=MemberService.DISAGREE_PWD;//비밀번호 불일치					
				}
			}else {
				result=MemberService.NONE_ID;//해당 아이디가 없다
			}
			System.out.println("로그인 처리 결과, result="+result+", "
					+ "매개변수 userid=" + id+", pwd="+pwd);

			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	/**
	 * 관리자 로그인
	 * @param id
	 * @param pwd
	 * @return
	 * @throws SQLException
	 */
	public int AdminLogin(String id, String pwd) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			//1,2
			con=pool.getConnection();

			//3.
			String sql="SELECT adminpwd FROM admin WHERE adminid = ?";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);

			//4
			int result=0;
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbPwd=rs.getString(1);
				if(dbPwd.equals(pwd)) {
					result=MemberService.LOGIN_OK;  //로그인 성공
				}else {
					result=MemberService.DISAGREE_PWD;//비밀번호 불일치					
				}
				System.out.println("로그인 처리 결과, result="+result+", 매개변수 adminid=" + id+", adminpwd="+pwd);
			}
				return result;
			}finally {
				pool.dbClose(rs, ps, con);
			}

		
	}
	

}














