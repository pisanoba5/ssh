package com.ssh.pjt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssh.pjt.common.ResultUtil;
import com.ssh.pjt.dto.BoardDto;
import com.ssh.pjt.service.BoardService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	BoardService boardService;
	
		@RequestMapping(value="/boardWrite")
		public String boardWrite() {
			return "/board/boardWrite";
		}
		
		@RequestMapping(value="/boardWrite_Action", method = RequestMethod.POST)
		@ResponseBody
		public int boardWrite_Action(BoardDto boardDto) throws Exception{
			int count = 0;
			
			count = boardService.boardWrite_Action(boardDto);
			System.out.println(count);
			return count;
		}
		
		@RequestMapping(value="/boardList")
		public String boardList() {
			return "/board/boardList";
		}
		
		@RequestMapping(value="/boardList_Action",  method = RequestMethod.POST)
		@ResponseBody
		public ResultUtil getBoardList(BoardDto boardDto) throws Exception{
			
			
			ResultUtil resultUtils = boardService.getBoardList(boardDto);

			
			return resultUtils;
			
		}
		
		@RequestMapping(value="/boardDetail", method = RequestMethod.GET)
		public String boardDetail(@RequestParam("board_seq") int board_seq, BoardDto boardDto, Model model) throws Exception{
			
			boardService.boardHits(board_seq);
			boardDto = boardService.getBoardDetail(board_seq);
			model.addAttribute("board", boardDto);
			
			return "/board/boardDetail";
		}
		
		@RequestMapping(value="/boardModify", method = RequestMethod.POST)
		public String boardModify(BoardDto boardDto, Model model) throws Exception{
			
			BoardDto dto = boardService.getBoard(boardDto);
			model.addAttribute("board", dto);
			
			return "/board/boardModify";
		}
		
		@RequestMapping(value="/boardModify_action", method = RequestMethod.POST)
		@ResponseBody
		public int boardModify_action(BoardDto boardDto, Model model) throws Exception{
			
			int count = 0;
			
			 count = boardService.boardModify_action(boardDto);
			
			return count;
			
		}
		
		@RequestMapping(value="/boardDelete_action", method = RequestMethod.POST)
		@ResponseBody
		public int boardDelete_action(@RequestParam("board_seq") int board_seq, Model model) throws Exception{
			
			int count = 0;
			
			count = boardService.boardDelete(board_seq);
			
			return count;
		}
	
}
