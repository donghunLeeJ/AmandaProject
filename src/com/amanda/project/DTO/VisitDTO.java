package com.amanda.project.DTO;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class VisitDTO {
private Timestamp date;
private int vcount;
public VisitDTO(Timestamp date, int vcount) {
	super();
	this.date = date;
	this.vcount = vcount;
}
public VisitDTO() {
	super();
}
public String getDate() {
	SimpleDateFormat simpledate = new SimpleDateFormat("MM/dd");

	
	return simpledate.format(date);
}
public void setDate(Timestamp date) {
	this.date = date;
}
public int getVcount() {
	return vcount;
}
public void setVcount(int vcount) {
	this.vcount = vcount;
}
public VisitDTO(int vcount) {
	super();
	this.vcount = vcount;
}


}
