package com.company.pjh.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.pjh.DAOs.RegisterDAO;
import com.company.pjh.VOs.RegisterVO;

@Service
public class RegisterServiceImpl implements RegisterService{

	@Autowired
	RegisterDAO dao;
	public int register(RegisterVO vo) {		
		return dao.register(vo);
	}

	@Override
	public int idCheck(RegisterVO vo) {		
		return dao.idCheck(vo);
	}
	
}
