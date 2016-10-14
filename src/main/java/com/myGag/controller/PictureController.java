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

import com.myGag.model.User;
import com.myGag.model.UsersManager;

@Controller
public class PictureController {
	
	
	
	public static void returnProfilePic(User u, HttpServletResponse response) throws IOException {
		File profilePicFile = new File("C:\\Users\\Katerina Petkova\\workspace\\MyProject with Upload image\\MyGagSpring\\userProfilePics", u.getProfilePicture());
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
		String logged = (String) session.getAttribute("USER");
		if (logged == null) {// session is new or expired
			System.out.println("This should not happen right now. Might happen later on other pages");
		} else {
			User user = UsersManager.getInstance().getUser(logged);
			returnProfilePic(user, response);
		}
	}

}
