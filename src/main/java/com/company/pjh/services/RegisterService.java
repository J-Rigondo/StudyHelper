package com.company.pjh.services;

import com.company.pjh.VOs.RegisterVO;

public interface RegisterService {
	public int register(RegisterVO vo);
    public int idCheck(RegisterVO vo);
}
