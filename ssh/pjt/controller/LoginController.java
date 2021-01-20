package com.ssh.pjt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssh.pjt.dto.UserDto;
import com.ssh.pjt.service.MemberService;
import com.ssh.pjt.service.UserService;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/login")
	public String login() {
		
		return "/login/login";
	}
	
//	@RequestMapping(value="/login_chk", method = RequestMethod.POST)
//	@ResponseBody
//	public int login_chk(HttpSession session, MemberDto memberDto) throws Exception {
//		int count = 0;
//		
//		MemberDto member = memberService.login_chk(memberDto);
//		
//		if(member != null) {
//			session.setAttribute("loginCheck",true);
//			session.setAttribute("id", member.getMember_id());
//			count = 1;
//			System.out.println(memberDto.getMember_id());
//		}else {
//			count = 0;
//		}
//		return count;
//	}
	
	@RequestMapping(value="/id_chk", method = RequestMethod.GET)
	@ResponseBody
	public int id_chk(@RequestParam("Id") String id) throws Exception{
			
			 return memberService.id_chk(id);
		
	}
	
//	@RequestMapping(value="/logout")
//	public String logout(HttpSession session) {
//		session.setAttribute("loginCheck",null);
//		session.setAttribute("id", null);
//		
//		return "redirect:/";
//	}
	
//	@RequestMapping(value="/sign_up_action", method = RequestMethod.POST)
//	@ResponseBody
//	public int sing_up_action(MemberDto memberDto) throws Exception {
//		
//		int count = 0;
//		System.out.println("memberDto.getMember_id() : " + memberDto.getMember_id());
//		count = memberService.insertMember(memberDto);
//		
//		return count;
//	}
	
	@RequestMapping(value="/sign_up")
	public String sign_up() {
		
		return "/login/sign_up";
	}
	
	@RequestMapping(value="/sign_up_test")
	public String sign_up_test() {
		
		return "/login/sign_upTest";
	}
	
	@RequestMapping(value="/sign_up_test_action", method = RequestMethod.POST)
	@ResponseBody
	public int sign_up_test_action(UserDto userDto) throws Exception {
		
		return userService.RegisterUser(userDto);
		
	}
}
