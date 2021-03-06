package com.myGag.model;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentHashMap;

import com.myGag.model.db.CommentDAO;
 
public class CommentsManager {

	private static CommentsManager instance;
	private ConcurrentHashMap<Integer, TreeMap<Integer, Comment>> commentsByPosts; // post
																					// id
																					// ->
																					// comment
																					// id
																					// ->
																					// comment

	public CommentsManager() {
		commentsByPosts = new ConcurrentHashMap<>();
		for (Comment c : CommentDAO.getInstance().getAllCommentsFromDB()) {
			if (!commentsByPosts.containsKey(c.getPostId())) {
				commentsByPosts.put(c.getPostId(), new TreeMap<Integer, Comment>());
			}
			commentsByPosts.get(c.getPostId()).put(c.getCommentId(), c);
		}

	}

	public synchronized static CommentsManager getInstance() {
		if (instance == null) {
			instance = new CommentsManager();
		}
		return instance;
	}

	public Map<Integer, TreeMap<Integer, Comment>> getCommentsByPosts() {
		return Collections.unmodifiableMap(commentsByPosts);

	}

	public Map<Integer, Comment> getCommentsOfPost(int postId) {
		Map<Integer, Comment> commentsOfPost = new TreeMap<>(Collections.reverseOrder());
		if (!CommentsManager.getInstance().getCommentsByPosts().containsKey(postId)) {
			return commentsOfPost;
		}
		commentsOfPost.putAll(CommentsManager.getInstance().getCommentsByPosts().get(postId));
		return commentsOfPost;
	}

	public Comment getComment(int postId, int commentId) {
		return commentsByPosts.get(postId).get(commentId);
	}

	public int getNumberOfCommentsOfPost(int postId) {
		int comments = 0;
		if (CommentsManager.getInstance().commentsByPosts.containsKey(postId)) {
			comments = CommentsManager.getInstance().commentsByPosts.get(postId).size();
		}
		return comments;
	}

	public void uploadComment(String username, int postId, String text, LocalDateTime uploadDate) {
		int commentId = CommentDAO.getInstance().addCommentToDB(username, postId, text, uploadDate);
		Comment comment = new Comment(commentId, username, postId, text, uploadDate);
		System.out.println(comment.toString());
		if (!CommentsManager.getInstance().commentsByPosts.containsKey(postId)) {
			CommentsManager.getInstance().commentsByPosts.put(postId, new TreeMap<Integer, Comment>());
			System.out.println("adding post id to collection of comments by posts");
		}
		// System.out.println(commentsByPosts.get(postId).size());
		CommentsManager.getInstance().commentsByPosts.get(postId).put(commentId, comment);
		System.out.println("adding comment by id to collection by post ids");
		UsersManager.getInstance().getUser(username).addCommentToUser(postId, commentId,
				PostsManager.getInstance().getPost(postId));
	}

	public void deleteComment(String username, int postId, int commentId) {
		CommentDAO.getInstance().deleteCommentFromDB(commentId);
		UsersManager.getInstance().getUser(username).deleteCommentFromUser(postId, commentId);
		CommentsManager.getInstance().commentsByPosts.get(postId).remove(commentId);
	}

	public void deleteAllCommentsOfPost(int postId) {
		if (CommentsManager.getInstance().commentsByPosts.containsKey(postId)) {
			CommentsManager.getInstance().commentsByPosts.remove(postId);
		}
	}

	public void removeCommentFromAllComments(int postId, int commentId) {
		if (CommentsManager.getInstance().commentsByPosts.containsKey(postId)) {
			CommentsManager.getInstance().commentsByPosts.get(postId).remove(commentId);
		}
	}

	public void removeCommentFromCollectionOfComments(int postId, int commentId) {
		if (CommentsManager.getInstance().commentsByPosts.containsKey(postId)) {
			if (CommentsManager.getInstance().commentsByPosts.get(postId).containsKey(commentId)) {
				CommentsManager.getInstance().commentsByPosts.get(postId).remove(commentId);
			}
		}
	}

}
