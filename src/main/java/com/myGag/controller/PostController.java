package com.myGag.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myGag.model.PostsManager;

@Controller
public class PostController {
	
	
@RequestMapping(value = "/uploadpost", method = RequestMethod.POST)
 public String createPost(@RequestParam(value = "username") String username,
			@RequestParam(value = "title") String title,
			@RequestParam(value = "category") String category, @RequestParam("postPicture") MultipartFile postPicture,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
	
	if(request.getSession().getAttribute("loggedAs") != null){
		InputStream postPicStream = postPicture.getInputStream();
		File dir = new File("postPics");
		if(!dir.exists()){
			dir.mkdir();
		}
		
		String date = DateTimeFormatter.ofPattern("MM-dd-yyyy").format(LocalDate.now());
		String time = DateTimeFormatter.ofPattern("H-mm-ss").format(LocalTime.now());
		File postPicFile = new File(dir, username + "-" + date + "-" + time + "-post-pic."+ postPicture.getContentType().split("/")[1]);
		System.out.println("Try to save file with name: " + postPicFile.getName());
		System.out.println("abs. path = " + postPicFile.getAbsolutePath());
		Files.copy(postPicStream, postPicFile.toPath());
		PostsManager.getInstance().uploadPost(username, category, title, LocalDateTime.now(), postPicFile.getName());
		return "index";
	}else{
	
		return "index";
	}	
 }



}
