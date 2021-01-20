package com.ssh.pjt.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.pjt.common.ResultUtil;
import com.ssh.pjt.dao.ClickGameDao;
import com.ssh.pjt.dto.ClickGameDto;

@Service
public class ClickGameService {

	protected final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	@Autowired
	ClickGameDao clickGameDao;
	
	@Transactional
	public int clickGame_insert(ClickGameDto clickGameDto) throws Exception{
			
			logger.debug("==================== clickGame_insert START ====================");
			
			int count = 0;
			
			count = clickGameDao.clickGame_insert(clickGameDto);
	
			logger.debug("==================== clickGame_insert END ====================");
			return count;
		}
	
	@Transactional
	public ResultUtil clickGame_select(ClickGameDto clickGameDto) throws Exception{
			logger.debug("==================== clickGame_select START ====================");
			ResultUtil resultUtil = new ResultUtil();
			
			List<ClickGameDto> clickgame = clickGameDao.clickGame_select(clickGameDto);
			
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("list", clickgame);
			
			resultUtil.setData(resultMap);
			resultUtil.setState("SUCCESS");;
			
			logger.debug("==================== clickGame_select END ====================");
			
			return resultUtil;
		}
	
	@Transactional
	public boolean clickGame_scoreCheck(ClickGameDto clickGameDto) throws Exception{
		
		logger.debug("==================== clickGame_scoreCheck START ====================");
		
		boolean result = clickGameDao.clickGame_scoreCheck(clickGameDto);
		
		logger.debug("==================== clickGame_scoreCheck END ====================");
		
		return result;
	}
	
	@Transactional
	public int clickGame_count(ClickGameDto clickGameDto) throws Exception{
		
		logger.debug("==================== clickGame_count START ====================");
		
		int count = clickGameDao.clickGame_count(clickGameDto);
		
		logger.debug("==================== clickGame_count END ====================");
		
		return count;
	}
	
	@Transactional
	public void clickGame_maxDelete() throws Exception{
		
		logger.debug("==================== clickGame_maxDelete START ====================");
		
		 clickGameDao.clickGmae_maxDelete();
		
		logger.debug("==================== clickGame_maxDelete END ====================");
		
	}
	
	@Transactional
	public ClickGameDto clickGame_myMaxScore(String id) throws Exception{
		logger.debug("==================== clickGame_myMaxScore START ====================");

		logger.debug("==================== clickGame_myMaxScore END ====================");
		return clickGameDao.clickgame_myMaxScore(id);
	}
	
	@Transactional
	public ClickGameDto clickGame_maxScore(ClickGameDto clickGameDto) throws Exception{
		logger.debug("==================== clickGame_maxScore START ====================");

		logger.debug("==================== clickGame_myMaxScore END ====================");
		return clickGameDao.clickgame_maxScore(clickGameDto);
	}

}
