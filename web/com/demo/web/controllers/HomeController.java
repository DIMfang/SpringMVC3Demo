package com.demo.web.controllers;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.models.Project;
import com.demo.web.auth.AccountAuth;
import com.demo.web.auth.AuthHelper;
import com.demo.web.auth.AuthPassport;
import com.demo.web.models.ProjectCreateModel;
import com.infrastructure.project.common.exception.EntityOperateException;
import com.infrastructure.project.common.exception.ValidatException;

@Controller
@RequestMapping(value = "/home")
public class HomeController extends BaseController {  

	
	
	@AuthPassport
    @RequestMapping(value = "/hello")
    public ModelAndView hello() throws EntityOperateException, ValidatException, SQLException { 

    	//UserService userService=new UserService();
    	
    	//userService.delete(2);
    	throw new SQLException("数据库链接错误。");
    	
        //1、收集参数  
        //2、绑定参数到命令对象  
        //3、调用业务对象  
        //4、选择下一个页面  
        /*ModelAndView mv = new ModelAndView();  
        //添加模型数据 可以是任意的POJO对象  
        mv.addObject("message", "Hello World!");  
        //设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面,如果不指定具体得视图，则会根据URL寻找对应的视图
        mv.setViewName("home/hello");  
        return mv;*/
    }  
    
   // @AuthPassport //自动跳转 拦截
    @RequestMapping(value = "/index")
    public void index(HttpServletRequest request,Model model) { 	
    	 if(!model.containsAttribute("listModel")){
	            model.addAttribute("listModel", new ProjectCreateModel());
	        } 
    	 AccountAuth accountAuth=AuthHelper.getSessionAccountAuth(request);
    	 System.out.println("该用户ID为" + accountAuth.getId());
    	 List<Project> projects = new ArrayList<Project>();
	        projects = projectService.getAllProjects(accountAuth.getId());
	        System.out.println("项目" + projects.size());
	    model.addAttribute("listContentModel", projects);
    }  
   
//	
//    @RequestMapping(value="/index", method = {RequestMethod.POST})
//    public @ResponseBody ProjectCreateModel createList(@RequestBody ProjectCreateModel projectCreateModel) throws EntityOperateException, ValidatException{
//        
//        //如果有验证错误 返回到form页面
//        //if(result.hasErrors())
//        //return index(model);
//    	//String returnUrl = ServletRequestUtils.getStringParameter(request, "returnUrl", null);
//        System.out.println("过来了");  
//        String result1 = "{\"projectName\":\"" + projectCreateModel.getProjectName() + "\"}";  
//          
//        System.out.println(result1);
//         
//        projectService.saveProject(ProjectCreateModelExtension.toProject(projectCreateModel));
////        if(returnUrl==null)
////			returnUrl="index";
////		return "redirect:"+returnUrl;    
//        return projectCreateModel;
//    }
    
    @RequestMapping(value = "/notfound")
    public ModelAndView notfound() { 
    	
    	ModelAndView mv = new ModelAndView();  
    	mv.setViewName("404");  
    	
    	return mv;  
    }
}  
