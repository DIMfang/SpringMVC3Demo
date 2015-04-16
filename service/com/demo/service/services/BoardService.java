package com.demo.service.services;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.demo.dao.interfaces.IBoardDao;
import com.demo.model.models.Board;
import com.demo.service.interfaces.IBoardService;
import com.infrastructure.project.base.service.services.EnableEntityService;
import com.infrastructure.project.common.exception.EntityOperateException;
import com.infrastructure.project.common.exception.ValidatException;

@Service("BoardService")
public class BoardService extends EnableEntityService<Integer, Board, IBoardDao> implements IBoardService {
	@Autowired
	public BoardService(@Qualifier("BoardDao")IBoardDao boardDao){	
		super(boardDao);
	}
	
	@Override
	public void saveBoard(Board board,Integer userId) throws EntityOperateException, ValidatException
	{   
		//board.setCreateTime(Calendar.getInstance());
		//board.setUserId(userId);
		super.save(board);
	}
	@Override
	public void updateBoard(Board board,Integer userId) throws EntityOperateException, ValidatException
	{   
		//project.setCreateTime(Calendar.getInstance());
		//project.setUserId(userId);
		super.update(board);
	}
	
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Board> getBoard() {
		Criteria boardCriteria = entityDao.getCriteria();	

        List<Board> items = boardCriteria.list();

		System.out.println("板子2," + items.size());
        
        return items;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Board> getPublicBoard(Integer userId) {
		Criteria boardCriteria = entityDao.getCriteria();	
	
		boardCriteria.add(Restrictions.eq("userId", userId)); 
    	
      
        List<Board> items = boardCriteria.list();
      
        
        return items;
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<Board> getPrivateBoard(Integer userId) {
		Criteria boardCriteria = entityDao.getCriteria();	
	
		boardCriteria.add(Restrictions.eq("userId", userId)); 
    	
      
        List<Board> items = boardCriteria.list();
      
        
        return items;
	}
}
