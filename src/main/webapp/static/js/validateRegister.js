function validateRegister(){
	var form = $('#registerForm');
	$.post("registerValidate", form.serialize()).then(showMesage);
}

function showMesage(results){
	if(results == 'success'){
		$('#message2').html("<font color='green'>You registerred successfully</font>");
		setTimeout(function(){
			window.location.href = "index";
		}, 1000)
	}else if (results == 'usernameTaken'){
		$('#message2').html("<font color='red'>Username already taken</font>");
	}else{
		$('#message2').html("<font color='red'>Passwords don't match</font>")
	}
}