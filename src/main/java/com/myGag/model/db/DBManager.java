package com.myGag.model.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DBManager {

	private static DBManager instance;
	private Connection connection;
	
	private static final String DB_IP = "127.0.0.1";
	private static final String DB_PORT = "3306";
	private static final String DB_NAME = "9gag";
	private static final String DB_USERNAME = "root";
	private static final String DB_PASSWORD = "root";
	private static final String commonURL = "jdbc:mysql://" + DB_IP + ":" + DB_PORT + "/";
	private static final String URL = "jdbc:mysql://"+DB_IP+":"+DB_PORT+"/"+DB_NAME;
	
	private DBManager(){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			setConnection(DriverManager.getConnection(commonURL, DB_USERNAME, DB_PASSWORD));
			if (!checkIfSchemaExists(DB_NAME)) { 
				createTables(); 
			}
			setConnection(DriverManager.getConnection(URL, DB_USERNAME, DB_PASSWORD)); // establishing
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			
			connection = DriverManager.getConnection(URL, DB_USERNAME, DB_PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private boolean checkIfSchemaExists(String dbName) {
		ResultSet resultSet = null;
		try {
			resultSet = this.getConnection().getMetaData().getCatalogs(); 
			while (resultSet.next()) {
				String databaseName = resultSet.getString(1);
				if (databaseName.equals(dbName)) {
					return true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	private synchronized void createTables() {
		Statement st = null;
		try {
			this.getConnection().setAutoCommit(false);
			String createSchema = "CREATE SCHEMA 9gag;";
			String useSchema = "USE 9gag;";
			
			String createTableCategories = "CREATE TABLE categories ("
					+ "category_id INT(11) UNSIGNED NOT NULL auto_increment,"
					+ "category_name VARCHAR(30) NOT NULL,"
					+ "PRIMARY KEY (category_id));";
			
			String categoryFunny = "INSERT INTO categories (category_name) VALUES 'Funny';";
			
			String categoryMovieTV = "INSERT INTO categories (category_name) VALUES 'MovieTV';";
			
			String categoryFood = "INSERT INTO categories (category_name) VALUES 'Food';";
			
			String categorySport = "INSERT INTO categories (category_name) VALUES 'Sport';";
			
			String createTableUsers = "CREATE TABLE users ("
					+ "username VARCHAR(30) NOT NULL,"
					+ " name VARCHAR(50) NOT NULL,"
					+ " password VARCHAR(100) NOT NULL,"
					+ " email VARCHAR(50) NOT NULL UNIQUE,"
					+ " profile_picture VARCHAR(100) NOT NULL,"
					+ " description VARCHAR(1000) NOT NULL,"
					+ " PRIMARY KEY(username));";
			
			String createTablePosts = "CREATE TABLE posts ("
					+ "post_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,"
					+ " username VARCHAR(30) NOT NULL, "
					+ "category_id INT(11) UNSIGNED NOT NULL,"
					+ " title VARCHAR(140) NOT NULL,"
					+ " upload_date TIMESTAMP,"
					+ " post_picture VARCHAR(100) NOT NULL,"
					+ " PRIMARY KEY(post_id),"
					+ " CONSTRAINT posts_categories_category_id FOREIGN KEY (category_id) REFERENCES categories(category_id),"
					+ " CONSTRAINT posts_users_username FOREIGN KEY (username) REFERENCES users(username));";
			
			String createTableComments = "CREATE TABLE comments("
					+ "comment_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,"
					+ " username VARCHAR(30) NOT NULL,"
					+ " post_id INT(11) UNSIGNED NOT NULL,"
					+ " text VARCHAR(1000) NOT NULL,"
					+ " upload_date TIMESTAMP,"
					+ " PRIMARY KEY(comment_id), "
					+ "CONSTRAINT comments_users_username FOREIGN KEY(username) REFERENCES users(username),"
					+ " CONSTRAINT comments_posts_post_id FOREIGN KEY(post_id) REFERENCES posts(post_id));";
			
			String createTablePostUpvotes= "CREATE TABLE post_upvotes ("
					+ "post_id INT(11) UNSIGNED NOT NULL,"
					+ " username VARCHAR(30) NOT NULL,"
					+ " PRIMARY KEY (post_id,username),"
					+ " CONSTRAINT post_upvotes_posts_post_id FOREIGN KEY (post_id) REFERENCES posts(post_id), "
					+ "CONSTRAINT post_upvotes_users_username FOREIGN KEY (username) REFERENCES users(username));";
			
			String createTablePostDownvotes = "CREATE TABLE post_downvotes ("
					+ "post_id INT(11) UNSIGNED NOT NULL,"
					+ " username VARCHAR(30) NOT NULL, "
					+ "PRIMARY KEY (post_id,username), "
					+ "CONSTRAINT post_downvotes_posts_post_id FOREIGN KEY (post_id) REFERENCES posts(post_id),"
					+ " CONSTRAINT post_downvotes_users_username FOREIGN KEY (username) REFERENCES users(username));";
			
			st = this.getConnection().createStatement();
			st.executeUpdate(createSchema);
			st.executeUpdate(useSchema);
			st.executeUpdate(createTableCategories);
			st.executeUpdate(categoryFunny);
			st.executeUpdate(categoryMovieTV);
			st.executeUpdate(categoryFood);
			st.executeUpdate(categorySport);
			st.executeUpdate(createTableUsers);
			st.executeUpdate(createTablePosts);
			st.executeUpdate(createTableComments);
			st.executeUpdate(createTablePostUpvotes);
			st.executeUpdate(createTablePostDownvotes);
			this.getConnection().commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				this.getConnection().rollback(); // if the commit fails
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				this.getConnection().setAutoCommit(true);
				if (st != null) {
					st.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

	public synchronized static DBManager getInstance(){
		if(instance == null){
			instance = new DBManager();
		}
		return instance;
	}
	
	public synchronized Connection getConnection() {
		return connection;
	}
	
	private synchronized void setConnection(Connection con) {
		this.connection = con;
	}
}
