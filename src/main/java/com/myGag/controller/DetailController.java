package com.myGag.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DetailController {

	@RequestMapping(value = "/hotposts", method = RequestMethod.GET)
	public String hotCategory() {
		return "Hot";
	}
	
	@RequestMapping(value = "/freshposts", method = RequestMethod.GET)
	public String freshCategory() {
		return "Fresh";
	}
	
	@RequestMapping(value = "/funnyposts", method = RequestMethod.GET)
	public String funnyCategory() {
		return "Funny";
	}
	@RequestMapping(value = "/foodposts", method = RequestMethod.GET)
	public String foodCategory() {
		return "Food";
	}

	@RequestMapping(value = "/movieTVposts", method = RequestMethod.GET)
	public String movieTVCategory() {
		return "MovieTV";
	}
	
	@RequestMapping(value = "/sportposts", method = RequestMethod.GET)
	public String sportCategory() {
		return "Sport";
	}
}
