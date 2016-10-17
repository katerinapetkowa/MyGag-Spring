package com.myGag.controller;

import javax.servlet.http.HttpServletRequest;

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
	public String profile(HttpServletRequest request) {
		if (UserController.isUserInSession(request)) {
			return "Profile";
		} else {
			return "index";
		}
	}

	@RequestMapping(value = "/deleteAccount", method = RequestMethod.GET)
	public String changeAccount(HttpServletRequest request) {
		if (UserController.isUserInSession(request)) {
			return "deletePage";
		} else {
			return "index";
		}
	}

	@RequestMapping(value = "/upvotedPosts", method = RequestMethod.GET)
	public String viewUpvotes(HttpServletRequest request) {
		if (UserController.isUserInSession(request)) {
			return "UpvotesPage";
		} else {
			return "index";
		}
	}

	@RequestMapping(value = "/commentedPosts", method = RequestMethod.GET)
	public String viewCommentedPosts(HttpServletRequest request) {
		if (UserController.isUserInSession(request)) {
			return "Comments";
		} else {
			return "index";
		}
	}

	@RequestMapping(value = "/settings", method = RequestMethod.GET)
	public String settings(HttpServletRequest request) {
		if (UserController.isUserInSession(request)) {
			return "Settings";
		} else {
			return "index";
		}
	}

	@RequestMapping(value = "/password", method = RequestMethod.GET)
	public String password(HttpServletRequest request) {
		if (UserController.isUserInSession(request)) {
			return "Password";
		} else {
			return "index";
		}
	}
}
