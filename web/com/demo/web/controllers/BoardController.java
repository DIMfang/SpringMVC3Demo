package com.demo.web.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.model.models.Board;
import com.demo.model.models.Project;
import com.demo.web.auth.AccountAuth;
import com.demo.web.auth.AuthHelper;
import com.demo.web.models.AccountLoginModel;
import com.demo.web.models.BoardModel;
import com.demo.web.models.ProjectCreateModel;
import com.demo.web.models.ProjectEditModel;
import com.demo.web.models.extension.ProjectModelExtension;
import com.infrastructure.project.common.exception.EntityOperateException;
import com.infrastructure.project.common.exception.ValidatException;

@Controller
@RequestMapping(value = "/board")
public class BoardController extends BaseController {
	  
	@RequestMapping(value = "/allBoards")
	    public void allBoards(HttpServletRequest request,Model model) { 	
		 if(!model.containsAttribute("boardModel")){
	            model.addAttribute("boardModel", new BoardModel());
	        } 
		 AccountAuth accountAuth=AuthHelper.getSessionAccountAuth(request);
		 System.out.println("该用户ID为" + accountAuth.getId());
		 List<Board> boards = new ArrayList<Board>();
		 boards = boardService.getBoard();
		 System.out.println("板子" + boards.size());
	     model.addAttribute("listBoardModel", boards);
	    }  
	
	@RequestMapping(value="/addBoard", method = {RequestMethod.GET})
    public String addBoard(Model model){
	
		if(!model.containsAttribute("addBoardModel"))
            model.addAttribute("addBoardModel", new AccountLoginModel());
        return "board/addBoard";
   
  
  }
	@RequestMapping(value="/addBoard", method = {RequestMethod.POST})
    public String createList(HttpServletRequest request, Model model, @Valid @ModelAttribute("listModel") ProjectCreateModel projectCreateModel, BindingResult result) throws EntityOperateException, ValidatException{
	
	
  	  String returnUrl = ServletRequestUtils.getStringParameter(request, "returnUrl", null);
   
     
      if(returnUrl==null)
			returnUrl="index";
		return "redirect:"+returnUrl;    
  }

	
	
	@RequestMapping(value = "/boardedit/{id}", method = {RequestMethod.POST})
    public @ResponseBody Project projectedit(HttpServletRequest request, @PathVariable(value="id") Integer id, @RequestBody ProjectEditModel editModel) throws EntityOperateException, ValidatException {
	
		System.out.println(id);
		String result1 = "{\"projectName\":\"" + editModel.getProjectName() + "\"}"; 
		System.out.println(result1);
		String result2 = "{\"id\":\"" + editModel.getId() + "\"}"; 
		System.out.println(result2);
		
        Project project=ProjectModelExtension.toEditProject(editModel);
        project.setId(id);
        AccountAuth accountAuth=AuthHelper.getSessionAccountAuth(request);
        projectService.updateProject(project,accountAuth.getId());
        return project;
       	
		
    }
	

	
	
}