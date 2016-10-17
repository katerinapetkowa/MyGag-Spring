<%@page import="com.myGag.model.UsersManager"%>
<%@page import="com.myGag.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.myGag.model.PostsManager"%>
<%@ page import="com.myGag.model.Post"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<%
	response.addHeader("Cache-Control",
			"no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
	response.addHeader("Pragma", "no-cache");
	response.addDateHeader("Expires", 0);
%>
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
<link href="css/modal.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link rel="stylesheet" href="css/normalize.css">


<link rel="stylesheet" href="css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>

<body>

	<div id="id03" class="modal">
		<div class="form"
			style="opacity: 1 !important; filter: alpha(opacity = 100); background: #13232f;">

			<!-- 	 <form class="modal-content animate" action=""> -->

			<div class="tab-content">

				<form action="createpost" method="post"
					enctype="multipart/form-data">
					<!--         <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span> -->

					<h1
						style="text-align: center; color: #ffffff; font-weight: 300; margin: 0 0 40px;">Upload
						Post</h1>




					<div class="field-wrap">
						<label> Title<span class="req">*</span>
						</label> <input type="text" name="title"
							onfocus="this.style.borderColor = '#1ab188'"
							onfocusout="this.style.borderColor = '#a0b3b0' "
							style="font-size: 22px; display: block; width: 100%; height: 45px; padding: 5px 10px; background: none; color: #ffffff; border-radius: 0; background-image: none; border: 1px solid #a0b3b0;"
							maxlength="140" required autocomplete="off" /> <input
							id="username" name="username" type="hidden"
							value="<c:out value="${sessionScope.loggedAs}"></c:out>"
							size="30" required>
					</div>


					<div class="field-wrap">

						<input type="file" name="postPicture" accept="image/*"
							onfocus="this.style.borderColor = '#1ab188'"
							onfocusout="this.style.borderColor = '#a0b3b0' "
							style="font-size: 22px; display: block; width: 100%; height: 45px; padding: 5px 10px; background: none; color: #ffffff; border-radius: 0; background-image: none; border: 1px solid #a0b3b0;"
							required autocomplete="off" />
					</div>

					<div class="field-wrap">

						<h2 style="color: #a0b3b0">
							<strong>Choose category: </strong>
						</h2>

						<select name="category">

							<option value="Funny">Funny</option>
							<option value="MovieTV">MovieTV</option>
							<option value="Sport">Sport</option>
							<option value="Food">Food</option>
						</select>

					</div>



					<button class="button button-block" type="submit">Upload</button>
					<br>
					<!--           <button class="button button-block" type="submit" onclick="window.location.href='/MyGag/register.html'"> Register</button> -->

				</form>

				<script
					src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

				<script src="js/alex.js"></script>

			</div>
			<!-- tab-content -->

		</div>
		<!-- /form -->
		<!--  </form> -->
		<script
			src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

		<script src="js/index.js"></script>

	</div>

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
				<li><a href="hotposts">Hot</a></li>

				<li><a href="freshposts">Fresh</a></li>
				<li><a href="funnyposts">Funny</a></li>
				<li><a href="movieTVposts">MovieTV</a></li>
				<li><a href="sportposts">Sport</a></li>
				<li><a href="foodposts">Food</a></li>
				<li>
					<button class="dropbtnlog" id="upload"
						onclick="document.getElementById('id03').style.display='block'"
						style="width: auto;">Upload</button>

				</li>

				<li>
					<div class="dropdown">
						<img class="dropbtn"
							src="profilePicture?username=${UsersManager.getInstance().getUser(sessionScope.loggedAs).getUsername()}"
							alt="" height="55" width="55">
						<div class="dropdown-content">
							<a style="text-decoration: none"
								onmouseover="this.style.color = '#b4b4b4'" href="profile">My
								Profile</a> <a style="text-decoration: none"
								onmouseover="this.style.color = '#b4b4b4'" href="settings">Settings</a>
							<form action="logOut" method="post">

								<button class="dropbtnlog" type="submit">Logout</button>
								<%
									response.setHeader("Pragma", "No-cache");
									response.setDateHeader("Expires", 0);
									response.setHeader("Cache-Control", "no-cache");
								%>


							</form>

						</div>
					</div>
				</li>
				<li>
					<form action="searchpost" method="get">
						<input class=" input[type=text] "
							onfocus="this.style.borderColor = '#b4b4b4'"
							style="background-image: url('img/searchicon.png'); color: #b4b4b4"
							type="text" name="title" required placeholder="Search..">
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

	<div style="background-color: #222222">


		<!-- 				<h1> class="page-header" My profile</h1> -->

		<br>


		<center>
			<img class="img-responsive"
				src="profilePicture?username=${UsersManager.getInstance().getUser(sessionScope.loggedAs).getUsername()}"
				alt="" width="100">
		</center>
		<center>
			<h3 style="color: #b4b4b4">${UsersManager.getInstance().getUser(sessionScope.loggedAs).getName()}</h3>
		</center>
		<center>
			<h4 style="color: #b4b4b4">${UsersManager.getInstance().getUser(sessionScope.loggedAs).getDescription()}</h4>
		</center>
		<!-- 				<a style = "text-decoration: none"href = "deletePage.jsp"> Delete account</a> -->
		<br>
		<hr>
	</div>

	<!-- 			</div> -->
	<!-- 			</div> -->
	<div>
		<nav style="border-bottom: 0.001px solid #b4b4b4" role="navigation">
		<div class="container">

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a
						style="border-bottom: solid #b4b4b4; font-size: 18px; color: #222222"
						href="profile">Posts</a></li>

					<li><a style="font-size: 18px; color: #222222"
						href="upvotedPosts">Upvotes</a></li>
					<li><a style="font-size: 18px; color: #222222"
						href="commentedPosts">Comments</a></li>
				</ul>
			</div>
		</div>
		</nav>

	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-8">

				<c:if
					test='${UsersManager.getInstance().getUser(sessionScope.loggedAs).getFreshPosts().isEmpty()}'>
					<h3 class="page-header">You have no posts</h3>
				</c:if>

				<c:forEach var='post'
					items='${UsersManager.getInstance().getUser(sessionScope.loggedAs).getFreshPosts().values()}'>


					<!-- First Blog Post -->
					<h2>
						<a style="text-decoration: none; color: #222222"
							onmouseover="this.style.color = '#23527c'"
							onmouseout="this.style.color = '#222222'"
							href="viewpost?post_id=${post.postId}"><c:out
								value="${post.title}"></c:out></a>
					</h2>

					<p>
						<span class="glyphicon glyphicon-time"></span> ${post.uploadDate}
					</p>
					<hr>
					<a href="viewpost?post_id=${post.postId}"> <img
						class="img-responsive" src="postPicture?post_id=${post.postId}"
						alt="" width="500"></a>
					<hr>

				</c:forEach>
			</div>
		</div>




	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<script>
		$(document).ready(function() {
			$("#upload").click(function() {
				$("#id03").modal();
			});
		});
	</script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>

</html>