function validateRegister(){
	var form = $('#registerForm');
	$.post("registerValidate", form.serialize()).then(showMessage);
}

function showMessage(results){
	if(results == 'success'){
		$('#message2').html("<font color='green'>You registerred successfully</font>");
		setTimeout(function(){
			window.location.href = "index";
		}, 1000)
	}else if (results == 'usernameTaken'){
		$('#message2').html("<font color='red'>Username already taken</font>");
	}else{
		$('#message2').html("<font color='red'>Psswords don't match</font>")
	}
}