package com.demo.service.interfaces;

import java.util.List;

import com.demo.dao.interfaces.IProjectDao;
import com.demo.model.models.Project;
import com.infrastructure.project.base.service.interfaces.IEnableEntityService;
import com.infrastructure.project.common.exception.EntityOperateException;
import com.infrastructure.project.common.exception.ValidatException;



public interface IProjectService extends IEnableEntityService<Integer, Project, IProjectDao> {
	public void saveProject(Project Project,Integer userId) throws EntityOperateException, ValidatException;
	public List<Project> getAllProjects(Integer userId);
	public void updateProject(Project Project,Integer userId) throws EntityOperateException, ValidatException;

}