package com.amanda.project.DTO;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ThreevisitDTO {
private Timestamp hour;
private int vcount;

public ThreevisitDTO() {
	super();
}
public ThreevisitDTO(Timestamp hour, int vcount) {
	super();
	this.hour = hour;
	this.vcount = vcount;
}
public Timestamp getHour() {
	return hour;
}
public ThreevisitDTO(int vcount) {
	super();
	this.vcount = vcount;
}
public void setHour(Timestamp hour) {
	this.hour = hour;
}
public int getVcount() {
	return vcount;
}
public void setVcount(int vcount) {
	this.vcount = vcount;
}



}
