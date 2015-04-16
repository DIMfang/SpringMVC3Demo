package com.demo.web.models;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotEmpty;

public class BoardModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	public BoardModel(){};
	
	
	@NotEmpty(message="{boardName.not.empty}")
	private String boardName;
	private Integer projectNumber;
	private Integer id;
	private Integer boardType;
	private String host;


	
	
	
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public Integer getProjectNumber() {
		return projectNumber;
	}
	public void setProjectNumber(Integer projectNumber) {
		this.projectNumber = projectNumber;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getBoardType() {
		return boardType;
	}
	public void setBoardType(Integer boardType) {
		this.boardType = boardType;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}

}
