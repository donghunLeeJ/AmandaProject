package com.amanda.project.DTO;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BoardDTO {
private String board_seq;
private String title;
private String contents;
private String writer;
private Timestamp writeDate;
private int viewCount;
private String ipAddr;
public BoardDTO(String board_seq, String title, String contents, String writer, Timestamp writeDate, int viewCount,
		String ipAddr) {
	super();
	this.board_seq = board_seq;
	this.title = title;
	this.contents = contents;
	this.writer = writer;
	this.writeDate = writeDate;
	this.viewCount = viewCount;
	this.ipAddr = ipAddr;
}
public BoardDTO(String title, String writer, Timestamp writeDate, String contents) {
	super();
	this.title = title;
	this.contents = contents;
	this.writer = writer;
	this.writeDate = writeDate;
}
public BoardDTO(String board_seq, String title, String writer, Timestamp writeDate, int viewCount) {
	super();
	this.board_seq = board_seq;
	this.title = title;
	this.writer = writer;
	this.writeDate = writeDate;
	this.viewCount = viewCount;
}
public BoardDTO(String title, String contents, String writer, int viewCount,
		String ipAddr) {
	super();
	this.title = title;
	this.contents = contents;
	this.writer = writer;
	this.viewCount = viewCount;
	this.ipAddr = ipAddr;
}
public String getFormedTime() {
	long currentTime = System.currentTimeMillis();
	long writeTime = this.writeDate.getTime();
	
	if(currentTime - writeTime < (1000 * 60 )) {
		long time = currentTime - writeTime;
		return time / 1000 + " 초 전";
	}else if((1000 * 60 ) <= currentTime - writeTime && currentTime - writeTime < (1000 * 60 * 60)) {
		long time = currentTime - writeTime;
		return time / 1000 / 60 + " 분 전";
	}else if((1000 * 60 * 60) <= currentTime - writeTime && currentTime - writeTime < (1000 * 60 * 60 * 24)) {
		long time = currentTime - writeTime;
		return time / 1000 / 60 / 60 + " 시간 전";
	}else {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		return sdf.format(writeTime);
	}
}

public BoardDTO() {
}
public String getBoard_seq() {
	return board_seq;
}
public void setBoard_seq(String board_seq) {
	this.board_seq = board_seq;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContents() {
	return contents;
}
public void setContents(String contents) {
	this.contents = contents;
}
public String getWriter() {
	return writer;
}
public void setWriter(String writer) {
	this.writer = writer;
}
public String getWriteDate() {
	return this.getFormedTime();
}
public void setWriteDate(Timestamp writeDate) {
	this.writeDate = writeDate;
}
public int getViewCount() {
	return viewCount;
}
public void setViewCount(int viewCount) {
	this.viewCount = viewCount;
}
public String getIpAddr() {
	return ipAddr;
}
public void setIpAddr(String ipAddr) {
	this.ipAddr = ipAddr;
}


}
