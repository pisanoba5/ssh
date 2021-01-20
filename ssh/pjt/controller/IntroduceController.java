package com.ssh.pjt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/introduce")
public class IntroduceController {
	
	@RequestMapping(value="/introduce")
	public String intorduce() throws Exception{
		
		return "/introduce/introduce";
	}
	
	@RequestMapping(value="/spring_page")
	public String spring_page() throws Exception{
		
		return "/introduce/spring";
	}
	
	@RequestMapping(value="/chartJs_page")
	public String chartJs_page() throws Exception{
		
		return "/introduce/chartJs";
	}
	
	@RequestMapping(value="/springSecurity_page")
	public String springSecurity_page() throws Exception{
		
		return "/introduce/springSecurity";
	}
	@RequestMapping(value="/javaScript_page")
	public String javaScript_page() throws Exception{
		
		return "/introduce/javaScript";
	}

}
