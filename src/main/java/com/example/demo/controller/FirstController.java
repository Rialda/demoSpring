package com.example.demo.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FirstController {
	
	@ResponseBody
	@RequestMapping("/home")
	public String welcome() {
		return "Hello World!";
	}
	
	@RequestMapping("/landing_page")
	public String landingPage() {
		return "landing_page";
	}
	 
}
