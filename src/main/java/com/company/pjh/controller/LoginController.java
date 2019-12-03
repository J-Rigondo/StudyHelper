package com.company.pjh.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.pjh.VOs.LoginVO;

import com.company.pjh.services.LoginService;

@Controller
public class LoginController {
	@Autowired
	LoginService service;
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	// 로그인 페이지로 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		return "login/login";
	}

	// 로그인 검사
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public @ResponseBody int loginPost(Model model, LoginVO vo, HttpSession session) {
		String id = vo.getUserId();
		vo = service.loginCheck(vo);
		if (vo.getCount() > 0) {
			session.setAttribute("id", id);
		}
		return vo.getCount();
	}

	// 회원가입 페이지로 이동
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logOut(Model model, HttpSession session) {
		session.invalidate();
		return "main";
	}

	// 회원가입 페이지로 이동
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model) {
		return "login/register";
	}
}
