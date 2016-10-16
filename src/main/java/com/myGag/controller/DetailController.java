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
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile() {
		return "Profile";
	}
	
	@RequestMapping(value = "/changeSettings", method = RequestMethod.GET)
	public String changeSettings() {
		return "ChangeSettings";
	}
	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
	public String changePassword() {
		return "ChangePassword";
	}
	@RequestMapping(value = "/deleteAccount", method = RequestMethod.GET)
	public String changeAccount() {
		return "deletePage";
	}
	
	@RequestMapping(value = "/upvotedPosts", method = RequestMethod.GET)
	public String viewUpvotes() {
		return "UpvotesPage";
	}
	@RequestMapping(value = "/commentedPosts", method = RequestMethod.GET)
	public String viewCommentedPosts() {
		return "Comments";
	}
	
	@RequestMapping(value = "/settings", method = RequestMethod.GET)
	public String settings() {
		return "Settings";
	}
	
	@RequestMapping(value = "/password", method = RequestMethod.GET)
	public String password() {
		return "Password";
	}
}
