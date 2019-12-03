package com.company.pjh.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.pjh.DAOs.BoardDAO;
import com.company.pjh.VOs.BoardVO;
import com.company.pjh.VOs.Pagination;
import com.company.pjh.VOs.Search;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO dao;
	
	@Override
	public List<BoardVO> getBoardList(Search search) throws Exception {		
		return dao.getBoardList(search);
	}

	@Override
	public BoardVO readBoard(int boardNo) throws Exception{		
		return dao.readBoard(boardNo);
	}

	@Override
	public int insertBoard(BoardVO vo) throws Exception {		
		return dao.insertBoard(vo);
	}

	@Override
	public void deleteBoard(int boardNo) throws Exception {		
		dao.deleteBoard(boardNo);
	}

	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		dao.updateBoard(vo);		
	}

	@Override
	public void hitUp(int boardNo) throws Exception {
		dao.hitUp(boardNo);
		
	}

	@Override
	public int getBoardListCnt(Search search) throws Exception {		
		return dao.getBoardListCnt(search);
	}

}
