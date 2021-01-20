package com.ssh.pjt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssh.pjt.common.ResultUtil;
import com.ssh.pjt.dto.ClickGameDto;
import com.ssh.pjt.dto.MemberDto;
import com.ssh.pjt.dto.PiheabammaDto;
import com.ssh.pjt.dto.UserDto;
import com.ssh.pjt.service.MaxScoreService;
import com.ssh.pjt.service.MemberService;
import com.ssh.pjt.service.UserService;

@Controller
@RequestMapping(value="/mypage")
public class MyPageController {

	@Autowired
	UserService userService;
	@Autowired
	MaxScoreService maxScoreService;
	
	@RequestMapping(value="/mypage", method = RequestMethod.GET)
	public String mypage(@RequestParam("Id") String Id, UserDto userDto, Model model) throws Exception{
		
		System.out.println("start");
		userDto = (UserDto) userService.loadUserByUsername(Id);
		System.out.println(userDto.getId());
		model.addAttribute("user", userDto);
	
		return "/mypage/mypage";
	}
	
	@RequestMapping(value="/mypage_modify_chart", method = RequestMethod.POST)
	@ResponseBody
	public ResultUtil mypage_modify_chart(@RequestParam("Id") String id, ClickGameDto clickGameDto, PiheabammaDto piheabammaDto) throws Exception{
		
		return maxScoreService.ScoreList(id,clickGameDto,piheabammaDto);
	}
	
	@RequestMapping(value="/mypage_modify_page")
	public String mypage_modify_page() throws Exception{
		
		return "/mypage/mypage_modify";
	}
	
	@RequestMapping(value="/mypage_modify", method = RequestMethod.POST)
	@ResponseBody
	public int mypage_modify(UserDto userDto) throws Exception{

		return userService.mypageModify(userDto);
		
	}
	
}
