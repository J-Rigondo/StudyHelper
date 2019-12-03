package com.company.pjh.services;

import java.util.List;

import com.company.pjh.VOs.BoardVO;
import com.company.pjh.VOs.Pagination;
import com.company.pjh.VOs.Search;


public interface BoardService {
	public List<BoardVO> getBoardList(Search search) throws Exception;
	public int insertBoard(BoardVO vo)  throws Exception;
	public BoardVO readBoard(int boardNo)  throws Exception; 
	public void deleteBoard(int boardNo) throws Exception;		
	public void updateBoard(BoardVO vo) throws Exception;
	public void hitUp(int boardNo) throws Exception;
	public int getBoardListCnt(Search search) throws Exception;
}
