package com.amanda.project.DTO;

public class MemberDTO {
	private int mem_seq;
	private String id;
	private String pw;
	private String name;
	private String birth;
	private String email;
	private String phone;
	private int point;
	public int getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public MemberDTO(String pw, String email, String phone) {
		super();
		this.pw = pw;
		this.email = email;
		this.phone = phone;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public MemberDTO() {
		super();
	}
	public MemberDTO(int mem_seq, String id, String pw, String name, String birth, String email, String phone,
			int point) {
		super();
		this.mem_seq = mem_seq;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.point = point;
	}
}
