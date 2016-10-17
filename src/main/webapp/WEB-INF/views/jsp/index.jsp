<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.myGag.model.PostsManager"%>
<%@ page import="com.myGag.model.UsersManager"%>
<%@ page import="com.myGag.model.Post"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/normalize.css">


<link rel="stylesheet" href="css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script src="js/loginValidate.js"></script>
<script src="js/validateRegister.js"></script>
</head>


<body>

	<div id="myModal" class="modal">
		<div class="form"
			style="opacity: 1 !important; filter: alpha(opacity = 100); background: #13232f;">

			<!-- 	 <form class="modal-content animate" action=""> -->

			<div class="tab-content">
				<form id="loginForm" class="login"
					action="javasript:validateLogin()" method="POST">
					<!--          <span  class="close" title="Close Modal">x</span>  -->

					<h1
						style="text-align: center; color: #ffffff; font-weight: 300; margin: 0 0 40px;">Please
						log in!</h1>




					<div class="field-wrap">
						<label> Username<span class="req">*</span>
						</label> <input type="text" name="username"
							onfocus="this.style.borderColor = '#1ab188'"
							onfocusout="this.style.borderColor = '#a0b3b0' "
							style="font-size: 22px; display: block; width: 100%; height: 45px; padding: 5px 10px; background: none; color: #ffffff; border-radius: 0; background-image: none; border: 1px solid #a0b3b0;"
							maxlength="30" required autocomplete="off" />
					</div>




					<div class="field-wrap">
						<label> Password<span class="req">*</span>
						</label> <input type="password" name="password"
							onfocus="this.style.borderColor = '#1ab188'"
							onfocusout="this.style.borderColor = '#a0b3b0' "
							style="font-size: 22px; display: block; width: 100%; height: 45px; padding: 5px 10px; background: none; color: #ffffff; border-radius: 0; background-image: none; border: 1px solid #a0b3b0;"
							maxlength="30" required autocomplete="off" />
					</div>
					<div id="message"></div>
					<button class="button button-block" type="submit"
						onclick="validateLogin()">Log in</button>
					<br>
					<!--           <button class="button button-block" type="submit" onclick="window.location.href='/MyGag/register.html'"> Register</button> -->

				</form>





			</div>
			<!-- tab-content -->

		</div>
		<!-- /form -->
		<!--  </form> -->
		<script
			src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

		<script src="js/index.js"></script>

	</div>

	<div id="id02" class="modal">
		<div class="form"
			style="opacity: 1 !important; filter: alpha(opacity = 100); background: #13232f;">

			<!-- 	 <form class="modal-content animate" action=""> -->

			<script src="js/forms.js"></script>
			<div class="tab-content">

				<form id="registerForm" class="signup" accept = "image/*" onsubmit="return Validate(this)"
					action="javascript:validateRegister()"
					enctype="multipart/form-data">
					<!--         <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span> -->

					<h1
						style="text-align: center; color: #ffffff; font-weight: 300; margin: 0 0 40px;">Sign
						up</h1>




					<div class="field-wrap">
						<label> Name<span class="req">*</span>
						</label> <input id="name" type="text" name="name"
							pattern = "[a-zA-Z. ]+" title = "Only letters"
							onfocus="this.style.borderColor = '#1ab188'"
							onfocusout="this.style.borderColor = '#a0b3b0'"
							style="font-size: 22px; display: block; width: 100%; height: 45px; padding: 5px 10px; background: none; color: #ffffff; border-radius: 0; background-image: none; border: 1px solid #a0b3b0;"
							maxlength="30" required autocomplete="off" />
					</div>


					<div class="field-wrap">
						<label> Username<span class="req">*</span>
						</label> <input id="username" type="text" name="username"
							pattern = "^[A-Za-z0-9]+(?:[._-][A-Za-z0-9]+)*$" title = "Your username should start with a letter or a digit and cannot contain space"
							onfocus="this.style.borderColor = '#1ab188'"
							onfocusout="this.style.borderColor = '#a0b3b0' "
							style="font-size: 22px; display: block; width: 100%; height: 45px; padding: 5px 10px; background: none; color: #ffffff; border-radius: 0; background-image: none; border: 1px solid #a0b3b0;"
							maxlength="30" required autocomplete="off" />
					</div>

					<div class="field-wrap">
						<label> Email<span class="req">*</span>
						</label> <input type="email" name="email" maxlength="40"
							onfocus="this.style.borderColor = '#1ab188'"
							onfocusout="this.style.borderColor = '#a0b3b0' "
							style="font-size: 22px; display: block; width: 100%; height: 45px; padding: 5px 10px; background: none; color: #ffffff; border-radius: 0; background-image: none; border: 1px solid #a0b3b0;"
							required autocomplete="off" />
					</div>

					<div class="field-wrap">
						<label> Password<span class="req">*</span>
						</label> <input type="password" name="password" maxlength="30"
							onfocus="this.style.borderColor = '#1ab188'"
							onfocusout="this.style.borderColor = '#a0b3b0' "
							style="font-size: 22px; display: block; width: 100%; height: 45px; padding: 5px 10px; background: none; color: #ffffff; border-radius: 0; background-image: none; border: 1px solid #a0b3b0;"
							required autocomplete="off" />
					</div>

					<div class="field-wrap">
						<label> Confirm Password<span class="req">*</span>
						</label> <input type="password" name="password2" id="confirm_password"
							maxlength="30" onfocus="this.style.borderColor = '#1ab188'"
							onfocusout="this.style.borderColor = '#a0b3b0' "
							style="font-size: 22px; display: block; width: 100%; height: 45px; padding: 5px 10px; background: none; color: #ffffff; border-radius: 0; background-image: none; border: 1px solid #a0b3b0;"
							required autocomplete="off" />
					</div>

					<div class="field-wrap">

						<input type="file" accept = "image/*" id="fileMaina" name="profilePicture"
							 onfocus="this.style.borderColor = '#1ab188'"
							onfocusout="this.style.borderColor = '#a0b3b0' "
							style="font-size: 22px; display: block; width: 100%; height: 45px; padding: 5px 10px; background: none; color: #ffffff; border-radius: 0; background-image: none; border: 1px solid #a0b3b0;"
							required autocomplete="off" />
					</div>
					<div id="message2"></div>
					<button class="button button-block" type="submit">Register</button>
					<br>
					<!--           <button class="button button-block" type="submit" onclick="window.location.href='/MyGag/register.html'"> Register</button> -->

				</form>
				<script
					src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

				<script src="js/alex.js"></script>

				<script
					src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

				<script src="js/index.js"></script>
			</div>
		</div>
	</div>

	<div id="id03" class="modal">
		<div class="form"
			style="opacity: 1 !important; filter: alpha(opacity = 100); background: #13232f;">

			<!-- 	 <form class="modal-content animate" action=""> -->

			<div class="tab-content">

				<form accept="image/*" onsubmit="return Validate(this)" action="createpost" method="post"
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
			<a href="index"> <img alt="MyGag" src="img/9gag-logo.png"
				height="55" width="55">
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
				<c:choose>
					<c:when test="${sessionScope.loggedAs != null}">
						<li>
							<button class="dropbtnlog" id="upload"
								onclick="document.getElementById('id03').style.display='block'"
								style="width: auto;">Upload</button>

						</li>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${sessionScope.loggedAs == null}">
						<li>
							<button class="dropbtnlog" id="myBtn"
								onclick="document.getElementById('id02').style.display='none';document.getElementById('myModal').style.display='block;"
								style="width: auto;">Log in</button>
						</li>
						<li>
							<button class="dropbtnlog" id="register"
								onclick="document.getElementById('id02').style.display='block';document.getElementById('myModal').style.display='none';"
								style="width: auto;">Sign up</button>
						</li>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test='${sessionScope.loggedAs != null}'>


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



									</form>

								</div>
							</div>
						</li>
					</c:when>
				</c:choose>

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
	<!-- /.container --> </nav>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-8">

				<h1 style="font-family: sans-serif" class="page-header">
					Welcome to our site MyGag!</h1>

				<c:forEach var="post"
					items='${PostsManager.getInstance().getFreshPosts()}'>

					<!-- First Blog Post -->
					<h2>
						<a style="text-decoration: none; color: #222222"
							onmouseover="this.style.color = '#23527c'"
							onmouseout="this.style.color = '#222222'"
							href="viewpost?post_id=<c:out value="${post.postId}"></c:out>">
							<c:out value="${post.title}"></c:out>
						</a>
					</h2>

					<p>
						<span class="glyphicon glyphicon-time"></span>
						<c:out value="${post.uploadDate}"></c:out>
					</p>
					<hr>
					<a href="viewpost?post_id=<c:out value="${post.postId}"></c:out>"><img
						class="img-responsive"
						src="postPicture?post_id=<c:out value="${post.postId}"></c:out>"
						alt="" width="500"></a>
					<hr>


				</c:forEach>
			</div>
		</div>

		<script>
			//  var modal = document.getElementById('id01');
			
			// modal.addEventListener('window.onclick', function(event){
				
			// 	modal.style.display = 'none';
			// }); 
			//Closing the log in modal box
			
			$(document).ready(function(){
			    $("#myBtn").click(function(){
			        $("#myModal").modal();
			    });
			});
			
			
			
			</script>
			
					<script>
			
			$(document).ready(function(){
			    $("#upload").click(function(){
			        $("#id03").modal();
			    });
			});
			</script>

		<script>
				var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];    
				function Validate(oForm) {
				    var arrInputs = oForm.getElementsByTagName("input");
				    for (var i = 0; i < arrInputs.length; i++) {
				        var oInput = arrInputs[i];
				        if (oInput.type == "file") {
				            var sFileName = oInput.value;
				            if (sFileName.length > 0) {
				                var blnValid = false;
				                for (var j = 0; j < _validFileExtensions.length; j++) {
				                    var sCurExtension = _validFileExtensions[j];
				                    if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
				                        blnValid = true;
				                        break;
				                    }
				                }
				                
				                if (!blnValid) {
				                    alert("Sorry, " + sFileName + " is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
				                    return false;
				                }
				            }
				        }
				    }
				  
				    return true;
				}

</script>
		<script>
// //Get the modal
// var modal2 = document.getElementById('id02');

// // When the user clicks anywhere outside of the modal, close it
// window.onclick = function(event) {
//     if (event.target == modal2) {
//         modal2.style.display = "none";
//     }
// }
// Closing the register modal box
$(document).ready(function(){
    $("#register").click(function(){
        $("#id02").modal();
    });
});




function validateRegister(){
	var form = $('#registerForm');
	form.ajaxSubmit({
		type : 'post',
		url : 'registerValidate',
		async: true,
		success : function(results){
			if(results!=null && results != ""){
				showMesage(results);					
				
			}else{
				alert("Some error occured, try again.");
			}
		}
	})
}

function showMesage(results){
	if(results == 'success'){
		$('#message2').html("<font size = '3' color='#179b77'><b>You registerred successfully</b></font>");
		setTimeout(function(){
			window.location.href = "index";
		}, 1000)
	}else if (results == 'usernameTaken'){
		$('#message2').html("<font size = '3'color='#c62115'>Username already taken</b></font>");
	}else{
		$('#message2').html("<font size = '3'color='#c62115'><b>Passwords don't match</b></font>")
	}
}


</script>



	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>
<script src="http://malsup.github.com/jquery.form.js"></script>
</html>