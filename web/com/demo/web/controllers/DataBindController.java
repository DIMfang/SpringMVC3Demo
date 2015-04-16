package com.demo.web.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.web.models.AccountModel;

@Controller
@RequestMapping(value = "/databind")
public class DataBindController {


	
	//@RequestBody Test
	@RequestMapping(value="/requestbodybind", method = {RequestMethod.GET})
    public String requestBodyBind(Model model){
		
		model.addAttribute("accountmodel", new AccountModel());
        return "requestbodybind";
    }
	
	@RequestMapping(value="/requestbodybind", method = {RequestMethod.POST})
    public @ResponseBody AccountModel requestBodyBind(@RequestBody AccountModel accountModel){
				
		return accountModel;
    }
		
}