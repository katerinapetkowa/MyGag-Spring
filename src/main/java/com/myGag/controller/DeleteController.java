package com.myGag.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myGag.model.CommentsManager;
import com.myGag.model.PostsManager;
import com.myGag.model.UsersManager;

@Controller
public class DeleteController {

	@RequestMapping(value = "/deleteAccount", method = RequestMethod.POST)
	public String deleteAccount(@RequestParam(value = "username") String username, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) {
		if (UserController.isUserInSession(request)) {
			UsersManager.getInstance().deleteUser(username);
			session.invalidate();
		}
		return "index";
	}

	@RequestMapping(value = "/deletePost", method = RequestMethod.POST)
	public String deletePost(@RequestParam(value = "post_id") String postId,
			@RequestParam(value = "username") String username, HttpSession session, HttpServletRequest request) {
		if (UserController.isUserInSession(request)) {
			PostsManager.getInstance().deletePost(Integer.parseInt(postId));
		}
		return "index";
	}

	@RequestMapping(value = "/deleteComment", method = RequestMethod.POST)
	public String deleteComment(@RequestParam(value = "post_id") String postId,
			@RequestParam(value = "username") String username, @RequestParam(value = "comment_id") String commentId,
			HttpSession session, HttpServletRequest request) {
		if (UserController.isUserInSession(request)) {
			CommentsManager.getInstance().deleteComment(username, Integer.parseInt(postId),
					Integer.parseInt(commentId));
		}
		return "DetailsPost";
	}
}
