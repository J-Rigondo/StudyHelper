package com.company.pjh.DAOs;

import java.util.List;

import com.company.pjh.VOs.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> getReplyList(int boardNo) throws Exception;
	public int saveReply(ReplyVO revo) throws Exception;
	public void updateReply(ReplyVO revo) throws Exception;
	public void deleteReply(int replyNo) throws Exception;
}
