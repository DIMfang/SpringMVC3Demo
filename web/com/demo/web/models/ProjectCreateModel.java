package com.demo.web.models;


import java.io.Serializable;
import java.util.Calendar;

import org.hibernate.validator.constraints.NotEmpty;

public class ProjectCreateModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6080132470127595553L;

	/**
	 * 
	 */
	public ProjectCreateModel(){}
	
	@NotEmpty(message="{projectName.not.empty}")
	private String projectName;
	private Integer userId;
	private Integer id;
	private Calendar createTime;

	public Calendar getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Calendar createTime) {
		this.createTime = createTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}




	
}
