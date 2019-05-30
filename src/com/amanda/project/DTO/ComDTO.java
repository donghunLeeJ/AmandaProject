package com.amanda.project.DTO;

public class ComDTO {
	private String seatNum;
	private String ip;
	private String onOff;
	public ComDTO(String seatNum, String ip, String onOff) {
		super();
		this.seatNum = seatNum;
		this.ip = ip;
		this.onOff = onOff;
	}
	public String getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getOnOff() {
		return onOff;
	}
	public void setOnOff(String onOff) {
		this.onOff = onOff;
	}
	public ComDTO() {
		super();
	}
}
