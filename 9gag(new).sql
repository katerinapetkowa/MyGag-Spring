USE 9gag;

CREATE TABLE categories (
category_id INT(11) UNSIGNED NOT NULL auto_increment,
category_name VARCHAR(30) NOT NULL,
PRIMARY KEY (category_id)
);

USE 9gag;
INSERT INTO categories (category_name) VALUES ('Funny');

USE 9gag;
INSERT INTO categories (category_name) VALUES ('Food');

USE 9gag;
INSERT INTO categories (category_name) VALUES ('MovieTV');

USE 9gag;
INSERT INTO categories (category_name) VALUES ('Sport');

USE 9gag;
CREATE TABLE users (
username VARCHAR(30) NOT NULL,
name VARCHAR(50) NOT NULL,
password VARCHAR(200) NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
profile_picture VARCHAR(100) NOT NULL,
description VARCHAR(300) NOT NULL,
PRIMARY KEY(username)
);

USE 9gag;
CREATE TABLE posts (
post_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
username VARCHAR(30) NOT NULL,
category_id INT(11) UNSIGNED NOT NULL,
title VARCHAR(300) NOT NULL,
upload_date TIMESTAMP,
post_picture VARCHAR(100) NOT NULL,
PRIMARY KEY(post_id),
CONSTRAINT posts_categories_category_id FOREIGN KEY (category_id) REFERENCES categories(category_id),
CONSTRAINT posts_users_username FOREIGN KEY (username) REFERENCES users(username)
);

USE 9gag;
CREATE TABLE comments(
comment_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
username VARCHAR(30) NOT NULL,
post_id INT(11) UNSIGNED NOT NULL,
text VARCHAR(1000) NOT NULL,
upload_date TIMESTAMP,
PRIMARY KEY(comment_id),
CONSTRAINT comments_users_username FOREIGN KEY(username) REFERENCES users(username),
CONSTRAINT comments_posts_post_id FOREIGN KEY(post_id) REFERENCES posts(post_id)
);

USE 9gag;
CREATE TABLE post_upvotes (
post_id INT(11) UNSIGNED NOT NULL,
username VARCHAR(30) NOT NULL,
PRIMARY KEY (post_id,username),
CONSTRAINT post_upvotes_posts_post_id FOREIGN KEY (post_id) REFERENCES posts(post_id),
CONSTRAINT post_upvotes_users_username FOREIGN KEY (username) REFERENCES users(username)
);

USE 9gag;
CREATE TABLE post_downvotes (
post_id INT(11) UNSIGNED NOT NULL,
username VARCHAR(30) NOT NULL,
PRIMARY KEY (post_id,username),
CONSTRAINT post_downvotes_posts_post_id FOREIGN KEY (post_id) REFERENCES posts(post_id),
CONSTRAINT post_downvotes_users_username FOREIGN KEY (username) REFERENCES users(username)
);