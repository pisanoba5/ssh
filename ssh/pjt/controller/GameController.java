package com.ssh.pjt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssh.pjt.common.ResultUtil;
import com.ssh.pjt.dto.ClickGameDto;
import com.ssh.pjt.dto.PiheabammaDto;
import com.ssh.pjt.service.ClickGameService;
import com.ssh.pjt.service.PiheabammaService;

@Controller
@RequestMapping(value = "/game")
public class GameController {
	
	@Autowired
	ClickGameService clickGameService;
	@Autowired
	PiheabammaService piheabammaService;

	@RequestMapping(value="/clickgame")
	public String clickgame() {
		return "/game/clickgame";
	}
	
	@RequestMapping(value="/clickGameSelect")
	@ResponseBody
	public ResultUtil clickGameSelect(ClickGameDto clickGameDto) throws Exception{
		ResultUtil resultUtil = new ResultUtil();
		
		resultUtil = clickGameService.clickGame_select(clickGameDto); 
		
		return resultUtil;
	}
	
	/*
	 * @RequestMapping(value="/game/clickGameMaxScore")
	 * 
	 * @ResponseBody public ClickGameDto clickGame_maxScore(ClickGameDto
	 * clickGameDto) throws Exception{
	 * 
	 * return clickGameService.clickGame_maxScore(clickGameDto); }
	 */
	
	@RequestMapping(value="/clickGameInsert")
	@ResponseBody
	public ResultUtil clickGameInsert(ClickGameDto clickGameDto) throws Exception {
		ResultUtil resultUtil = new ResultUtil();
		
		clickGameService.clickGame_insert(clickGameDto);
		resultUtil = clickGameService.clickGame_select(clickGameDto); 
			
		return resultUtil;
	}
	
	@RequestMapping(value="/piheabamma")
	public String piheabamma() {
		return "/game/piheabamma";
	}
	
	@RequestMapping(value="/piheabammaSelect")
	@ResponseBody
	public ResultUtil piheabammaSelect(PiheabammaDto piheabammaDto) throws Exception{
		ResultUtil resultUtil = new ResultUtil();
		
		resultUtil = piheabammaService.piheabamma_select(piheabammaDto); 
		
		return resultUtil;
	}
	
	/*
	 * @RequestMapping(value="/game/piheabammaeMaxScore")
	 * 
	 * @ResponseBody public PiheabammaDto piheabammaeMaxScore(PiheabammaDto
	 * piheabammaDto) throws Exception{
	 * 
	 * return piheabammaService.piheabamma_maxScore(piheabammaDto); }
	 */
	
	@RequestMapping(value="/piheabammaInsert")
	@ResponseBody
	public ResultUtil piheabammaInsert(PiheabammaDto piheabammaDto) throws Exception {
		ResultUtil resultUtil = new ResultUtil();
		
		piheabammaService.piheabamma_insert(piheabammaDto);
		resultUtil = piheabammaService.piheabamma_select(piheabammaDto); 
			
		return resultUtil;
	}
	
}
