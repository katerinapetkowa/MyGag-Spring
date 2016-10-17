<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.myGag.model.PostsManager"%>
<%@ page import="com.myGag.model.Post"%>
<%@ page import="com.myGag.model.UsersManager"%>
<%@ page import="com.myGag.model.User"%>
<%@ page import="com.myGag.model.CommentsManager"%>
<%@ page import="com.myGag.model.Comment"%>
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
<link href="css/postDetails.css" rel="stylesheet">
<link href="css/searchBox.css" rel="stylesheet">
<link href="css/modal.css" rel="stylesheet">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="js/loginValidate.js"></script>
<script src="js/validateRegister.js"></script>
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
});
</script>
<script>
function byId(e){return document.getElementById(e);}

window.addEventListener('load', mInit, false);

function mInit()
{
    var tgt = byId('image');
    tgt.secondSource = 'img/redheart2.png';
}

function byId(e){return document.getElementById(e);}

function action() 
{
    var tgt = byId('image');
    var tmp = tgt.src;
    tgt.src = tgt.secondSource;
    tgt.secondSource = tmp;
};
</script>

<script>
function byId(e){return document.getElementById(e);}

window.addEventListener('load', mInit, false);

function mInit()
{
    var tgt = byId('image2');
    tgt.secondSource = 'img/reddislike2.png';
}

function byId(e){return document.getElementById(e);}

function action2() 
{
    var tgt = byId('image2');
    var tmp = tgt.src;
    tgt.src = tgt.secondSource;
    tgt.secondSource = tmp;
};

</script>



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

				<form id="registerForm" accept="image/*" onsubmit="return Validate(this)"class="signup"
					action="javascript:validateRegister()"
					enctype="multipart/form-data">
					<!--         <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span> -->

					<h1
						style="text-align: center; color: #ffffff; font-weight: 300; margin: 0 0 40px;">Sign
						up</h1>




					<div class="field-wrap">
						<label> Name<span class="req">*</span>
						</label> <input type="text" name="name"
							pattern = "[a-zA-Z. ]+" title = "Only letters"
							onfocus="this.style.borderColor = '#1ab188'"
							onfocusout="this.style.borderColor = '#a0b3b0' "
							style="font-size: 22px; display: block; width: 100%; height: 45px; padding: 5px 10px; background: none; color: #ffffff; border-radius: 0; background-image: none; border: 1px solid #a0b3b0;"
							maxlength="30" required autocomplete="off" />
					</div>


					<div class="field-wrap">
						<label> Username<span class="req">*</span>
						</label> <input type="text" name="username"
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

						<input type="file" id="fileMaina" name="profilePicture"
							accept="image/*" onfocus="this.style.borderColor = '#1ab188'"
							onfocusout="this.style.borderColor = '#a0b3b0' "
							style="font-size: 22px; display: block; width: 100%; height: 45px; padding: 5px 10px; background: none; color: #ffffff; border-radius: 0; background-image: none; border: 1px solid #a0b3b0;"
							required autocomplete="off" />
					</div>

					<div id="message2"></div>
					<button class="button button-block" type="submit">Register</button>
					<br>
					<!--           <button class="button button-block" type="submit" onclick="window.location.href='/MyGag/register.html'"> Register</button> -->

				</form>

			</div>
		</div>
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

			<!-- Blog Post Content Column -->
			<div class="col-lg-8">

				<!-- Blog Post -->

				<c:set var="post"
					value="${PostsManager.getInstance().getPost(param.post_id)}"
					scope="page" />
				<!-- Title -->
				<h1>
					<c:out value="${post.title}"></c:out>
				</h1>

				<!-- Date/Time -->
				<p>
					<span class="glyphicon glyphicon-time"></span>
					<c:out value="${post.uploadDate}"></c:out>
				</p>

				<hr>

				<!-- Preview Image -->
				<img class="img-responsive"
					src="postPicture?post_id=<c:out value="${post.postId}"></c:out>"
					alt="" width="500">


				<hr>

				<a style="color: gray" href=""> <c:out
						value="${PostsManager.getInstance().getPointsOfPost(post.postId)}"></c:out>
					points
				</a> - <a style="color: gray" href=""> <c:out
						value="${CommentsManager.getInstance().getNumberOfCommentsOfPost(post.postId)}"></c:out>
					comments
				</a>

				<!-- Blog Comments -->
				<br> <br>
				<h4>
					<c:out
						value="${CommentsManager.getInstance().getNumberOfCommentsOfPost(post.postId)}"></c:out>
					comments
				</h4>
				<!-- Comments Form -->




				<!-- Posted Comments -->

				<c:forEach var="comment"
					items='${CommentsManager.getInstance().getCommentsOfPost(post.postId).values()}'>
					<c:set var="user"
						value="${UsersManager.getInstance().getUser(comment.username)}">
					</c:set>
					<!-- Comment -->
					<hr>
					<div class="media">
						<a class="pull-left" href="#"> <img class="media-object"
							src="profilePicture?username=<c:out value="${user.username}"></c:out>"
							alt="" width="54" height="54">
						</a>
						<div>


							<h4>
								<c:out value="${user.username}"></c:out>
								<small><c:out value="${comment.uploadDate}"></c:out></small>
							</h4>

							<c:out value="${comment.text}"></c:out>
						</div>
					</div>

				</c:forEach>
				<script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
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
		$('#message2').html("<font size = '3'color='#c62115'><b>Username already taken</b></font>");
	} else if (results == 'emailTaken'){
		$('#message2').html("<font size = '3'color='#c62115'><b>User with such email already exists</b></font>");
	} else{
		$('#message2').html("<font size = '3'color='#c62115'><b>Passwords don't match</b></font>")
	}
}

</script>


				<!-- Footer -->
				<footer>
				<div class="row">
					<div class="col-lg-12">
						<p>Copyright &copy; MyGAG</p>
					</div>
				</div>
				<!-- /.row --> </footer>






			</div>
			<!-- /.container -->

			<!-- jQuery -->
			<script src="js/jquery.js"></script>

			<!-- Bootstrap Core JavaScript -->
			<script src="js/bootstrap.min.js"></script>
</body>
<script src="http://malsup.github.com/jquery.form.js"></script>
</html>
