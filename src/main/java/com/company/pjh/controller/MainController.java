package com.company.pjh.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	//메인페이지로 이동
	@RequestMapping(value= {"/","/main"}, method=RequestMethod.GET)	
	public String main() {
		return "main";
	}	

	//aboutUs 페이지로 이동
	@RequestMapping(value= {"/about"}, method=RequestMethod.GET)	
	public String about() {
		return "aboutus/about";
	}
}
