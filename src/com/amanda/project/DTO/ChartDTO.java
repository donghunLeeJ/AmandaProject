package com.amanda.project.DTO;

public class ChartDTO {
	private String id;
	private int amount;
	public ChartDTO(String id, int amount) {
		super();
		this.id = id;
		this.amount = amount;
	}
	public ChartDTO() {
		super();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
}
