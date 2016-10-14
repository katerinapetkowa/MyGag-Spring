package com.myGag.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myGag.model.Post;
import com.myGag.model.PostsManager;
import com.myGag.model.User;
import com.myGag.model.UsersManager;

@Controller
public class PictureController {
	
	
	
	public static void returnProfilePic(User u, HttpServletResponse response) throws IOException {
		File profilePicFile = new File("D:\\MyGagPictures\\userProfilePics", u.getProfilePicture());
		response.setContentLength((int) profilePicFile.length());
		String contentType = "image/"
				+ profilePicFile.getName().split("[.]")[profilePicFile.getName().split("[.]").length - 1];
		response.setContentType(contentType);
		OutputStream out = response.getOutputStream();
		Files.copy(profilePicFile.toPath(), out);
	}
	
	
	@RequestMapping(value = "/profilePicture", method = RequestMethod.GET)
	public void profile(@RequestParam(value = "username") String username, HttpSession session, HttpServletResponse response)
			throws IOException {
		if (username != null) {
			User user = UsersManager.getInstance().getUser(username);
			returnProfilePic(user, response);
		}
		String logged = (String) session.getAttribute("loggedAs");
		if (logged == null) {// session is new or expired
			System.out.println("This should not happen right now. Might happen later on other pages");
		} else {
			User user = UsersManager.getInstance().getUser(logged);
			returnProfilePic(user, response);
		}
	}
	
	@RequestMapping(value = "/postPicture", method = RequestMethod.GET)
	public void post(@RequestParam(value = "post_id") String postId, HttpServletResponse response) throws IOException {
		if (PostsManager.getInstance().getAllPosts().containsKey(Integer.parseInt(postId))) {
			Post post = PostsManager.getInstance().getAllPosts().get(Integer.parseInt(postId));
			returnPic(post, response);
		}
	}

	public static void returnPic(Post post, HttpServletResponse response) throws IOException {
		File postPicFile = new File("D:\\MyGagPictures\\postPics", post.getPicture());
		response.setContentLength((int)postPicFile.length());
		String contentType = "image/"+postPicFile.getName().split("[.]")[postPicFile.getName().split("[.]").length-1];
		response.setContentType(contentType);
		OutputStream out = response.getOutputStream();
		Files.copy(postPicFile.toPath(), out);
	}

}
