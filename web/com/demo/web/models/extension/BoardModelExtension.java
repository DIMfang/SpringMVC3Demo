package com.demo.web.models.extension;

import com.demo.model.models.Board;
import com.demo.web.models.BoardModel;

public class BoardModelExtension {
	public static Board toBoard(BoardModel boardModel){
		Board pro=new Board();
		pro.setBoardName(boardModel.getBoardName());
		return pro;
	}
	public static Board toEditBoard(Board editModel){
		Board ret =new Board();
		ret.setId(editModel.getId());
		ret.setBoardName(editModel.getBoardName());
	
		return ret;
	}
}
