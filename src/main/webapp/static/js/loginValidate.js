function validateLogin(){
	var form = $('#loginForm');
	$.post("loginValidate", form.serialize()).then(showMessage);
}

function showMessage(results){
	if(results == 'success'){
		$('#message').html("<font size = '3' color='#179b77'><b>Login Successful</b></font>");
		setTimeout(function(){
			window.location.href = "index";
		}, 1000)
	}else if(results == 'invalidUsername'){
		$('#message').html("<font size = '3'color='red'><b>Invalid username. Please try again! </b></font>");
	} else{
		$('#message').html("<font size = '3' color='#c62115'><b>Wrong password. Please try again!</b> </font>");
	}
}