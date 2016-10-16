<%@page import="com.myGag.model.UsersManager"%>
<%@page import="com.myGag.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.myGag.model.PostsManager"%>
<%@ page import="com.myGag.model.Post"%>
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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>

<div id="id03" class="modal" >
	 <div class="form" style = " opacity: 1 !important;
    filter: alpha(opacity=100);
background: #13232f;">
	 
<!-- 	 <form class="modal-content animate" action=""> -->
     
      <div class="tab-content">

        <form  action="createpost" method="post" enctype="multipart/form-data"> 
<!--         <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span> -->

          <h1 style = "text-align: center; color: #ffffff;font-weight: 300; margin: 0 0 40px;">Upload Post</h1>
          
          
          
   			
            <div class="field-wrap">
              <label style = "font-size: 19px">
                Title<span class="req">*</span>
              </label>
              <input type="text" name="title" onfocus = "this.style.borderColor = '#1ab188'" onfocusout = "this.style.borderColor = '#a0b3b0' "style = "font-size: 22px;display: block;width: 100%;height: 100%;
              padding: 5px 10px; background: none; color: #ffffff; border-radius: 0;background-image: none; border: 1px solid #a0b3b0;" 
              maxlength="140" required autocomplete="off"/>
              <input id="username" name="username" type="hidden" value="<c:out value="${sessionScope.loggedAs}"></c:out>" size="30" required>
            </div>
            
               
 		<div class="field-wrap">
         
            <input type="file"  name="postPicture" accept="image/*" onfocus = "this.style.borderColor = '#1ab188'" onfocusout = "this.style.borderColor = '#a0b3b0' "style = "font-size: 22px;display: block;width: 100%;height: 100%;
              padding: 5px 10px; background: none; color: #ffffff; border-radius: 0;background-image: none; border: 1px solid #a0b3b0;" 
              required autocomplete="off"/>
          </div> 
          
          <div class="field-wrap">  
 		   	
 		     	<h2 style = "color: #a0b3b0"><strong>Choose category: </strong></h2>
 		    
 		     	<select name = "category"> 
 		     	  
				  <option value="Funny"> Funny </option>
				  <option value="MovieTV"> MovieTV </option>
				  <option value="Sport"> Sport </option>
				  <option value="Food"> Food </option>
				 </select>
			 	
 		 </div>   
           
          
 		
          <button class="button button-block"  type="submit">Upload</button>
         <br>
<!--           <button class="button button-block" type="submit" onclick="window.location.href='/MyGag/register.html'"> Register</button> -->
          
          </form>
        
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/alex.js"></script> 
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
<!--  </form> -->
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

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
				 <li>
                    <button class="dropbtnlog" id = "upload" onclick="document.getElementById('id03').style.display='block'" style="width:auto;" >Upload</button> 

                    </li>

				 <li> <div class="dropdown">
 							 <img class="dropbtn" 
					src="profilePicture?username=${UsersManager.getInstance().getUser(sessionScope.loggedAs).getUsername()}" alt="" height="55" width="55"> 
  									<div class="dropdown-content">
	    								<a style = "text-decoration: none" onmouseover="this.style.color = '#b4b4b4'" href="profile">My Profile</a>
	    								<a style = "text-decoration: none" onmouseover="this.style.color = '#b4b4b4'" href="settings">Settings</a>
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
                        <a style="border-radius:3px;background-color:#1ab188;width:150px;display: block;font-size:18px;color:#ffffff" href="settings">Account</a>
                    </li>
                    
                    <li>
                        <a style="font-size:18px;color:#000000;width:150px;display:block" href="password">Password</a>
                    </li>
                    
              </ul>
              
			<div>
			
			<div style="margin-left:25%;padding:1px 16px;height:1000px;">
			<h1> Account </h1>
			<br>
			<form action="changeSettings" method="post" enctype="multipart/form-data">
				<small style="color: #000000;" ><b>Avatar</b> </small>
				<img class="img-responsive"
					src="profilePicture?username=${UsersManager.getInstance().getUser(sessionScope.loggedAs).getUsername()}" alt="" width="100">
			<br>
			<input  type = "file" name = "profilePicture" accept="image/*"  
   					autocomplete="off" >
   				
   				<br>
   				<br>
   					
			
				<small style="color: #000000" ><b>Your name</b> </small>
				<input id="username" name="username" type="hidden" value="<c:out value="${sessionScope.loggedAs}"></c:out>" size="30" required>
			<input type = "text" id = "name"name = "name" style = "border-radius:0px;width: 100%;padding: 12px 20px;margin: 2px 0;display: inline-block; border: 1px solid #ccc;
   					box-sizing: border-box;background-color:#ffffff; height:45px" 
   					onfocus = "this.style.borderColor = '#1ab188'"
   					onfocusout = "this.style.borderColor = '#a0b3b0'"
   					maxlength="50" value="${UsersManager.getInstance().getUser(sessionScope.loggedAs).getName()}" 
   					required autocomplete="off" >
   			<br>	
   			<br>	
   			
   				<small style="color: #000000" ><b>Email</b> </small>
			<input type = "email" name = "email" style = ";width: 100%;padding: 12px 20px;margin: 2px 0;display: inline-block; border: 1px solid #ccc;
   					box-sizing: border-box;background-color:#ffffff; height:45px" 
   					onfocus = "this.style.borderColor = '#1ab188'"
   					onfocusout = "this.style.borderColor = '#a0b3b0'"
   					maxlength="40" value="${UsersManager.getInstance().getUser(sessionScope.loggedAs).getEmail()}" 
   					required autocomplete="off">
   					
   				<br>
   				<br>
   					
   				<small style="color: #000000" ><b>Tell people who you are</b> </small>
			<textarea  name = "description" id = "description" style = ";width: 100%;padding: 12px 20px;margin: 2px 0;display: inline-block; border: 1px solid #ccc;
   					box-sizing: border-box;background-color:#ffffff; height:100px" 
   					onfocus = "this.style.borderColor = '#1ab188'"
   					onfocusout = "this.style.borderColor = '#a0b3b0'"
   					maxlength="120"  
   					required autocomplete="off">${UsersManager.getInstance().getUser(sessionScope.loggedAs).getDescription()}</textarea>
   					
   					<br>
   					<br>
   					
   					
				 		
				 		<button class="button button-block" style = "background-color:#1ab188" onmouseover = "this.style.backgroundColor = '#179b77'" onmouseout = "this.style.backgroundColor = '#1ab188'"type="submit">Save Changes</button>
				
				</form>
				
					<br>
						<a style = "text-decoration: none; color: black" onmouseover = "this.style.color = '#179b77'" onmouseout = "this.style.color = 'black'"href = "deleteAccount"> Delete account</a>
			</div>
		</div>




	</div>
	<!-- /.container -->

 <script >
$(document).ready(function(){
    $("#upload").click(function(){
        $("#id03").modal();
    });
});
</script>
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>

</html>