package com.company.pjh.DAOs;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.pjh.VOs.RegisterVO;

@Repository
public class RegisterDAOImpl implements RegisterDAO {
	@Autowired
	private SqlSession sql;
	private static String namespace="bbs.mapper.registerMapper";
	
	//회원가입
	@Override
	public int register(RegisterVO vo) {		
		return sql.insert(namespace+".register", vo);
	}
	//아이디 중복검사
	@Override
	public int idCheck(RegisterVO vo) {			
		return sql.selectOne(namespace+".id_check",vo);
	}	
}
