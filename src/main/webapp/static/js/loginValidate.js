function validateLogin(){
	var form = $('#loginForm');
	$.post("loginValidate", form.serialize()).then(showMessage);
}

function showMessage(results){
	if(results == 'success'){
		$('#message').html("<font color='green'>Login Successful</font>");
		setTimeout(function(){
			window.location.href = "index";
		}, 1000)
	}else{
		$('#message').html("<font color='red'>Login Failed Try Again</font>");
	}
}