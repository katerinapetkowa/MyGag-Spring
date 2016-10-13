package com.myGag.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myGag.model.UsersManager;



@Controller
public class UserController {

@RequestMapping(value = "/login", method = RequestMethod.POST)
public String login(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session, HttpServletResponse response){
	String encryptedPassword = UsersManager.getInstance().passwordToMD5(password);
	String jsp;
	if(UsersManager.getInstance().validLogin(username, encryptedPassword)){
		session.setAttribute("loggedAs", username);
		jsp = "posts";
	}else{
		jsp = "LoginFailed";
	}
	response.setHeader("Pragma", "No-cache"); 
	response.setDateHeader("Expires", 0); 
	response.setHeader("Cache-Control", "no-cache"); 
	return jsp;
}



@RequestMapping(value = "/", method = RequestMethod.GET)
public String welcome() {
	return "index";
}

}
