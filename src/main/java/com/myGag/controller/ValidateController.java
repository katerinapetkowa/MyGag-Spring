package com.myGag.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.myGag.model.UsersManager;

@RestController
public class ValidateController {

	@RequestMapping(value="/loginValidate", method=RequestMethod.POST)
	public String loginValidate(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpSession session, HttpServletResponse response){
		
		String encryptedPassword = UsersManager.getInstance().passwordToMD5(password);
		String msg;
		if (UsersManager.getInstance().validLogin(username, encryptedPassword)) {
			session.setAttribute("loggedAs", username);
			msg = "success";
		} else {
			msg = "LoginFailed";
		}
		return msg;
		
	}
}
