package com.demo.web.models;

import org.hibernate.validator.constraints.NotEmpty;

public class ProjectEditModel {

	private Integer id;
	@NotEmpty(message="{projectName.not.empty}")
	private String projectName;	
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


}
