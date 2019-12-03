package com.company.pjh.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.pjh.VOs.RegisterVO;
import com.company.pjh.services.RegisterService;



@Controller
public class RegisterController {
	@Autowired
	RegisterService service;
	
	//회원가입 페이지로 이동
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String register(Model model) {
		return "login/register";
	}
	
	//회원가입
	@RequestMapping(value = "/register/register", method = RequestMethod.POST)
	public @ResponseBody int registerCheck(Model model, RegisterVO vo) throws Exception {
		int result=service.register(vo);
		return result;
	}	
	
	//id 중복검사
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public @ResponseBody int idcheck(Model model, RegisterVO vo) throws Exception {
		int result = service.idCheck(vo);		
		return result;
	}
}
