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

<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	
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
	    								<a href="settings">Settings</a>
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
					<input class = " input[type=text] " onfocus = "this.style.borderColor = '#b4b4b4'" style = "background-image: url('img/searchicon.png');color: #b4b4b4"  type="text" name="title" required  placeholder="Search..">
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
			

<div>

	<div class="container">
	
			<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			
              </div>
              </div>
              
            
             </div> 
			<div class="container">
			<div class="row">
			<div class="col-md-8">
			
			<h1 style = "font-family:sans-serif" class="page-header">
                    
                    
                </h1>
			
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav" style = "list-style-type: none; margin: 0;
    padding: 0;
    width: 200px;
    background-color: #ffffff;">
					<li>
                        <a style="font-size:18px;color:#000000;width:150px;display:block"  href="settings">Account</a>
                    </li>
                    
                    <li>
                        <a style="border-radius:3px;background-color:#1ab188;width:150px;display: block;font-size:18px;color:#ffffff"" href="password">Password</a>
                    </li>
                    
              </ul>
              
			<div>
			<div style="margin-left:25%;padding:1px 16px;height:1000px;">
			<h1> Password </h1>
			<br>
			
			<form id="submitForm" class="signup" action="changePassword" method="post">	
   					
			
				<small style="color: #000000" ><b>Password</b> </small>
			<input type = "password" name = "oldPassword " id="old_password" style = "border-radius:0px;width: 100%;padding: 12px 20px;margin: 2px 0;display: inline-block; border: 1px solid #ccc;
   					box-sizing: border-box;background-color:#ffffff; height:45px" 
   					onfocus = "this.style.borderColor = 'green'"
   					onfocusout = "this.style.borderColor = '#a0b3b0'"
   					maxlength="30" 
   					required autocomplete="off" >
   			<br>	
   			<br>	
   			
   				<small style="color: #000000" ><b>New Password</b> </small>
			<input type = "password" name = "password" id="password" style = ";width: 100%;padding: 12px 20px;margin: 2px 0;display: inline-block; border: 1px solid #ccc;
   					box-sizing: border-box;background-color:#ffffff; height:45px" 
   					onfocus = "this.style.borderColor = 'green'"
   					onfocusout = "this.style.borderColor = '#a0b3b0'"
   					maxlength="30"  
   					required autocomplete="off">
   					
   				<br>
   				<br>
   					
   				<small style="color: #000000" ><b>Confirm Password</b> </small>
			<input  type="password" name="password2" id="confirm_password" style = ";width: 100%;padding: 12px 20px;margin: 2px 0;display: inline-block; border: 1px solid #ccc;
   					box-sizing: border-box;background-color:#ffffff; height:45px" 
   					onfocus = "this.style.borderColor = 'green'"
   					onfocusout = "this.style.borderColor = '#a0b3b0'"
   					maxlength="30"  
   					required autocomplete="off">
   					
   					<br>
   					<br>
   					
   					
				 		
				 		<button class="button button-block" style = "background-color:#1ab188" onmouseover = "this.style.backgroundColor = '#179b77'" onmouseout = "this.style.backgroundColor = '#1ab188'"type="button" onclick="asd()">Save Changes</button>
				
				</form>
			</div>
		</div>




	</div>
	<!-- /.container -->
	<script src="js/index.js"></script>
	<script>
		function asd(){
			var pass = $('#password').val();
			var newPass = $('#confirm_password').val();
			if(pass == ""){
				$('#password').get(0).setCustomValidity('Please enter a new password !');
				$('#password').get(0).reportValidity();
				return;
			}
			if(newPass == ""){
				$('#confirm_password').get(0).setCustomValidity('Please confirm new password!');
				$('#confirm_password').get(0).reportValidity();
				return;
			}
			if(pass != newPass){
				$('#confirm_password').get(0).setCustomValidity('Passwords Don\'t match!');
				$('#confirm_password').get(0).reportValidity();
			}else{
				var params = {
						oldPassword : $('#old_password').val(),
						password : $('#password').val(),
						confirmPassword : $('#confirm_password').val()
					};
					$.post("ValidatePasswordServlet", $.param(params), function(
							responseText) {
						console.log(responseText);
						if (responseText[0] == "f") {
							$('#old_password').get(0).setCustomValidity(
									'Wrong password');
							$('#old_password').get(0).reportValidity();
						}else {
							$('#submitForm').submit();
						}
					});
			}
		}
	}	
</script>
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>

</html>