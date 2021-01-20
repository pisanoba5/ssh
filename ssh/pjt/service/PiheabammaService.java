package com.ssh.pjt.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssh.pjt.common.ResultUtil;
import com.ssh.pjt.dao.PiheabammaDao;
import com.ssh.pjt.dto.PiheabammaDto;

@Service
public class PiheabammaService {
protected final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	@Autowired
	PiheabammaDao piheabammaDao;
	
	@Transactional
	public void piheabamma_insert(PiheabammaDto piheabammaDto) throws Exception{
			
			logger.debug("==================== piheabamma_insert START ====================");
			
			 piheabammaDao.piheabamma_insert(piheabammaDto);
			 
			logger.debug("==================== piheabamma_insert END ====================");
		
		}
	
	@Transactional
	public ResultUtil piheabamma_select(PiheabammaDto piheabammaDto) throws Exception{
			logger.debug("==================== piheabamma_select START ====================");
			ResultUtil resultUtil = new ResultUtil();
			
			List<PiheabammaDto> piheabammaList = piheabammaDao.piheabamma_select(piheabammaDto);
			
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("list", piheabammaList);
			
			resultUtil.setData(resultMap);
			resultUtil.setState("SUCCESS");;
			
			logger.debug("==================== piheabamma_select END ====================");
			
			return resultUtil;
		}
	
	@Transactional
	public PiheabammaDto piheabamma_myMaxScore(String id) throws Exception{
		logger.debug("==================== piheabamma_myMaxScore START ====================");
		 
		logger.debug("==================== piheabamma_myMaxScore END ====================");
		return  piheabammaDao.piheabamma_myMaxScore(id);
	}
	
	@Transactional
	public PiheabammaDto piheabamma_maxScore(PiheabammaDto piheabammaDto) throws Exception{
		logger.debug("==================== piheabamma_insert START ====================");
		 
		logger.debug("==================== piheabamma_insert END ====================");
		return  piheabammaDao.piheabamma_maxScore(piheabammaDto);
	}
}
