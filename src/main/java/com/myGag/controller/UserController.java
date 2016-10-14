package com.myGag.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.security.SecureRandom;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myGag.model.RegisterEmail;
import com.myGag.model.UsersManager;


@Controller
@MultipartConfig(maxFileSize = 200000000)
public class UserController {
	
	
	private static final String NAME_PATTERN = "^[A-Za-z]+$";
	private static final int MINIMUM_PASSWORD_LENGTH = 6;
	private static final String EMAIL_PATTERN = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9]+.[a-z.]+$";

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpSession session, HttpServletResponse response) {
		String encryptedPassword = UsersManager.getInstance().passwordToMD5(password);
		String jsp;
		if (UsersManager.getInstance().validLogin(username, encryptedPassword)) {
			session.setAttribute("loggedAs", username);
			jsp = "index";
		} else {
			jsp = "LoginFailed";
		}
		response.setHeader("Pragma", "No-cache");
		response.setDateHeader("Expires", 0);
		response.setHeader("Cache-Control",  "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
		return jsp;
	}

	@RequestMapping(value = "/logOut", method = RequestMethod.GET)
	protected String logOut(HttpSession session, HttpServletResponse response) {
		session.invalidate();
		response.setHeader("Pragma", "No-cache"); 
		response.setDateHeader("Expires", 0); 
		response.setHeader("Cache-Control",  "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
		return "index";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String welcome() {
		return "index";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@RequestParam("name") String name, @RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("password2") String password2,
			@RequestParam("email") String email, @RequestParam("profilePicture") MultipartFile profilePicture) throws IOException {
		InputStream profilePicStream = null;
		try {
			profilePicStream = profilePicture.getInputStream();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Pattern pattern = Pattern.compile(
				"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$");
		Matcher mattcher = pattern.matcher(email);
		String jsp = "";

		if (((!UsersManager.getInstance().getAllUsers().containsKey("username")) && mattcher.matches()) && (!email.isEmpty())
				&& (!password.isEmpty()) && (password.equals(password2))
				&& (!name.isEmpty()) && (name.trim().length() >= 3)) {
			File dir = new File("userProfilePics");
			if (!dir.exists()) {
				dir.mkdirs();
			}
			File profilePicFile = new File(dir, name + "-profile-pic." + profilePicture.getContentType().split("/")[1]);
			System.out.println("Try to save file with name: " + profilePicFile.getName());
			System.out.println("abs. path = " + profilePicFile.getAbsolutePath());
			Files.copy(profilePicStream, profilePicFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
			
//			SecureRandom random = new SecureRandom();
//			String generatedPassword = new BigInteger(30, random).toString(32);
//			System.out.println("generated pass: " + generatedPassword);
			//String encryptedPassword = UsersManager.getInstance().passwordToMD5(generatedPassword);
			String encryptedPassword = UsersManager.getInstance().passwordToMD5(password2);
			//RegisterEmail registerEmail = new RegisterEmail(email, generatedPassword);
			//registerEmail.start();
			
			UsersManager.getInstance().registerUser(username, name, encryptedPassword, email, profilePicFile.getName());
			
			jsp = "index";
		} else {
			jsp = "RegisterFailed";
		}

		return jsp;
	}

	public static boolean isUserInSession(HttpServletRequest request) {
		return request.getSession().getAttribute("loggedAs") != null;
	}
	
	
	private static boolean validateData(String name, String email, String password) {
		if ((name != null && email != null && password != null)) {
			return name.matches(NAME_PATTERN) && email.matches(EMAIL_PATTERN)
					&& password.length() >= MINIMUM_PASSWORD_LENGTH;
		}
		return false;

	}

}
