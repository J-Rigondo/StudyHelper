package com.company.pjh.DAOs;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.pjh.VOs.BoardVO;
import com.company.pjh.VOs.Pagination;
import com.company.pjh.VOs.Search;


@Repository
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private SqlSession sql;
	
	private static String namespace="bbs.mapper.boardMapper";
	
	@Override
	public List<BoardVO> getBoardList(Search search) throws Exception {		
		return sql.selectList(namespace+".getList",search);
	}

	@Override
	public BoardVO readBoard(int boardNo) {		
		return sql.selectOne(namespace+".readBoard",boardNo);
	}

	@Override
	public int insertBoard(BoardVO vo) {		
		return sql.insert(namespace+".insertBoard",vo);
	}

	@Override
	public void deleteBoard(int boardNo) {		
		sql.delete(namespace+".deleteBoard",boardNo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		sql.update(namespace+".updateBoard",vo);		
	}

	@Override
	public void hitUp(int boardNo) {
		sql.update(namespace+".hitUp",boardNo);
		
	}

	@Override
	public int getBoardListCnt(Search search) throws Exception {
		return sql.selectOne(namespace+".getListCnt",search);
	}
	
}
