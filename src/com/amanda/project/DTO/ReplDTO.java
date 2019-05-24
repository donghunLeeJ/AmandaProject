package com.amanda.project.DTO;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ReplDTO {
	private int contents_no;
	private int repl_seq;
	private String repl_writer;
	private String repl_contents;
	private Timestamp repl_time;
	public ReplDTO(int contents_no, int repl_seq, String repl_writer, String repl_contents, Timestamp repl_time) {
		super();
		this.contents_no = contents_no;
		this.repl_seq = repl_seq;
		this.repl_writer = repl_writer;
		this.repl_contents = repl_contents;
		this.repl_time = repl_time;
	}
	public ReplDTO(int repl_seq, String repl_writer, String repl_contents, Timestamp repl_time) {
		this.repl_seq = repl_seq;
		this.repl_writer = repl_writer;
		this.repl_contents = repl_contents;
		this.repl_time = repl_time;
	}
	public ReplDTO() {
	}
	public int getContents_no() {
		return contents_no;
	}
	public void setContents_no(int contents_no) {
		this.contents_no = contents_no;
	}
	public int getRepl_seq() {
		return repl_seq;
	}
	public void setRepl_seq(int repl_seq) {
		this.repl_seq = repl_seq;
	}
	public String getRepl_writer() {
		return repl_writer;
	}
	public void setRepl_writer(String repl_writer) {
		this.repl_writer = repl_writer;
	}
	public String getRepl_contents() {
		return repl_contents;
	}
	public void setRepl_contents(String repl_contents) {
		this.repl_contents = repl_contents;
	}
	public String getFormedTime() {
		long writeTime = this.repl_time.getTime();		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh : mm");
		return sdf.format(writeTime);
	}
	public String getRepl_time() {
		return this.getFormedTime();
	}

	public void setRepl_time(Timestamp repl_time) {
		this.repl_time = repl_time;
	}



}
