package com.ssh.pjt.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.pjt.common.PagingResult;
import com.ssh.pjt.common.ResultUtil;
import com.ssh.pjt.dao.BoardDao;
import com.ssh.pjt.dto.BoardDto;
import com.ssh.pjt.dto.PagingDto;
import com.ssh.pjt.form.PagingForm;


@Service
public class BoardService {

	protected final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	@Autowired
	BoardDao boardDao;
	
	@Transactional
	public int boardWrite_Action(BoardDto boardDto) throws Exception{
		
		logger.debug("==================== boardWrite_Action START ====================");
		
		int count = 0;
		
		count = boardDao.boardWrite_Action(boardDto);

		logger.debug("==================== boardWrite_Action END ====================");
		return count;
	}
	
	@Transactional
	public ResultUtil getBoardList(BoardDto boardDto) throws Exception{
		
		logger.debug("==================== getBoardList START ====================");
		
		ResultUtil resultUtil = new ResultUtil();
		
		PagingForm pagingForm = new PagingForm();
		
		int totalCount = boardDao.getBoardCnt(boardDto);
		if(totalCount != 0) {
			PagingDto pagingDto = new PagingDto();
			pagingDto.setFunction_name(boardDto.getFunction_name());
			pagingDto.setCurrent_page_no(boardDto.getCurrent_page_no());
			pagingDto.setCount_per_page(15);
			pagingDto.setCount_per_list(15);
			pagingDto.setTatal_list_count(totalCount);
			
			pagingForm = PagingResult.setPageUtil(pagingDto);
		}
		
		boardDto.setLimit(pagingForm.getLimit());
		boardDto.setOffset(pagingForm.getOffset());
		
		List<BoardDto> list = boardDao.getBoardList(boardDto);
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("totalCount", totalCount);
		resultMap.put("pagination", pagingForm.getPagination());
		
		resultUtil.setData(resultMap);
		resultUtil.setState("SUCCESS");
		
		 logger.debug("==================== getBoardList END ====================");
		 return resultUtil;
	}
	
	@Transactional
	public BoardDto getBoard(BoardDto boardDto) throws Exception{
		
		logger.debug("==================== getBoard START ====================");
		
		BoardDto dto = boardDao.getBoard(boardDto);
		
		logger.debug("==================== getBoard END ====================");
		return dto;
	}
	
	@Transactional
	public BoardDto getBoardDetail(int board_seq) throws Exception{
		
		logger.debug("==================== getBoardDetail START ====================");
		
		BoardDto dto = boardDao.getBoardDetail(board_seq);
		
		logger.debug("==================== getBoardDetail END ====================");
		return dto;
	}
	
	@Transactional
	public int boardModify_action(BoardDto boardDto) throws Exception{
		
		logger.debug("==================== boardModify_action START ====================");
		
		int count = 0;
		count = boardDao.boardModify_action(boardDto);
		
		logger.debug("==================== boardModify_action END ====================");
		return count;
	}
	
	@Transactional
	public int boardDelete(int board_seq) throws Exception{
		logger.debug("==================== boardDelete START ====================");
		
		int count = 0;
		count = boardDao.boardDelete(board_seq);
		
		logger.debug("==================== boardDelete END ====================");
		return count;
	}

	@Transactional
	public void boardHits(int board_seq) throws Exception{
		logger.debug("==================== boardHit START ====================");
		

		boardDao.boardHits(board_seq);
		
		logger.debug("==================== boardHit END ====================");

	}
}
