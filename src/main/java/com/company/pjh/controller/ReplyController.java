package com.company.pjh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.company.pjh.VOs.ReplyVO;
import com.company.pjh.services.ReplyService;

@RestController
public class ReplyController {
	@Autowired
	ReplyService rservice;
	
	@RequestMapping(value="/reply/list", method=RequestMethod.POST)
	public List<ReplyVO> getReplyList(@RequestParam("boardNo") int boardNo) throws Exception{		
		return rservice.getReplyList(boardNo);
	}
	
	@RequestMapping(value="/reply/save", method=RequestMethod.POST)
	public @ResponseBody Object saveReply(@RequestBody ReplyVO revo) throws Exception{
		Map<String,Object> result=new HashMap<>();
		try {
			rservice.saveReply(revo);
			result.put("status",true);
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status",false);
		}
		return result;
	}
	
	@RequestMapping(value = "/reply/update", method = RequestMethod.POST)
	public Map<String, Object> updateReply(@RequestBody ReplyVO revo) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			rservice.updateReply(revo);
			result.put("status", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", false);
		}
		return result;
	}

	
	@RequestMapping(value="/reply/delete", method=RequestMethod.POST)
	public void deleteReply(@RequestParam("replyNo") int replyNo ) throws Exception{
		rservice.deleteReply(replyNo);
	}
}
