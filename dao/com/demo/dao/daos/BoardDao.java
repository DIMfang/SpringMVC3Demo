package com.demo.dao.daos;

import org.springframework.stereotype.Repository;

import com.demo.dao.interfaces.IBoardDao;
import com.demo.model.models.Board;
import com.infrastructure.project.base.dao.daos.EnableEntityDao;

@Repository("BoardDao")
public class BoardDao extends EnableEntityDao<Integer, Board> implements IBoardDao{
}
