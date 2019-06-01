package com.amanda.project.DTO;

import java.sql.Timestamp;

public class MenuDTO {
	private int menu_seq;
	private String id;
	private String name;
	private String price;
	private Timestamp time;
	
	
	public MenuDTO() {}
	
	public MenuDTO(int menu_seq, String id, String name, String price, Timestamp time) {
		super();
		this.menu_seq = menu_seq;
		this.id = id;
		this.name = name;
		this.price = price;
		this.time = time;
	}
	public int getMenu_seq() {
		return menu_seq;
	}
	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	
	
	
	
	
	
}
