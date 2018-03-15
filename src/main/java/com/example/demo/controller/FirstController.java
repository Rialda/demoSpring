package com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FirstController {
	
	@ResponseBody
	@RequestMapping("/home")
	public String welcome() {
		return "Hello World!";
	}
	
	@RequestMapping("/index")
	public String landingPage() {
		return "landing_page";
	}
	 
}
