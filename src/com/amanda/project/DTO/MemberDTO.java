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
	private String postcode;
	private String address1;
	private String address2;
	private int usehour;
	
	public MemberDTO() {}
	
	
	public MemberDTO(int mem_seq, String id, String name, String phone, int usehour) {
		super();
		this.mem_seq = mem_seq;
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.usehour = usehour;
	}


	public MemberDTO(int mem_seq, String id, String pw, String name, String birth, String email, String phone,
			int point, String postcode, String address1, String address2) {
		super();
		this.mem_seq = mem_seq;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.point = point;
		this.postcode = postcode;
		this.address1 = address1;
		this.address2 = address2;
	}
	
	

	public MemberDTO(int mem_seq, String id, String pw, String name, String birth, String email, String phone,
			int point, String postcode, String address1, String address2, int usehour) {
		super();
		this.mem_seq = mem_seq;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.point = point;
		this.postcode = postcode;
		this.address1 = address1;
		this.address2 = address2;
		this.usehour = usehour;
	}


	public MemberDTO(String id, String pw, String email, String phone) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.phone = phone;
	}
	public MemberDTO(String id, String email) {
		super();
		this.id = id;
		this.email = email;
	}
	public MemberDTO(String id, String pw, String name, String birth, String email, String phone) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
	}
	
	
	public MemberDTO(String pw, String email, String phone) {
		super();
		this.pw = pw;
		this.email = email;
		this.phone = phone;
	}
	
	public MemberDTO(String id,String pw, String name, String birth,String email,String phone,String postcode, String address1, String address2) {
		super();
		this.id=id;
		this.pw=pw;
		this.name=name;
		this.birth=birth;
		this.email=email;
		this.phone=phone;
		this.postcode=postcode;
		this.address1=address1;
		this.address2=address2;
	}
	
	
	public MemberDTO(int mem_seq, String name, String phone, int usehour) {
		super();
		this.mem_seq = mem_seq;
		this.name = name;
		this.phone = phone;
		this.usehour = usehour;
	}


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
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}


	public int getUsehour() {
		return usehour;
	}


	public void setUsehour(int usehour) {
		this.usehour = usehour;
	}
	
	
}
