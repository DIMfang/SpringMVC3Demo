package com.demo.service.interfaces;

import java.util.List;

import com.demo.dao.interfaces.IBoardDao;
import com.demo.model.models.Board;
import com.infrastructure.project.base.service.interfaces.IEnableEntityService;
import com.infrastructure.project.common.exception.EntityOperateException;
import com.infrastructure.project.common.exception.ValidatException;

public interface IBoardService extends IEnableEntityService<Integer, Board, IBoardDao>{
	public void saveBoard(Board Board,Integer userId) throws EntityOperateException, ValidatException;
	public List<Board> getBoard();
	public List<Board> getPublicBoard(Integer userId);
	public List<Board> getPrivateBoard(Integer userId);
	public void updateBoard(Board Board,Integer userId) throws EntityOperateException, ValidatException;

}
