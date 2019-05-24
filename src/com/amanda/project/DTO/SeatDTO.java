package com.amanda.project.DTO;

public class SeatDTO {
	
	
//각각 자리번호,컴퓨터 ip, 컴퓨터 사용유무가 담긴 변수임(데이터베이스에서 comUseCheck의 기본값은 0이다.)
private int seatnumber;	
private String comip;
private String comusecheck;


public SeatDTO(int seatnumber, String comip, String comusecheck) {
	super();
	this.seatnumber = seatnumber;
	this.comip = comip;
	this.comusecheck = comusecheck;
}


public int getSeatnumber() {
	return seatnumber;
}
public void setSeatnumber(int seatnumber) {
	this.seatnumber = seatnumber;
}
public String getComip() {
	return comip;
}
public void setComip(String comip) {
	this.comip = comip;
}
public String getComusecheck() {
	return comusecheck;
}
public void setComusecheck(String comusecheck) {
	this.comusecheck = comusecheck;
}



}
