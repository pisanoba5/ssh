package com.ssh.pjt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssh.pjt.common.ResultUtil;
import com.ssh.pjt.dto.ReplyDto;
import com.ssh.pjt.service.ReplyService;

@Controller
@RequestMapping(value="/reply")
public class ReplyController {
	
	@Autowired
	ReplyService replyService;

	@RequestMapping(value="/reply_insert", method = RequestMethod.POST)
	@ResponseBody
	public int Reply_insert(ReplyDto replyDto) throws Exception{
		int count = 0;
			
		count = replyService.reply_insert(replyDto);
		
		return count;
	}
	
	@RequestMapping(value="/reply_list", method = RequestMethod.POST)
	@ResponseBody
	public ResultUtil Reply_list(@RequestParam("seq") int seq) throws Exception{
		
		ResultUtil resultUtils = replyService.reply_list(seq);
		
		return resultUtils;
	}
	
	@RequestMapping(value="/reply_modify", method = RequestMethod.POST)
	@ResponseBody
	public int reply_modify(ReplyDto replyDto) throws Exception{
		int count = 0;
			
		count = replyService.reply_modify(replyDto);
		
		return count;
	}
	
	@RequestMapping(value="/reply_delete", method = RequestMethod.POST)
	@ResponseBody
	public int reply_delete(@RequestParam("seq") int seq) throws Exception{
		int count = 0;
			
		count = replyService.reply_delete(seq);
		
		return count;
	}
	
}
