package com.member.model;

import java.sql.Timestamp;

public class MemberVO {
	private int accno;
	private String id;
	private String name;
	private String pwd;
	private String age;
	private String email;
	private String tel;
	private int point;
	private Timestamp regdate;
	private Timestamp outdate;
	private String card;
	
	
	public MemberVO() {
		super();
	}

	
	public MemberVO(int accno, String id, String name, String pwd, String age, String email, String tel, int point,
			Timestamp regdate, Timestamp outdate, String card) {
		super();
		this.accno = accno;
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.age = age;
		this.email = email;
		this.tel = tel;
		this.point = point;
		this.regdate = regdate;
		this.outdate = outdate;
		this.card	= card;
	}

	

	public int getAccno() {
		return accno;
	}

	public void setAccno(int accno) {
		this.accno = accno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Timestamp getOutdate() {
		return outdate;
	}

	public void setOutdate(Timestamp outdate) {
		this.outdate = outdate;
	}
	
	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	@Override
	public String toString() {
		return "MemberVO [accno=" + accno + ", id=" + id + ", name=" + name + ", pwd=" + pwd + ", age=" + age
				+ ", email=" + email + ", tel=" + tel + ", point=" + point + ", regdate=" + regdate + ", outdate="
				+ outdate + ", card=" + card + "]";
	}

	

}
