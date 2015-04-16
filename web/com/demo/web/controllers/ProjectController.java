package com.demo.web.controllers;

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

import com.demo.model.models.Project;
import com.demo.web.auth.AccountAuth;
import com.demo.web.auth.AuthHelper;
import com.demo.web.auth.AuthPassport;
import com.demo.web.models.ProjectCreateModel;
import com.demo.web.models.ProjectEditModel;
import com.demo.web.models.extension.ProjectModelExtension;
import com.infrastructure.project.common.exception.EntityOperateException;
import com.infrastructure.project.common.exception.ValidatException;

@Controller
@RequestMapping(value = "/home")
public class ProjectController extends BaseController {

//	//@RequestBody Test
//	@RequestMapping(value="/projectCreate", method = {RequestMethod.GET})
//    public String requestBodyBind(Model model){
//		
//		model.addAttribute("projectModel", new ProjectCreateModel());
//        return "projectCreate";
//    }
//	//失败的AJAX创建
//	@RequestMapping(value="/projectCreate", method = {RequestMethod.POST})
//    public @ResponseBody ProjectCreateModel requestBodyBind(HttpServletRequest request, @RequestBody ProjectCreateModel projectCreateModel) throws EntityOperateException, ValidatException{
//		   	System.out.println("Ajax过来了");
//	        String result1 = "{\"projectName\":\"" + projectCreateModel.getProjectName() + "\"}";  
//	        String result2 = "{\"ID\":\"" + projectCreateModel.getId() + "\"}";  
//	        String result3 = "{\"UserID\":\"" + projectCreateModel.getUserId() + "\"}";  
//	        String result4 = "{\"UserID\":\"" + projectCreateModel.getCreateTime() + "\"}"; 
//	        AccountAuth accountAuth=AuthHelper.getSessionAccountAuth(request);
//	    	
//	        System.out.println(accountAuth.getId());
//	        System.out.println(result1);
//	        System.out.println(result2);
//	        System.out.println(result3);
//	        System.out.println(result4);
//	  
//	      
//	        projectService.saveProject(ProjectModelExtension.toProject(projectCreateModel), accountAuth.getId());
//	    
//	        return projectCreateModel;
//    }
		
//	@RequestMapping(value="/projectCreate", method = {RequestMethod.GET})
//  public String createList(Model model){
//		if(!model.containsAttribute("listModel"))
//		model.addAttribute("listModel", new ProjectCreateModel());
//      return "projectCreate";
//  }
	
	@RequestMapping(value="/index", method = {RequestMethod.POST})
    public String createList(HttpServletRequest request, Model model, @Valid @ModelAttribute("listModel") ProjectCreateModel projectCreateModel, BindingResult result) throws EntityOperateException, ValidatException{
	
	  //如果有验证错误 返回到form页面
      if(result.hasErrors())
      return createList(request, model, projectCreateModel, result);

  	  String returnUrl = ServletRequestUtils.getStringParameter(request, "returnUrl", null);
      System.out.println("过来了");  
      String result1 = "{\"projectName\":\"" + projectCreateModel.getProjectName() + "\"}";  
      AccountAuth accountAuth=AuthHelper.getSessionAccountAuth(request);
      System.out.println(result1);
      
      projectService.saveProject(ProjectModelExtension.toProject(projectCreateModel), accountAuth.getId());
      if(returnUrl==null)
			returnUrl="index";
		return "redirect:"+returnUrl;    
  }
	
//	@RequestMapping(value = "/projectedit/{id}", method = {RequestMethod.GET})
//	public String projectedit(Model model, @PathVariable(value="id") Integer id) throws ValidatException{	
//		System.out.println("进来编辑");
//		if(!model.containsAttribute("projectEditModel")){
//			ProjectEditModel projectEditModel=ProjectModelExtension.toProjectEditModel(projectService.get(id));
//			model.addAttribute("projectEditModel", projectEditModel);
//		}
//		return "projectEditModel";	
//	}
	
	
	@RequestMapping(value = "/projectedit/{id}", method = {RequestMethod.POST})
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