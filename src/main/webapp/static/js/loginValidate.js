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
	}else if(results == 'invalidUsername'){
		$('#message').html("<font color='red'>Invalid username. Please try again! </font>");
	} else{
		$('#message').html("<font color='red'>Wrong password. Please try again! </font>");
	}
}