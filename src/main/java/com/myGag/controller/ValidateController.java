package com.myGag.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.myGag.model.UsersManager;

@RestController
@MultipartConfig(maxFileSize = 200000000)
public class ValidateController {

	@RequestMapping(value = "/loginValidate", method = RequestMethod.POST)
	public String loginValidate(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpSession session, HttpServletResponse response) {

		String encryptedPassword = UsersManager.getInstance().passwordToMD5(password);
		String msg;
		if (!UsersManager.getInstance().getAllUsers().containsKey(username)) {
			msg = "invalidUsername";
		} else if (UsersManager.getInstance().validLogin(username, encryptedPassword)) {
			session.setAttribute("loggedAs", username);
			msg = "success";
		} else {
			msg = "wrongPassword";
		}
		return msg;

	}

	@RequestMapping(value = "/registerValidate", method = RequestMethod.POST)
	public String registerValidate(@RequestParam("username") String username, @RequestParam("name") String name,
			@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam("password2") String password2,@RequestParam("profilePicture") MultipartFile profilePicture,
			HttpSession session, HttpServletResponse response) {

		String msg;
		if (UsersManager.getInstance().getAllUsers().containsKey(username)) {
			msg = "usernameTaken";
		} else if(!UsersManager.getInstance().validEmail(email)){
			msg = "emailTaken";
		} else if (!password.equals(password2)) {
			msg = "passwordsDontMatch";
		} else {
			File dir = new File("D:\\MyGagPictures\\userProfilePics");
			if (!dir.exists()) {
				dir.mkdirs();
			}
			InputStream profilePicStream = null;
			try {
				profilePicStream = profilePicture.getInputStream();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			File profilePicFile = new File(dir, username + "-profile-pic." + profilePicture.getContentType().split("/")[1]);
			System.out.println("Try to save file with name: " + profilePicFile.getName());
			System.out.println("abs. path = " + profilePicFile.getAbsolutePath());
			try {
				Files.copy(profilePicStream, profilePicFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String encryptedPassword = UsersManager.getInstance().passwordToMD5(password2);
			UsersManager.getInstance().registerUser(username, name, encryptedPassword, email, profilePicFile.getName());
			msg = "success";
		}
		return msg;
	}

	@RequestMapping(value = "/passwordValidate", method = RequestMethod.POST)
	public void passwordValidate(@RequestParam("oldPassword") String oldPassword, HttpServletResponse response,
			HttpSession session) {
		String username = session.getAttribute("loggedAs").toString();
		String password = UsersManager.getInstance().passwordToMD5(oldPassword);
		try {
			ServletOutputStream out = response.getOutputStream();
			if (UsersManager.getInstance().getUser(username).getPassword().equals(password)) {
				out.println("t");
			} else {
				out.println("f");
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
