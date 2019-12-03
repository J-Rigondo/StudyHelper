package com.company.pjh.DAOs;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.pjh.VOs.LoginVO;
@Repository
public class LoginDAOImpl implements LoginDAO {
	@Autowired
	private SqlSession sql;
	private static String namespace="bbs.mapper.loginMapper";
	
	@Override
	public LoginVO loginCheck(LoginVO vo) {		
		return sql.selectOne(namespace+".login_check",vo);
	}
}
