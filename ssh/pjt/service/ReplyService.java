package com.ssh.pjt.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.pjt.common.ResultUtil;
import com.ssh.pjt.dao.ReplyDao;
import com.ssh.pjt.dto.ReplyDto;

@Service
public class ReplyService {

protected final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	@Autowired
	ReplyDao replyDao;
	
	@Transactional
	public int reply_insert(ReplyDto replyDto) throws Exception{
		
		logger.debug("==================== reply_insert START ====================");
		int count = 0;
		
		count = replyDao.reply_insert(replyDto);
		
		logger.debug("==================== reply_insert END ====================");
		return count;
		
	}
	
	@Transactional
	public ResultUtil reply_list(int seq) throws Exception{
		
		logger.debug("==================== reply_list START ====================");
		
		ResultUtil resultUtil = new ResultUtil();
		
		List<ReplyDto> list = replyDao.reply_list(seq);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("replyList", list);
		
		resultUtil.setData(resultMap);
		resultUtil.setState("SUCCESS");
		
		logger.debug("==================== reply_list END ====================");
		return resultUtil;
	}
	
	@Transactional
	public int reply_modify(ReplyDto replyDto) throws Exception{
		
		logger.debug("==================== reply_update START ====================");
		
		int count = 0;
		
		count = replyDao.reply_modify(replyDto);
		
		logger.debug("==================== reply_update END ====================");
		return count;
	}
	
	@Transactional
	public int reply_delete(int seq) throws Exception{
		
		logger.debug("==================== reply_delete START ====================");
		
		int count = 0;
		
		count = replyDao.reply_delete(seq);
		
		logger.debug("==================== reply_delete END ====================");
		return count;
	}
	
}
