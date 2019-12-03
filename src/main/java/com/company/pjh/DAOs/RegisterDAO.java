package com.company.pjh.DAOs;

import com.company.pjh.VOs.RegisterVO;

public interface RegisterDAO {
	public int register(RegisterVO vo);
    public int idCheck(RegisterVO vo);
}
