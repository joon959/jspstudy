package com.yong.member;

import java.sql.*;

public class MemberDTO {
	private int idx;
	private String id;
	private String name;
	private String pwd;
	private String email;
	private String addr;
	private String tel;
	private Date joindate;
	
	public MemberDTO() {
		super();
		System.out.println("DTO!!!");
	}
	
	public MemberDTO(int idx, String id, String name, String pwd, String email, 
				String addr, String tel, Date joindate) {
		super();
		this.idx = idx;
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.addr = addr;
		this.tel = tel;
		this.joindate = joindate;
	}

	public MemberDTO(String id) {
		super();
		this.id = id;
	}
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getDate() {
		return joindate;
	}

	public void setDate(Date date) {
		this.joindate = date;
	}

	

}
