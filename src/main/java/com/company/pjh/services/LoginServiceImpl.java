package com.company.pjh.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.pjh.DAOs.LoginDAO;
import com.company.pjh.VOs.LoginVO;
import com.company.pjh.VOs.RegisterVO;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	private LoginDAO dao;

	@Override
	public LoginVO loginCheck(LoginVO vo) {
		return dao.loginCheck(vo);
	}


	
	
	

}
