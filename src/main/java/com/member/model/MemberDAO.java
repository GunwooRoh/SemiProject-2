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
			/*if(rs.next()) {
				String dbPwd=rs.getString(1);
				if(dbPwd.equals(pwd)) {
					result=MemberService.LOGIN_OK;  //로그인 성공
				}else {
					result=MemberService.DISAGREE_PWD;//비밀번호 불일치					
				}
			}else {
				result=MemberService.NONE_ID;//해당 아이디가 없다
			}*/
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
					//result=MemberService.LOGIN_OK;  //로그인 성공
				}else {
					//result=MemberService.DISAGREE_PWD;//비밀번호 불일치					
				}
				System.out.println("로그인 처리 결과, result="+result+", 매개변수 adminid=" + id+", adminpwd="+pwd);
			}
				return result;
			}finally {
				pool.dbClose(rs, ps, con);
			}

		
	}
	
	/**
	 * 회원가입
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertMember(MemberVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql = "insert into member(no, id,name,pwd,age,email,tel)"
					+ " values(member_seq.nextval, ?, ?, ?, ?, ?, ?)";

			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getPwd());
			ps.setString(4, vo.getEmail());

			//4
			int cnt = ps.executeUpdate();
			System.out.println("member 등록 결과 cnt = " + cnt + ", 매개변수 vo = " + vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	/**
	 * 아이디 중복확인용 메서드
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public int duplicateId(String id) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select count(*) from member where memberid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);

			//4
			int result=0;

			rs=ps.executeQuery();
			if(rs.next()) {
				int count=rs.getInt(1);
				if(count>0) {  //이미 존재-> 사용불가
					result=MemberService.UNUSABLE_ID;
				}else { //해당 아이디는 없다 - 사용가능
					result=MemberService.USABLE_ID;					
				}
			}
			System.out.println("아이디 중복확인 결과, result="+result
					+", 매개변수 userid="+id);

			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	

	public MemberVO selectMember(String userid) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		MemberVO vo = new MemberVO();
		try {
			con = pool.getConnection();

			String sql = "select * from member where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);

			rs = ps.executeQuery();
			if(rs.next()) {            
				int accno = rs.getInt("accno");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				int age = rs.getInt("age");
				String email = rs.getString("email");
				int tel = rs.getInt("tel");
				int point = rs.getInt("point");

				vo.setAccno(accno);
				vo.setName(name);
				vo.setPwd(pwd);
				vo.setEmail(email);
				//vo.setTel(tel); 
				vo.setPoint(point);
			}
			System.out.println("회원정보 검색결과: " + vo + ", 매개변수 userid: " + userid);

			return vo;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public int updateMember(MemberVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps =null;

		try {
			con=pool.getConnection();

			String sql="update member"
					+ " set name=?, pwd=?, age=?, tel=?,email=?"
					+ " where id=?";
			ps=con.prepareStatement(sql);

			ps.setString(1, vo.getName());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getAge());
			//ps.setInt(4, vo.getTel());
			ps.setString(5, vo.getEmail());

			int cnt=ps.executeUpdate();

			System.out.println("회원 수정 결과 cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;

		}finally {
			pool.dbClose(ps, con);
		}
	}

	public int withdrawMember(String userid) throws SQLException {
		Connection con=null;
		PreparedStatement ps =null;

		try {
			con=pool.getConnection();

			String sql="update member set outdate=sysdate where userid=?";
			ps=con.prepareStatement(sql);

			ps.setString(1, userid);

			int cnt=ps.executeUpdate();

			System.out.println("회원 탈퇴 결과 cnt="+cnt+", 매개변수 userid="+userid);
			return cnt;

		}finally {
			pool.dbClose(ps, con);
		}

	}
	
	/**
	 * 아이디 찾기
	 * @param member_name
	 * @param member_phone
	 * @return
	 */
	public String findId(String member_name, String member_phone) {
		String mid = null;
		Connection con=null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		
		try {
			String sql = "select member_mid from members "
					+ "where member_name=? and member_phone=? ";
			ps = con.prepareStatement(sql);
			ps.setString(1, member_name);
			ps.setString(2, member_phone);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				mid = rs.getString("member_mid");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mid;
	}
	
	

}














