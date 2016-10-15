<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.myGag.model.PostsManager" %>
<%@ page import="com.myGag.model.Post" %>
<%@ page import = "com.myGag.model.UsersManager" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
            
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
               <a href="index"> <img alt="MyGag" src="img/9gag-logo.png" height="55" width="55"> </a>
               
                 
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
               		 <li>
                        <a href="hotposts">Hot</a>
                    </li>
                    
                    <li>
                        <a href="freshposts">Fresh</a>
                    </li>
                    <li>
                        <a href="funnyposts">Funny</a>
                    </li>
                    <li>
                        <a href="movieTVposts">MovieTV</a>
                    </li>
                    <li>
                        <a href="sportposts">Sport</a>
                    </li>
                    <li>
                        <a href="foodposts">Food</a>
                    </li>
                    <c:choose>
                    <c:when test="${sessionScope.loggedAs != null}">
                    <li>
                        <a href="uploadpost"> Upload </a>
                    </li>
                    </c:when>
                    </c:choose>
                     <c:choose>
                     <c:when test='${sessionScope.loggedAs != null}'>
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
						</c:when>
						</c:choose>
					<li>
					<form action = "searchpost" method = "get">
					<input class = " input[type=text] " onfocus = "this.style.borderColor = '#b4b4b4'" style = "background-image: url('img/searchicon.png');color: #b4b4b4"  type="text" name="title" required  placeholder="Search..">
					</form>
					</li>	
					
                    
                </ul>
                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <!-- Blog Entries Column -->
            <div class="col-md-8">

                <h1 class="page-header">
                    Welcome to our site MyGag!
                    
                </h1>
               
               <c:set var="title" value="${param.title}" scope="request" />
               <h4>Search results for "<c:out value="${requestScope.title}"></c:out>"</h4>
               <c:if test='${PostsManager.getInstance().searchPosts(requestScope.title).isEmpty()}'>
               	<h4>No results</h4>
               </c:if>
				<c:forEach var = "post" items='${PostsManager.getInstance().searchPosts(requestScope.title).values()}'>
                <!-- First Blog Post -->
              
                <h2>
                    <a style = "text-decoration: none; color:#222222" onmouseover="this.style.color = '#23527c'" onmouseout="this.style.color = '#222222'" href="viewpost?post_id=<c:out value="${post.postId}"></c:out>"> <c:out value="${post.title}"></c:out></a>
                </h2>
               
                <p><span class="glyphicon glyphicon-time"></span> <c:out value="${post.uploadDate}"></c:out> </p>
                <hr>
                <a href="viewpost?post_id=<c:out value="${post.postId}"></c:out>"><img class="img-responsive" src="postPicture?post_id=<c:out value="${post.postId}"></c:out>" alt="" width = "500"></a>
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