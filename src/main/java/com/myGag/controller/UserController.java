package com.myGag.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myGag.model.UsersManager;


@Controller
@MultipartConfig(maxFileSize = 200000000)
public class UserController {
	
	
	private static final String NAME_PATTERN = "^[A-Za-z]+$";
	private static final String EMAIL_PATTERN = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9]+.[a-z.]+$";


	@RequestMapping(value = "/logOut", method = RequestMethod.POST)
	protected String logOut(HttpSession session, HttpServletResponse response) {
		session.invalidate();
		return "index";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String welcome() {
		return "index";
	}


	public static boolean isUserInSession(HttpServletRequest request) {
		return request.getSession().getAttribute("loggedAs") != null;
	}
	
	@RequestMapping(value = "/changeSettings", method = RequestMethod.POST)
	public String changeProfile(HttpSession session, HttpServletResponse response, @RequestParam("name") String name, 
			@RequestParam("email") String email, @RequestParam("profilePicture") MultipartFile profilePicture, 
			HttpServletRequest request) throws IOException{
		String username = session.getAttribute("loggedAs").toString();
		String description = StringEscapeUtils.escapeHtml4(request.getParameter("description"));
		if(!profilePicture.getContentType().split("/")[1].equals("octet-stream")){
		InputStream profilePicStream = null;
		try {
			profilePicStream = profilePicture.getInputStream();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		File dir = new File("D:\\MyGagPictures\\userProfilePics");
		if (!dir.exists()) {
			dir.mkdirs();
		}
		File profilePicFile = new File(dir, username + "-profile-pic." + profilePicture.getContentType().split("/")[1]);
		System.out.println("Try to save file with name: " + profilePicFile.getName());
		System.out.println("abs. path = " + profilePicFile.getAbsolutePath());
		Files.copy(profilePicStream, profilePicFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
		UsersManager.getInstance().changeProfilePicture(username, profilePicFile.getName());
	}
		UsersManager.getInstance().changeProfile(username, name, email, description);
		return "Settings";
	}
	
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(@RequestParam("password") String password , HttpSession session, HttpServletResponse response){
		String username = session.getAttribute("loggedAs").toString();
		String encryptedPassword = UsersManager.getInstance().passwordToMD5(password);
		UsersManager.getInstance().changePassword(username, encryptedPassword);
		session.invalidate();
		return "index";
	}
	
	
}
