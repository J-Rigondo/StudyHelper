package com.company.pjh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.pjh.VOs.BoardVO;
import com.company.pjh.VOs.Pagination;
import com.company.pjh.VOs.ReplyVO;
import com.company.pjh.VOs.Search;
import com.company.pjh.services.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService bService;

	// 게시글 불러오기
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String board(Model model,@RequestParam(required=false, defaultValue="1") int page,
			@RequestParam(required=false, defaultValue="1") int range,
			@RequestParam(required=false, defaultValue="boardTitle") String searchType,
			@RequestParam(required=false) String keyword) throws Exception {
		
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int listCnt=bService.getBoardListCnt(search);		
		search.pageInfo(page, range, listCnt);	
		model.addAttribute("pagination",search);
		model.addAttribute("list", bService.getBoardList(search));
		return "board/board";
	}

	// 게시글 쓰기 페이지
	@RequestMapping(value = "/board/insertpage", method = RequestMethod.GET)
	public String insertBoard() {
		return "board/boardinsert";
	}

	// 게시글 쓰기

	@RequestMapping(value = "/board/insert", method = RequestMethod.POST)
	public String insertBoard(Model model, BoardVO vo) throws Exception {		
		bService.insertBoard(vo);		
		return "redirect:/board/list";
	}
	
	//해당 게시글 읽기
	@RequestMapping(value = "/board/read", method = RequestMethod.GET)
	public String readBoard(Model model,BoardVO vo,ReplyVO revo,@RequestParam("boardNo") int boardNo) throws Exception {
		vo = bService.readBoard(boardNo);
		bService.hitUp(boardNo);
		model.addAttribute("boardContent",vo);
		model.addAttribute("ReplyVO",revo);
		return "board/boardread";
	}
	
	//게시글 수정 페이지로 이동
	@RequestMapping(value = "/board/update", method = RequestMethod.GET)
	public String updateBoard(Model model,BoardVO vo, @RequestParam("boardNo") int boardNo) throws Exception {
		vo=bService.readBoard(boardNo);
		model.addAttribute("boardContent",vo);
		return "board/boardupdate";
	}
	
	//게시글 수정
	@RequestMapping(value = "/board/update/data", method = RequestMethod.POST)
	public String updateDataBoard(Model model,BoardVO vo) throws Exception {
		bService.updateBoard(vo);
		return "redirect:/board/list";
	}
	
	//게시글 삭제
	@RequestMapping(value = "/board/deleteb", method = RequestMethod.GET)
	public String deleteBoard(@RequestParam("boardNo") int boardNo) throws Exception {
		bService.deleteBoard(boardNo);
		return "redirect:/board/list";
	}

}
