<%@page import="com.myGag.model.UsersManager"%> 
<%@page import="com.myGag.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.myGag.model.PostsManager"%>
<%@ page import="com.myGag.model.Post"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>MyGag</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/blog-home.css" rel="stylesheet">
<link href="css/button.css" rel="stylesheet">
<link href="css/dropdown.css" rel="stylesheet">
<link href="css/LogOutButton.css" rel="stylesheet">
<link href="css/searchBox.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">

		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">

			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="index"> <img src="img/9gag-logo.png" alt="MyGag"
				width="55" height="55">
			</a>

		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
					<li>
                        <a href="hotposts">Hot</a>
                    </li>
                    
                    <li>
                        <a href="freshposts">Fresh</a>
                    </li>
				<li><a href="funnyposts">Funny</a></li>
				<li><a href="movieTVposts">MovieTV</a></li>
				<li><a href="sportposts">Sport</a></li>
				<li><a href="foodposts">Food</a></li>
				<li><a href="uploadpost"> Upload </a></li>

				 <li> <div class="dropdown">
 							 <img class="dropbtn" 
					src="profilePicture?username=${UsersManager.getInstance().getUser(sessionScope.loggedAs).getUsername()}" alt="" height="55" width="55"> 
  									<div class="dropdown-content">
	    								<a href="profile">My Profile</a>
	    								<a href="changeSettings">Settings</a>
	    								<form action = "logOut" method = "post">
	    								
	   									<button class="dropbtnlog" type = "submit" >Logout</button>
	   								<% 
	    								
	    								response.setHeader("Pragma", "No-cache"); 
	    								response.setDateHeader("Expires", 0); 
	    								response.setHeader("Cache-Control", "no-cache"); 
	    								
	    							%>
	   									
	   								
	   									</form>
	    						
  									</div>
						</div> </li>
			       <li>
					<form action = "searchpost" method = "get">
					<input class = " input[type=text] " style = "color: #b4b4b4"  type="text" name="title" placeholder="Search..">
					</form>
					</li>

			</ul>

		</div>
		<!-- /.navbar-collapse -->
	</div>
	</nav>
	<!-- /.container --> 

	<!-- Page Content -->
<!-- 	<div class="container" > -->

<!-- 		<div class="row" > -->

			<!-- Blog Entries Column -->
			
<div  style="background-color:#222222">

				
<!-- 				<h1> class="page-header" My profile</h1> -->
			
			<br>	
				
				
				<center><img class="img-responsive"
					src="profilePicture?username=${UsersManager.getInstance().getUser(sessionScope.loggedAs).getUsername()}" alt=""  width="100"></center>
				<center><h3 style = "color: #b4b4b4">${UsersManager.getInstance().getUser(sessionScope.loggedAs).getName()}</h3></center>
				<center><h4 style = "color: #b4b4b4">${UsersManager.getInstance().getUser(sessionScope.loggedAs).getDescription()}</h4></center>
<!-- 				<a style = "text-decoration: none"href = "deletePage.jsp"> Delete account</a> -->
		<br>
				<hr>
		</div>	
			
<!-- 			</div> -->
<!-- 			</div> -->
<div>
<nav style = "border-bottom: 0.001px solid #b4b4b4"  role="navigation">
	<div class="container">
	
			<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
					<li>
                        <a style="font-size:18px;color:#222222" href="profile">Posts</a>
                    </li>
                    
                    <li>
                        <a style="font-size:18px;color:#222222" href="upvotedPosts">Upvotes</a>
                    </li>
                    <li>
                        <a style="border-bottom: solid #b4b4b4;font-size:18px;color:#222222" href="commentedPosts">Comments</a>
                    </li>
              </ul>
              </div>
              </div>
              </nav>
              
             </div> 
			<div class="container">
			<div class="row">
			<div class="col-md-8">
			
				<c:forEach var='post' items='${UsersManager.getInstance().getUser(sessionScope.loggedAs).getCommentedPosts().values()}'>
				
				
				<!-- First Blog Post -->
				<h2>
					<a style = "text-decoration: none; color:#222222" onmouseover="this.style.color = '#23527c'" onmouseout="this.style.color = '#222222'" 
					href="viewpost?post_id=${post.postId}"><c:out value="${post.title}"></c:out></a>
				</h2>

				<p>
					<span class="glyphicon glyphicon-time"></span>
					${post.uploadDate}</p>
				<hr>
				<a href="viewpost?post_id=${post.postId}"> <img class="img-responsive"
					src="postPicture?post_id=${post.postId}" alt="" width="500"></a>
				<hr>

				</c:forEach>
			</div>
		</div>




	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>


</html>