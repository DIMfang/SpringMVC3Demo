package com.demo.service.services;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.demo.dao.interfaces.IProjectDao;
import com.demo.model.models.Project;
import com.demo.service.interfaces.IProjectService;
import com.infrastructure.project.base.service.services.EnableEntityService;
import com.infrastructure.project.common.exception.EntityOperateException;
import com.infrastructure.project.common.exception.ValidatException;

@Service("ProjectService")
public class ProjectService extends EnableEntityService<Integer, Project, IProjectDao> implements IProjectService {
	@Autowired
	public ProjectService(@Qualifier("ProjectDao")IProjectDao projectDao){	
		super(projectDao);
	}
	

	
	@Override
	public void saveProject(Project project,Integer userId) throws EntityOperateException, ValidatException
	{   
		project.setCreateTime(Calendar.getInstance());
		project.setUserId(userId);
		super.save(project);
	}
	@Override
	public void updateProject(Project project,Integer userId) throws EntityOperateException, ValidatException
	{   
		project.setCreateTime(Calendar.getInstance());
		project.setUserId(userId);
		super.update(project);
	}
	
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Project> getAllProjects(Integer userId) {
		Criteria projectCriteria = entityDao.getCriteria();	
	
		projectCriteria.add(Restrictions.eq("userId", userId)); 
    	
      
        List<Project> items = projectCriteria.list();

		 System.out.println("项目2," + items.size());
        
        return items;
	}

}
