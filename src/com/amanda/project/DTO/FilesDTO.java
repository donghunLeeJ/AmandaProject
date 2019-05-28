package com.amanda.project.DTO;

import java.util.ArrayList;
import java.util.List;

public class FilesDTO {
	private List<String> files = new ArrayList<>();
	private boolean flag = false;
	public FilesDTO(List<String> files, boolean flag) {
		super();
		this.files = files;
		this.flag = flag;
	}
	public FilesDTO() {
	}
	public List<String> getFiles() {
		return files;
	}
	public void setFiles(List<String> files) {
		this.files = files;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}


}
