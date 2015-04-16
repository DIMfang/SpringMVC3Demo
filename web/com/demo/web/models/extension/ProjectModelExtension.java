package com.demo.web.models.extension;


import com.demo.model.models.Project;
import com.demo.web.models.ProjectCreateModel;
import com.demo.web.models.ProjectEditModel;

public class ProjectModelExtension {
	public static Project toProject(ProjectCreateModel projectCreateModel){
		Project pro=new Project();
		pro.setProjectName(projectCreateModel.getProjectName());
		return pro;
	}
	public static Project toEditProject(ProjectEditModel editModel){
		Project ret =new Project();
		ret.setId(editModel.getId());
		ret.setProjectName(editModel.getProjectName());
	
		return ret;
	}
	
}
