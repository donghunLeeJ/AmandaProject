package com.amanda.project.DTO;

import java.sql.Date;

public class SendMailDTO {
	
	private String id;
	private String email;
	private String pwcode;
	private Date timelimit;
	
	public SendMailDTO() {
		super();
	}

	public SendMailDTO(String id, String email, String pwcode) {
		super();
		this.id = id;
		this.email = email;
		this.pwcode = pwcode;
	}

	public SendMailDTO(String id, String email, String pwcode, Date timelimit) {
		super();
		this.id = id;
		this.email = email;
		this.pwcode = pwcode;
		this.timelimit = timelimit;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwcode() {
		return pwcode;
	}

	public void setPwcode(String pwcode) {
		this.pwcode = pwcode;
	}

	public Date getTimelimit() {
		return timelimit;
	}

	public void setTimelimit(Date timelimit) {
		this.timelimit = timelimit;
	}

	
	
	
}
