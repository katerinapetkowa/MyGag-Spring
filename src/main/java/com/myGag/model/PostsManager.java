package com.myGag.model;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentHashMap;

import com.myGag.model.db.PostDAO;

public class PostsManager {

	private static PostsManager instance;
	private ConcurrentHashMap<Integer, Post> allPosts;
	private ConcurrentHashMap<String, HashMap<Integer, Post>> postsByCategories;
	private ConcurrentHashMap<Integer, HashSet<String>> postUpvotes;
	private ConcurrentHashMap<Integer, HashSet<String>> postDownvotes;

	private PostsManager() {
		allPosts = new ConcurrentHashMap<>();
		for (Post p : PostDAO.getInstance().getAllPostsFromDB()) {
			allPosts.put(p.getPostId(), p);
			System.out.println(p.getPostId() + "," + p.getUsername() + "," + p.getCategory() + "," + p.getTitle() + ","
					+ p.getUploadDate() + "," + p.getPicture());
		}
		System.out.println("Posts loaded successfully in collection");
		postsByCategories = new ConcurrentHashMap<>();

		for (Post p : PostDAO.getInstance().getAllPostsFromDB()) {
			if (!postsByCategories.containsKey(p.getCategory())) {
				postsByCategories.put(p.getCategory(), new HashMap<Integer, Post>());
			}
			postsByCategories.get(p.getCategory()).put(p.getPostId(), new Post(p.getPostId(), p.getUsername(),
					p.getCategory(), p.getTitle(), p.getUploadDate(), p.getPicture()));

		}
		System.out.println("Posts by category loaded successfully in collection");

		postUpvotes = new ConcurrentHashMap<>();
		postUpvotes.putAll(PostDAO.getInstance().getPostsUpvotesFromDB());
		System.out.println("Post upvotes loaded successfully in collection");

		postDownvotes = new ConcurrentHashMap<>();
		postDownvotes.putAll(PostDAO.getInstance().getPostsDownvotesFromDB());
		System.out.println("Post downvotes loaded successfully in collection");

	}

	public synchronized static PostsManager getInstance() {
		if (instance == null) {
			instance = new PostsManager();
		}
		return instance;
	}

	public Post getPost(int postId) {
		return allPosts.get(postId);
	}

	public int getPointsOfPost(int postId) {
		int upvotes = 0;
		int downvotes = 0;
		if (PostsManager.getInstance().getPostUpvotes().containsKey(postId)) {
			upvotes = PostsManager.getInstance().getPostUpvotes().get(postId).size();
		}
		if (PostsManager.getInstance().getPostDownvotes().containsKey(postId)) {
			downvotes = PostsManager.getInstance().getPostDownvotes().get(postId).size();
		}
		return (upvotes - downvotes);
	}

	public Set<Post> getFreshPosts() {
		Set<Post> freshPosts = new TreeSet<Post>(new Comparator<Post>(){
			@Override
			public int compare(Post p1, Post p2) {
				return p2.getUploadDate().compareTo(p1.getUploadDate());
			}
		});
		for (Post p: PostsManager.getInstance().getAllPosts().values()){
			freshPosts.add(p);
		}
		return freshPosts;
	}

	public Set<Post> getHotPosts() {
		Set<Post> hotPosts = new TreeSet<>(Collections.reverseOrder());
		for (Post p : PostsManager.getInstance().getAllPosts().values()) {
			hotPosts.add(p);
		}
		return hotPosts;
	}

	public Map<Integer, Post> getFreshPostsByCategory(String category) {
		Map<Integer, Post> freshPostsByCategory = new TreeMap<>(Collections.reverseOrder());
		if (!PostsManager.getInstance().postsByCategories.containsKey(category)) {
			return freshPostsByCategory;
		}
		freshPostsByCategory.putAll(PostsManager.getInstance().getPostsByCategories().get(category));
		return freshPostsByCategory;
	}

	public Map<Integer, Post> getAllPosts() {
		return Collections.unmodifiableMap(allPosts);
	}

	public Map<String, HashMap<Integer, Post>> getPostsByCategories() {
		return Collections.unmodifiableMap(postsByCategories);
	}

