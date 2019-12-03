package com.company.pjh.DAOs;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.pjh.VOs.ReplyVO;

@Repository
public class ReplyDAOImple implements ReplyDAO{

	@Autowired
	private SqlSession sql;
	private static String namespace="bbs.mapper.replyMapper";
	
	@Override
	public List<ReplyVO> getReplyList(int boardNo) throws Exception {			
		return sql.selectList(namespace+".getList",boardNo);
	}

	@Override
	public int saveReply(ReplyVO revo) throws Exception {		
		return sql.insert(namespace+".saveReply",revo);
	}

	@Override
	public void updateReply(ReplyVO revo) throws Exception {
		sql.update(namespace+".updateReply",revo);		
	}

	@Override
	public void deleteReply(int replyNo) throws Exception {
		sql.delete(namespace+".deleteReply",replyNo);
		
	}

}
