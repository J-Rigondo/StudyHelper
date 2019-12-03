package com.company.pjh.DAOs;

import com.company.pjh.VOs.LoginVO;
import com.company.pjh.VOs.RegisterVO;

public interface LoginDAO {
	public LoginVO loginCheck(LoginVO vo);
}
