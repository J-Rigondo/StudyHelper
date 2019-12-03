package com.company.pjh.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.pjh.DAOs.ReplyDAO;
import com.company.pjh.VOs.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyDAO dao;
	
	@Override
	public List<ReplyVO> getReplyList(int boardNo) throws Exception {
		return dao.getReplyList(boardNo);
	}

	@Override
	public int saveReply(ReplyVO revo) throws Exception {		
		return dao.saveReply(revo);
	}

	@Override
	public void updateReply(ReplyVO revo) throws Exception {
		dao.updateReply(revo);		
	}

	@Override
	public void deleteReply(int replyNo) throws Exception {
		dao.deleteReply(replyNo);		
	}

}
