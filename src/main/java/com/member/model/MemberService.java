package com.member.model;

import java.sql.SQLException;

/*
 jsp - dao
 jsp - service - dao
 */

//db작업 이외의 로직을 담는 클래스
public class MemberService {
	//아이디 중복확인 관련 상수
	public static final int USABLE_ID=1;  //사용가능한 아이디
	public static final int UNUSABLE_ID=2;  //사용불가 아이디

	//로그인 처리 관련 상수
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int DISAGREE_PWD=2; //비밀번호 불일치
	public static final int NONE_ID=3;  //아이디 없음

	//관리자 로그인
	public static final int Admin_Login=4;  //관리자로그인성공
	

	private MemberDAO memberDao;

	public MemberService(){
		memberDao=new MemberDAO();
	}

	public int checkLogin(String id, String pwd) throws SQLException {
		if(id.equals("admin") && pwd.equals("admin123")) {
			return memberDao.AdminLogin(id, pwd);
		}else {
			return memberDao.checkLogin(id, pwd);
		}
	}
	
	public int insertMember(MemberVO vo) throws SQLException {
		return memberDao.insertMember(vo);

	}
	
	public int duplicateId(String id) throws SQLException {
		return memberDao.duplicateId(id);
	}
	
	public MemberVO selectMember(String id) throws SQLException {
		return memberDao.selectMember(id);
	}

	}
	
}
