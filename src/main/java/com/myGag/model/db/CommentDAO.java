package com.myGag.model.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

import com.myGag.model.Comment;

public class CommentDAO {

	private static CommentDAO instance;

	public synchronized static CommentDAO getInstance() {
		if (instance == null) {
			instance = new CommentDAO();
		}
		return instance;
	}

	public Set<Comment> getAllCommentsFromDB() {
		Set<Comment> comments = new HashSet<Comment>();
		try {
			Statement st = DBManager.getInstance().getConnection().createStatement();
			String query = "SELECT comment_id, username, post_id, text, upload_date FROM comments;";
			ResultSet resultSet = st.executeQuery(query);
			while (resultSet.next()) {
				comments.add(new Comment(resultSet.getInt("comment_id"), resultSet.getString("username"),
						resultSet.getInt("post_id"), resultSet.getString("text"),
						resultSet.getTimestamp("upload_date").toLocalDateTime()));
			}
			resultSet.close();
			st.close();

		} catch (SQLException e) {
			System.out.println("Oops, select comments from db.");
		}
		System.out.println("Comments from db selected successfully");
		return comments;
	}

	// public ConcurrentHashMap<Integer,Comment> getCommentsOfPostFromDB(int
	// postId){
	// ConcurrentHashMap<Integer,Comment> commentsOfPost = new
	// ConcurrentHashMap<>();
	// try {
	// Statement st = DBManager.getInstance().getConnection().createStatement();
	// String query = "SELECT comment_id, user_id, post_id, text, points,
	// upload_date FROM comments WHERE post_id = " + postId + ";";
	// ResultSet resultSet = st.executeQuery(query);
	// while (resultSet.next()) {
	// commentsOfPost.put(resultSet.getInt("comment_id"), new
	// Comment(resultSet.getInt("comment_id"), resultSet.getInt("user_id"),
	// resultSet.getInt("post_id"), resultSet.getString("text"),
	// resultSet.getInt("points"),
	// resultSet.getTimestamp("upload_date").toLocalDateTime()));
	// }
	// resultSet.close();
	// st.close();
	//
	// } catch (SQLException e) {
	// System.out.println("Oops, select comments of post from db.");
	// }
	// System.out.println("Comments of post from db selected successfully");
	// return commentsOfPost;
	// }

	public int addCommentToDB(String username, int postId, String text, LocalDateTime uploadDate) {
		int commentId = 0;
		try {
			PreparedStatement st = DBManager.getInstance().getConnection().prepareStatement(
					"INSERT INTO comments (username, post_id, text, upload_date) VALUES (?, ?, ?, ?);",
					Statement.RETURN_GENERATED_KEYS);
			st.setString(1, username);
			st.setInt(2, postId);
			st.setString(3, text);
			st.setTimestamp(4, Timestamp.valueOf(uploadDate));
			st.executeUpdate();
			ResultSet rs = st.getGeneratedKeys();
			if (rs.next()) {
				commentId = rs.getInt(1);
			}
			rs.close();
			st.close();
			System.out.println("Comment added successfully to db");
		} catch (SQLException e) {
			System.out.println("Oops .. did not save the comment in db");
			e.printStackTrace();
		}
		return commentId;
	}
	

	public void deleteCommentFromDB(int commentId) {
		try {
			PreparedStatement st = DBManager.getInstance().getConnection()
					.prepareStatement("DELETE FROM comments  WHERE comment_id = ? ;");
			st.setInt(1, commentId);
			st.executeUpdate();
			st.close();
			System.out.println("Comment deleted successfully from db");
		} catch (SQLException e) {
			System.out.println("Oops .. did not delete the comment from db");
			e.printStackTrace();
		}
	}

}