	public Map<Integer, HashSet<String>> getPostUpvotes() {
		return Collections.unmodifiableMap(postUpvotes);
	}

	public Map<Integer, HashSet<String>> getPostDownvotes() {
		return Collections.unmodifiableMap(postDownvotes);
	}

	public void uploadPost(String username, String category, String title, LocalDateTime uploadDate, String picture) {
		int postId = PostDAO.getInstance().addPostToDB(username, category, title, uploadDate, picture);
		Post post = new Post(postId, username, category, title, uploadDate, picture);
		System.out.println(post.toString());
		PostsManager.getInstance().allPosts.put(post.getPostId(), post);
		if (!PostsManager.getInstance().postsByCategories.containsKey(category)) {
			PostsManager.getInstance().postsByCategories.put(category, new HashMap<Integer, Post>());
		}
		PostsManager.getInstance().postsByCategories.get(category).put(post.getPostId(),
				new Post(postId, username, category, title, uploadDate, picture));
		UsersManager.getInstance().getUser(username)
				.addPost(new Post(postId, username, category, title, uploadDate, picture));
	}

	public boolean validUpvote(int postId, String username) {
		if (PostsManager.getInstance().getPostUpvotes().containsKey(postId)) {
			if (PostsManager.getInstance().getPostUpvotes().get(postId).contains(username)) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}

	public boolean validDownvote(int postId, String username) {
		if (PostsManager.getInstance().getPostDownvotes().containsKey(postId)) {
			if (PostsManager.getInstance().getPostDownvotes().get(postId).contains(username)) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}

	public void upVotePost(String username, int postId) {
		System.out.println("------------upvote----------------------");
		if (PostsManager.getInstance().postUpvotes.containsKey(postId)) {
			System.out.println("Post id is in collection of upvotes");
			if (PostsManager.getInstance().postUpvotes.get(postId).contains(username)) {
				System.out.println("user is in collection of likes of this post - have to reverse upvote");
				PostsManager.getInstance().reverseUpvote(username, postId);
			} else {
				if (PostsManager.getInstance().postDownvotes.containsKey(postId)) {
					System.out.println("post id is in collection of downvotes");
					if (PostsManager.getInstance().postDownvotes.get(postId).contains(username)) {
						System.out.println("user is in collection of downvotes of that post - have to move from upvote to downvote");
						PostsManager.getInstance().downvoteToUpvote(username, postId);
					} else{
						System.out.println("user is not in collection of downvotes - add upvote");
						PostsManager.getInstance().postUpvotes.get(postId).add(username);
						UsersManager.getInstance().getUser(username).upvotePost(postId, PostsManager.getInstance().getPost(postId));
						PostDAO.getInstance().upvotePostInDB(username, postId);
					}
				} else {
					System.out.println("post id is nost in collection of downvotes - upvote");
					PostsManager.getInstance().postUpvotes.get(postId).add(username);
					UsersManager.getInstance().getUser(username).upvotePost(postId,PostsManager.getInstance().getPost(postId));
					PostDAO.getInstance().upvotePostInDB(username, postId);
				}
			}
		} else {
			System.out.println("post id is not in collection of upvotes");
			if (PostsManager.getInstance().postDownvotes.containsKey(postId)) {
				System.out.println("post id is in collection of downvotes");
				if (PostsManager.getInstance().postDownvotes.get(postId).contains(username)) {
					System.out.println("user is in collection of downvotes of that post - have to move from upvote to downvote");
					PostsManager.getInstance().downvoteToUpvote(username, postId);
				} else {
					System.out.println("post id is nost in collection of downvote - upvote");
					PostsManager.getInstance().postUpvotes.put(postId, new HashSet<String>());
					PostsManager.getInstance().postUpvotes.get(postId).add(username);
					UsersManager.getInstance().getUser(username).upvotePost(postId,
							PostsManager.getInstance().getPost(postId));
					PostDAO.getInstance().upvotePostInDB(username, postId);
				}
			} else {
				System.out.println("post id is nost in collection of downvotes - upvote");
				PostsManager.getInstance().postUpvotes.put(postId, new HashSet<String>());
				PostsManager.getInstance().postUpvotes.get(postId).add(username);
				UsersManager.getInstance().getUser(username).upvotePost(postId,
						PostsManager.getInstance().getPost(postId));
				PostDAO.getInstance().upvotePostInDB(username, postId);
			}
		}
	}

	public void downVotePost(String username, int postId) {
		System.out.println("---------------downvote--------------------------");
		if (PostsManager.getInstance().postDownvotes.containsKey(postId)) {
			System.out.println("Post id is in collection of downvotes");
			if (PostsManager.getInstance().postDownvotes.get(postId).contains(username)) {
				System.out.println("user is in collection of downvotes of this post - have to reverse downvote");
				PostsManager.getInstance().reverseDownvote(username, postId);
			} else {
				System.out.println("user is not in collection of downvotes of this post");
				if (PostsManager.getInstance().postUpvotes.containsKey(postId)) {
					System.out.println("post id is in collection of upvotes");
					if (PostsManager.getInstance().postUpvotes.get(postId).contains(username)) {
						System.out.println("user is in collection of upvotes of that post - have to move from downvote to upvote");
						PostsManager.getInstance().upvoteToDownvote(username, postId);
					} else{
						System.out.println("user is not in collection of upvotes of this post - downvote");
						PostsManager.getInstance().postDownvotes.get(postId).add(username);
						UsersManager.getInstance().getUser(username).downvotePost(postId);
						PostDAO.getInstance().downvotePostInDB(username, postId);
					}
				} else {
					System.out.println("post id is not in collection of upvotes - downvote");
					PostsManager.getInstance().postDownvotes.get(postId).add(username);
					UsersManager.getInstance().getUser(username).downvotePost(postId);
					PostDAO.getInstance().downvotePostInDB(username, postId);
				}
			}
		} else {
			System.out.println("Post id is not in collection of downvotes");
			if (PostsManager.getInstance().postUpvotes.containsKey(postId)) {
				System.out.println("post id is in collection of upvotes");
				if (PostsManager.getInstance().postUpvotes.get(postId).contains(username)) {
					System.out.println("user is in collection of upvotes of post - upvote to downvote");
					PostsManager.getInstance().upvoteToDownvote(username, postId);
				} else {
					System.out.println("user is not in collection of upvotes of this post - downvote");
					PostsManager.getInstance().postDownvotes.put(postId, new HashSet<String>());
					PostsManager.getInstance().postDownvotes.get(postId).add(username);
					UsersManager.getInstance().getUser(username).downvotePost(postId);
					PostDAO.getInstance().downvotePostInDB(username, postId);
				}
			} else {
				System.out.println("post id is not in collection of upvotes - downvote");
				PostsManager.getInstance().postDownvotes.put(postId, new HashSet<String>());
				PostsManager.getInstance().postDownvotes.get(postId).add(username);
				UsersManager.getInstance().getUser(username).downvotePost(postId);
				PostDAO.getInstance().downvotePostInDB(username, postId);
			}
		}
	}

	public void reverseUpvote(String username, int postId) {
		PostsManager.getInstance().postUpvotes.get(postId).remove(username);
		UsersManager.getInstance().getUser(username).removeUpvoteOfPost(postId);
		PostDAO.getInstance().reverseUpvoteInDB(username, postId);
	}

	public void reverseDownvote(String username, int postId) {
		PostsManager.getInstance().postDownvotes.get(postId).remove(username);
		UsersManager.getInstance().getUser(username).removeDownvoteOfPost(postId);
		PostDAO.getInstance().reverseDownvoteInDB(username, postId);

	}

	public void upvoteToDownvote(String username, int postId) {
		PostsManager.getInstance().postUpvotes.get(postId).remove(username);
		if (!PostsManager.getInstance().postDownvotes.containsKey(postId)) {
			PostsManager.getInstance().postDownvotes.put(postId, new HashSet<String>());
		}
		PostsManager.getInstance().postDownvotes.get(postId).add(username);
		UsersManager.getInstance().getUser(username).removeUpvoteOfPost(postId);
		UsersManager.getInstance().getUser(username).downvotePost(postId);
		PostDAO.getInstance().upvoteToDownvoteInDB(username, postId);

	}

	public void downvoteToUpvote(String username, int postId) {
		PostsManager.getInstance().postDownvotes.get(postId).remove(username);
		if (!PostsManager.getInstance().postUpvotes.containsKey(postId)) {
			PostsManager.getInstance().postUpvotes.put(postId, new HashSet<String>());
		}
		PostsManager.getInstance().postUpvotes.get(postId).add(username);
		UsersManager.getInstance().getUser(username).removeDownvoteOfPost(postId);
		UsersManager.getInstance().getUser(username).upvotePost(postId, PostsManager.getInstance().getPost(postId));
		PostDAO.getInstance().downvoteToUpvoteInDB(username, postId);
	}

	public Map<Integer, Post> searchPosts(String title) {
		Map<Integer, Post> posts = new HashMap<>();
		for (Post p : PostsManager.getInstance().getAllPosts().values()) {
			if (p.getTitle().toLowerCase().contains(title.toLowerCase())) {
				posts.put(p.getPostId(), p);
			}
		}
		return posts;
	}

	public void deletePost(int postId) {
		PostDAO.getInstance().deletePostFromDB(postId);
		for (Comment c : CommentsManager.getInstance().getCommentsOfPost(postId).values()) {
			UsersManager.getInstance().getUser(c.getUsername()).deleteCommentFromUser(postId, c.getCommentId());
			// UsersManager.getInstance().getUser(c.getUsername()).removeCommentedPost(postId);
		}
		CommentsManager.getInstance().deleteAllCommentsOfPost(postId);
		String postCategory = PostsManager.getInstance().getPost(postId).getCategory();
		String usernameOfPost = PostsManager.getInstance().getPost(postId).getUsername();
		PostsManager.getInstance().allPosts.remove(postId);
		PostsManager.getInstance().postsByCategories.get(postCategory).remove(postId);
		if (PostsManager.getInstance().postUpvotes.containsKey(postId)) {
			for (String username : PostsManager.getInstance().postUpvotes.get(postId)) {
				UsersManager.getInstance().getUser(username).removeUpvoteOfPost(postId);
			}
		}
		if (PostsManager.getInstance().postDownvotes.containsKey(postId)) {
			for (String username : PostsManager.getInstance().postDownvotes.get(postId)) {
				UsersManager.getInstance().getUser(username).removeDownvoteOfPost(postId);
			}
		}
		UsersManager.getInstance().getUser(usernameOfPost).removePost(postId);
	}

	public void removePostFromCollections(int postId) {
		String postCategory = PostsManager.getInstance().getPost(postId).getCategory();
		PostsManager.getInstance().allPosts.remove(postId);
		PostsManager.getInstance().postsByCategories.get(postCategory).remove(postId);
		if (PostsManager.getInstance().postUpvotes.containsKey(postId)) {
			for (String username : PostsManager.getInstance().postUpvotes.get(postId)) {
				UsersManager.getInstance().getUser(username).removeUpvoteOfPost(postId);
			}
			PostsManager.getInstance().postUpvotes.remove(postId);
		}
		if (PostsManager.getInstance().postDownvotes.containsKey(postId)) {
			for (String username : PostsManager.getInstance().postDownvotes.get(postId)) {
				UsersManager.getInstance().getUser(username).removeDownvoteOfPost(postId);
			}
			PostsManager.getInstance().postDownvotes.remove(postId);
		}
	}

	public void removeUpvoteFromCollection(int postId, String username) {
		if (PostsManager.getInstance().postUpvotes.containsKey(postId)) {
			PostsManager.getInstance().postUpvotes.get(postId).remove(username);
		}
	}

	public void removeDownvoteFromCollection(int postId, String username) {
		if (PostsManager.getInstance().postDownvotes.containsKey(postId)) {
			PostsManager.getInstance().postDownvotes.get(postId).remove(username);
		}
	}

}
