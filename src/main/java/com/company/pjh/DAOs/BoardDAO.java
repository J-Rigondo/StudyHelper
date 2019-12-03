package com.company.pjh.DAOs;

import java.util.List;

import com.company.pjh.VOs.BoardVO;
import com.company.pjh.VOs.Pagination;
import com.company.pjh.VOs.Search;


public interface BoardDAO {
	public List<BoardVO> getBoardList(Search search) throws Exception;
	public int insertBoard(BoardVO vo);
	public BoardVO readBoard(int boardNo);
	public void deleteBoard(int boardNo);	
	public void updateBoard(BoardVO vo);
	public void hitUp(int boardNo);
	public int getBoardListCnt(Search search) throws Exception;
}
