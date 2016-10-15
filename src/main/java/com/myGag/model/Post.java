package com.myGag.model;

import java.time.LocalDateTime;

public class Post implements Comparable<Post> {

	private int postId;
	private String username;
	private String category; 
	private String title;
	private LocalDateTime uploadDate;
	private String picture;
	
	
	public Post(int postId, String username, String category, String title, LocalDateTime uploadDate, String picture) {
		this.postId = postId;
		this.username = username;
		this.category = category;
		this.title = title;
		this.uploadDate = uploadDate;
		this.picture = picture;
	}


	public int getPostId() {
		return postId;
	}


	public String getUsername() {
		return username;
	}


	public String getCategory() {
		return category;
	}


	public String getTitle() {
		return title;
	}


	public LocalDateTime getUploadDate() {
		return uploadDate;
	}

	public String getPicture() {
		return picture;
	}


	@Override
	public String toString() {
		return "Post [postId=" + postId + ", username=" + username + ", category=" + category + ", title=" + title
				+ ", uploadDate=" + uploadDate + ", picture=" + picture + "]";
	}


	@Override
	public int compareTo(Post p) {
		if(PostsManager.getInstance().getPointsOfPost(this.getPostId()) == PostsManager.getInstance().getPointsOfPost(p.getPostId())){
			return this.getUploadDate().compareTo(p.getUploadDate());
		}
		return (PostsManager.getInstance().getPointsOfPost(this.getPostId()) - PostsManager.getInstance().getPointsOfPost(p.getPostId()));
	}
	
	
	


}
