package com.myGag.controller;

import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myGag.model.CommentsManager;

@Controller
public class CommentController {

	@RequestMapping(value = "/uploadComment", method = RequestMethod.POST)
	public String uploadComment(@RequestParam(value = "username") String username, HttpServletRequest request) {
		if (UserController.isUserInSession(request)) {
			int postId = Integer.parseInt(request.getParameter("post_id"));
			String comment = StringEscapeUtils.escapeHtml4(request.getParameter("comment"));
			if (comment != null) {
				CommentsManager.getInstance().uploadComment(username, postId, comment, LocalDateTime.now());
				return "DetailsPost";
			}
			return "DetailsPost";
		} else {
			return "index";
		}
	}

}
