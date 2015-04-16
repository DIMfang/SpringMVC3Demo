package com.demo.dao.daos;

import org.springframework.stereotype.Repository;

import com.demo.model.models.Project;
import com.demo.dao.interfaces.IProjectDao;
import com.infrastructure.project.base.dao.daos.EnableEntityDao;

@Repository("ProjectDao")
public class ProjectDao extends EnableEntityDao<Integer, Project> implements IProjectDao{

}
