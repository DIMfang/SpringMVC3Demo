package com.demo.model.models;

import java.util.Calendar;

import com.infrastructure.project.base.model.interfaces.ICUDEable;
import com.infrastructure.project.base.model.models.EnableEntity;

public class Project extends EnableEntity<Integer> implements ICUDEable{
	private String projectName;
	private Calendar createTime;
	private Calendar editTime;
	private Integer userId;

	public Calendar getEditTime() {
		return editTime;
	}

	public void setEditTime(Calendar editTime) {
		this.editTime = editTime;
	}

	
	public Calendar getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Calendar createTime) {
		this.createTime = createTime;
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
