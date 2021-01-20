package com.ssh.pjt.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.pjt.common.ResultUtil;
import com.ssh.pjt.dao.ClickGameDao;
import com.ssh.pjt.dao.MaxScoreDao;
import com.ssh.pjt.dao.PiheabammaDao;
import com.ssh.pjt.dto.ClickGameDto;
import com.ssh.pjt.dto.PiheabammaDto;

@Service
public class MaxScoreService {
protected final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	@Autowired
	MaxScoreDao maxScoreDao;
	@Autowired 
	PiheabammaDao piheabammaDao;
	@Autowired 
	ClickGameDao clickGameDao;
	
	@Transactional
	public ResultUtil ScoreList(String id, ClickGameDto clickGameDto, PiheabammaDto piheabammaDto) throws Exception{
			logger.debug("==================== ScoreList START ====================");
			ResultUtil resultUtil = new ResultUtil();
			
			PiheabammaDto piheabammaList = piheabammaDao.piheabamma_myMaxScore(id);
			PiheabammaDto maxPiheabammaList = piheabammaDao.piheabamma_maxScore(piheabammaDto);
			ClickGameDto clickGameList = clickGameDao.clickgame_myMaxScore(id);
			ClickGameDto maxClickGameList = clickGameDao.clickgame_maxScore(clickGameDto);
			
			
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("piheabammaList", piheabammaList);
			resultMap.put("maxPiheabammaList", maxPiheabammaList);
			resultMap.put("clickGameList", clickGameList);
			resultMap.put("maxClickGameList", maxClickGameList);

			
			resultUtil.setData(resultMap);
			resultUtil.setState("SUCCESS");;
			
			logger.debug("==================== ScoreList END ====================");
			
			return resultUtil;
		}
}
