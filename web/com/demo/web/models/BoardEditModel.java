package com.demo.web.models;

import org.hibernate.validator.constraints.NotEmpty;

public class BoardEditModel {

	private Integer id;
	@NotEmpty(message="{BoardName.not.empty}")
	private String boardName;	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}


}
