package com.myGag.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myGag.model.Post;
import com.myGag.model.PostsManager;

@Controller
public class PostController {
	
	
@RequestMapping(value = "/createpost", method = RequestMethod.POST)
 public String createPost(@RequestParam(value = "username") String username,
			@RequestParam(value = "title") String title,
			@RequestParam(value = "category") String category, @RequestParam("postPicture") MultipartFile postPicture,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
	
	if(UserController.isUserInSession(request)){
		InputStream postPicStream = postPicture.getInputStream();
		File dir = new File("D:\\MyGagPictures\\postPics");
		if(!dir.exists()){
			dir.mkdir();
		}
		
		String date = DateTimeFormatter.ofPattern("MM-dd-yyyy").format(LocalDate.now());
		String time = DateTimeFormatter.ofPattern("H-mm-ss").format(LocalTime.now());
		File postPicFile = new File(dir, username + "-" + date + "-" + time + "-post-pic."+ postPicture.getContentType().split("/")[1]);
		System.out.println("Try to save file with name: " + postPicFile.getName());
		System.out.println("abs. path = " + postPicFile.getAbsolutePath());
		Files.copy(postPicStream, postPicFile.toPath(),StandardCopyOption.REPLACE_EXISTING);
		PostsManager.getInstance().uploadPost(username, category, title, LocalDateTime.now(), postPicFile.getName());
		return "index";
	}else{
	
		return "index";
	}	
	
	
 }


@RequestMapping(value = "/postlike", method = RequestMethod.POST)
	public String likePost(@RequestParam(value = "post_id") String postId,  HttpSession session,
			HttpServletRequest request) {
		if (UserController.isUserInSession(request)) {
			String logged = session.getAttribute("loggedAs").toString();
			PostsManager.getInstance().upVotePost(logged, Integer.parseInt(postId));
			return "CommentsPage";
		} else {
			return "CommentsPage";
		}
	}


@RequestMapping(value = "/postdislike", method = RequestMethod.POST)

	public String dislikePost(@RequestParam (value = "post_id") String postId, HttpSession session,
	HttpServletRequest request) {
	
		if (UserController.isUserInSession(request)) {
			String logged = session.getAttribute("loggedAs").toString();
			PostsManager.getInstance().downVotePost(logged, Integer.parseInt(postId));
			return "CommentsPage";
		}else{
			return "CommentsPage";
		}
	}

@RequestMapping(value = "/viewpost", method = RequestMethod.GET)
	public String viewPost(@RequestParam("post_id") String postId, HttpServletRequest request){
		if (UserController.isUserInSession(request)) {
			Post post = PostsManager.getInstance().getPost(Integer.parseInt(postId));
			return "CommentsPage";
		}else{
			return "DetailsPostWhenNotLogged";
		}
	}
@RequestMapping(value = "/searchpost", method = RequestMethod.GET)
	public String searchPost(@RequestParam("title") String title, HttpServletRequest request){
		if (UserController.isUserInSession(request)) {
			PostsManager.getInstance().searchPosts(title);
			request.setAttribute("title", title);
			return "search";
		}else{
			return "search";
	}
}

@RequestMapping(value = "/uploadpost", method = RequestMethod.GET)
	public String uploadPost() {
		return "UploadPost";
	}

}
