var xhr = new XMLHttpRequest();
document.getElementById("body").onload = function() {
	checkLoggedInUser()
	loadServiceList()
	};
document.getElementById('login-Form').addEventListener('submit', login);

function logout(){
	clearCookie();
	location.reload();
	window.location.href = "http://127.0.0.1/servicegeneral/servicegeneral-ui/index.php";
}

function clearCookie() {
	document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "firstName=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
    document.cookie = "lastName=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "address=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "email=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "phoneNumber=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "type=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
}

function login(e){
	var x, y, passwordCheck=null, usernameCheck=null;

	// Get the value of the input field with id="numb"
	var username = document.getElementById('username').value;
	var password = document.getElementById('password').value;
	// If x is Not a Number or less than one or greater than 10
	if (username == "" || username.trim() == '') {
		usernameCheck = "Username should not be empty";
		document.getElementById("usernamemsg").innerHTML = usernameCheck;
		
	}else{
		usernameCheck = null
		document.getElementById("usernamemsg").innerHTML = "";
	
		if (password == ""|| username.trim() == '') {
		passwordCheck = "Password should not be empty";
		document.getElementById("passwordmsg").innerHTML = passwordCheck;
	
		}else{
			passwordCheck = null;
			document.getElementById("passwordmsg").innerHTML = "";
		}

	}

	
	
	e.preventDefault();
	if (usernameCheck == null && passwordCheck == null) {
	
		var provider = document.getElementById('provider');
		var customer = document.getElementById('customer');
		var type = null;
		if(document.getElementById('provider').checked == true){
			type="provider";
		} else {
			type="customer";
		}
	
		var data = 
		{
			"username" : username,
			"password":password,
			"type": type
		};
					
		var json = JSON.stringify(data);
		xhr.open("POST","http://127.0.0.1:9090/servicegeneral/api/user/login");
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.setRequestHeader('Access-Control-Allow-Origin','*');
		xhr.setRequestHeader('Access-Control-Allow-Methods','POST, GET');
		xhr.setRequestHeader('Access-Control-Allow-Headers','X-Auth-Token,Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With');
		xhr.send(json);
		
		xhr.onreadystatechange = function() {	

			if (this.readyState == 4 && this.status == 200 && this.responseText!="") {
				console.log("Response:"+this.responseText);

				var user = JSON.parse(this.responseText);
				var usernameCookie = "username="+user.username+";";
			    var firstNameCookie = "firstName="+user.firstName+";";
			    var lastNameCookie = "lastName="+user.lastName+";";
			    var addressCookie = "address="+user.address+";";
			    var emailCookie = "email="+user.email+";";
			    var phoneNumberCookie = "phoneNumber="+user.phoneNumber+";";
			    var typeCookie = "type="+user.type+";";
				var serviceTypeCookie = "serviceType="+user.serviceType+";";

				document.cookie = usernameCookie;
				document.cookie = firstNameCookie;
			    document.cookie = lastNameCookie;
				document.cookie = addressCookie;
				document.cookie = emailCookie;
				document.cookie = phoneNumberCookie;
				document.cookie = typeCookie;
				document.cookie = serviceTypeCookie;

				document.getElementById('message').innerHTML = "";
				location.reload();
				window.location.href = "http://127.0.0.1/servicegeneral/servicegeneral-ui/index.php";
			}
			else if (this.responseText == null || this.responseText == ""){
				document.getElementById('message').innerHTML = "Incorrect credentials. Please login again.";
				document.getElementById('username').value ="";
				document.getElementById('password').value = "";
			}
		};
		
	}
}


function feedback(e){
	e.preventDefault();

	var nameCheck = null,feebackCheck = null;
	
	var name = document.getElementById('name').value;
	var feedback = document.getElementById('feedback').value;
		
	if(name == "" || name == null || name.trim() == ''){
		nameCheck = "Name should not be empty";
	document.getElementById("feedback-nameMsg").innerHTML = nameCheck;

	}
	if(feedback == "" || feedback == null || feedback.trim() == ''){
		feebackCheck = "feedback should not be empty";
	document.getElementById("feedback-feedbackMsg").innerHTML = feebackCheck;
	}else{
		document.getElementById("feedback-feedbackMsg").innerHTML = "";
	}
	if(nameCheck == null && feebackCheck == null){
		var data = 
		{
			"name" : name,
			"message" : feedback
		};

					
		xhr.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				console.log(this.responseText);
				document.getElementById('message').innerHTML = this.responseText;
				document.getElementById("feedback-message").innerHTML = "Your feedback is valuable. Thanks for your time.";

				document.getElementById('feedback').value = "";
			}
		};
		var json = JSON.stringify(data);
		
		console.log("Inside register 2")
		xhr.open("POST","http://127.0.0.1:9090/servicegeneral/api/user/feedback");
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.setRequestHeader('Access-Control-Allow-Origin','*');
		xhr.setRequestHeader('Access-Control-Allow-Methods','POST, GET');
		xhr.setRequestHeader('Access-Control-Allow-Headers','X-Auth-Token,Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With');
		console.log("Inside register 3")
		xhr.send(json);
	}
}


function updateProfile(e) {
	e.preventDefault();
	var firstnameCheck = null, lastnameCheck = null, emailCheck = null, addressCheck = null,phonenumberCheck = null;

	var firstName = document.getElementById("profile-firstName").value;
	var lastName =document.getElementById("profile-lastName").value;
	var email = document.getElementById("profile-email").value;
	var address = document.getElementById("profile-address").value;
	var phoneNumber  = document.getElementById("profile-phoneNumber").value;
	var username = document.getElementById("profile-username").value;
	var password = document.getElementById("profile-password").value;
	var serviceType = document.getElementById("profile-service").value;

var numbers = /[0-9]/g;
	var specialcharacters = /\W|_/g;
 	firstnameCheck = "&nbsp;First name cannot be empty or contain numbers, spaces or special characters";
 	if (firstName == "" || firstName == null || firstName.trim() == '') {
		document.getElementById("profile-firstNameMsg").innerHTML = firstnameCheck;		
	}
	else if(firstName.match(specialcharacters)) {
	  	
		document.getElementById("profile-firstNameMsg").innerHTML = firstnameCheck;
	  } 
	else if(firstName.match(numbers)) {
		document.getElementById("profile-firstNameMsg").innerHTML = firstnameCheck;
	  }
	else {
		firstnameCheck = null;
		document.getElementById("profile-firstNameMsg").innerHTML = "";

				 lastnameCheck = "&nbsp;Last name cannot be empty or contain numbers, spaces or special characters";

	if (lastName == "" || lastName == null || lastName.trim() == '') {
		document.getElementById("profile-lastNameMsg").innerHTML = lastnameCheck;		
	}
	else if(lastName.match(specialcharacters)) {
	  	
		document.getElementById("profile-lastNameMsg").innerHTML = lastnameCheck;
	  } 
	else if(lastName.match(numbers)) {
		document.getElementById("profile-lastNameMsg").innerHTML = lastnameCheck;
	  }
	else {
		lastnameCheck = null;
		document.getElementById("profile-lastNameMsg").innerHTML = "";

				var emailRegex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
				emailCheck = "Email should be in proper format or not be empty";

				if (email == "" || email == null || email.trim() == '') {
					
					document.getElementById("profile-emailMsg").innerHTML = emailCheck;
				
				}else if(!email.match(emailRegex)) {
					
					document.getElementById("profile-emailMsg").innerHTML = emailCheck;
				  }
				else{
					emailCheck = null;
					document.getElementById("profile-emailMsg").innerHTML = "";

							if (address == "" || address == null || address.trim() == '') {
							addressCheck = "&nbsp;Address should not be empty";
							document.getElementById("profile-addressMsg").innerHTML = addressCheck;
						
						}else{
							addressCheck = null;
							document.getElementById("profile-addressMsg").innerHTML = "";
						
								var alphabets = /[a-zA-Z]/g;
								phonenumberCheck = "&nbsp;Phone Number cannot be empty or contain alphabets, spaces or special characters";

								if (phoneNumber == "" || phoneNumber == null || phoneNumber.trim() == '') {
									
									document.getElementById("profile-phoneNumberMsg").innerHTML = phonenumberCheck;
								
								}
								else if(phoneNumber.match(specialcharacters)) {
								  	
									document.getElementById("profile-phoneNumberMsg").innerHTML = phonenumberCheck;
								  } 
								else if(phoneNumber.match(alphabets)) {
									document.getElementById("profile-phoneNumberMsg").innerHTML = phonenumberCheck;
								  }
								else{
									phonenumberCheck = null;
									document.getElementById("profile-phoneNumberMsg").innerHTML = "";
								}
						
						}
				}

	 }
	 }








	if( firstnameCheck == null && lastnameCheck == null && 
		emailCheck == null && addressCheck == null 
		&& phonenumberCheck == null){


		var data = 
			{
				"firstName" : firstName,
				"lastName" : lastName,
				"address" : address,
				"email" : email,
				"phoneNumber":phoneNumber,
				"username" : username,
				"password": password,
				"serviceType": serviceType
			};

				
		xhr.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				document.getElementById('profile-update-message').innerHTML = this.responseText;
			}
		};

		var json = JSON.stringify(data);
		
		xhr.open("POST","http://127.0.0.1:9090/servicegeneral/api/user/update");
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.setRequestHeader('Access-Control-Allow-Origin','*');
		xhr.setRequestHeader('Access-Control-Allow-Methods','POST, GET');
		xhr.setRequestHeader('Access-Control-Allow-Headers','X-Auth-Token,Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With');
		
		xhr.send(json);
	}
}




function register(e) {
	e.preventDefault();
		
	var firstnameCheck = null, lastnameCheck = null, emailCheck = null, addressCheck = null,phonenumberCheck = null, usernameCheck = null,passwordCheck = null;
	

	var firstName = document.getElementById('firstName').value;
	var lastName = document.getElementById('lastName').value;
	var email = document.getElementById('email').value;
	var address = document.getElementById('address').value;
	var phoneNumber = document.getElementById('phoneNumber').value;
	var username = document.getElementById('inputUsername').value;
	var password = document.getElementById('inputPassword').value;
	


	var numbers = /[0-9]/g;
	var specialcharacters = /\W|_/g;
 	firstnameCheck = "First name cannot be empty or contain numbers, spaces or special characters";
 	if (firstName == "" || firstName == null || firstName.trim() == '') {
		document.getElementById("register-firstnameMsg").innerHTML = firstnameCheck;		
	}
	else if(firstName.match(specialcharacters)) {
		document.getElementById("register-firstnameMsg").innerHTML = firstnameCheck;
	} 
	else if(firstName.match(numbers)) {
		document.getElementById("register-firstnameMsg").innerHTML = firstnameCheck;
	  }
	else {
		firstnameCheck = null;
		document.getElementById("register-firstnameMsg").innerHTML = "";
		
	lastnameCheck = "Last name cannot be empty or contain numbers, spaces or special characters";

	if (lastName == "" || lastName == null || lastName.trim() == '') {
		document.getElementById("register-lastnameMsg").innerHTML = lastnameCheck;		
	}
	else if(lastName.match(specialcharacters)) {
	  	
		document.getElementById("register-lastnameMsg").innerHTML = lastnameCheck;
	  } 
	else if(lastName.match(numbers)) {
		document.getElementById("register-lastnameMsg").innerHTML = lastnameCheck;
	  }
	else {
		lastnameCheck = null;
		document.getElementById("register-lastnameMsg").innerHTML = "";

		var emailRegex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	
		emailCheck = " email should be in proper format or not be empty";
		if (email == "" || email == null || email.trim() == '') {
			
			document.getElementById("register-emailMsg").innerHTML = emailCheck;
		
		}
		else if(!email.match(emailRegex)) {
			
			document.getElementById("register-emailMsg").innerHTML = emailCheck;
		  }
		else{
			emailCheck = null;
			document.getElementById("register-emailMsg").innerHTML = "";

				if (address == "" || address == null || address.trim() == '') {
			addressCheck = " address should not be empty";
			document.getElementById("register-addressMsg").innerHTML = addressCheck;
		
		}else{
			addressCheck = null;
			document.getElementById("register-addressMsg").innerHTML = "";
			
			var alphabets = /[a-zA-Z]/g;
			phonenumberCheck = "Phone Number cannot be empty or contain alphabets, spaces or special characters";

			if (phoneNumber == "" || phoneNumber == null || phoneNumber.trim() == '') {
				
				document.getElementById("register-phonenumberMsg").innerHTML = phonenumberCheck;
			
			}
			else if(phoneNumber.match(specialcharacters)) {
			  	
				document.getElementById("register-phonenumberMsg").innerHTML = phonenumberCheck;
			  } 
			else if(phoneNumber.match(alphabets)) {
				document.getElementById("register-phonenumberMsg").innerHTML = phonenumberCheck;
			  }
			else{
				phonenumberCheck = null;
				document.getElementById("register-phonenumberMsg").innerHTML = "";

				if (username == "" || username == null || username.trim() == '') {
					usernameCheck = " username should not be empty";
					document.getElementById("register-usernameMsg").innerHTML = usernameCheck;
				
				} else {
					usernameCheck = null;
					document.getElementById("register-usernameMsg").innerHTML = "";

						if (password == "" || password == null || password.trim() == '') {
						passwordCheck = " password should not be empty";
						document.getElementById("register-passwordMsg").innerHTML = passwordCheck;
					
						}else{
							passwordCheck = null;
							document.getElementById("register-passwordMsg").innerHTML = "";
						}
					}
				}
			}
		}
	}
}



	if( firstnameCheck == null && lastnameCheck == null && 
		emailCheck == null && addressCheck == null 
		&& phonenumberCheck == null && usernameCheck == null && passwordCheck == null){
		var provider = document.getElementById('inputProvider');
		var customer = document.getElementById('inputCustomer');
		

		var type = null; 
		var serviceType = null;
		if(document.getElementById('inputProvider').checked == true){
			type="provider";
			serviceType = document.getElementById('input-service-type').selectedOptions[0].value;
			console.log("service:" + serviceType);
		} else {
			type="customer";
		}
		console.log(username);
		var data = 
				{
					"firstName" : firstName,
					"lastName" : lastName,
					"address" : address,
					"email" : email,
					"phoneNumber":phoneNumber,
					"username" : username,
					"password":password,
					"type": type,
					"serviceType": serviceType
				};

		xhr.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				console.log(this.responseText);
				document.getElementById('register-message').innerHTML = this.responseText;

					if(!this.responseText.includes("Oops")){
						document.getElementById("firstName").disabled = true;
						document.getElementById("lastName").disabled = true;
						document.getElementById("email").disabled = true;
						document.getElementById("address").disabled = true;
						document.getElementById("phoneNumber").disabled = true;
						document.getElementById("inputUsername").disabled = true;
						document.getElementById("inputPassword").disabled = true;
						document.getElementById("input-service-type").disabled= true;
						document.getElementById("inputCustomer").disabled= true;
						document.getElementById("inputProvider").disabled= true;
						document.getElementById("submit").disabled= true;
						
					}
				}
			}
		
		
		var json = JSON.stringify(data);
		console.log("body"+ data);
		xhr.open("POST","http://127.0.0.1:9090/servicegeneral/api/user");
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.setRequestHeader('Access-Control-Allow-Origin','*');
		xhr.setRequestHeader('Access-Control-Allow-Methods','POST, GET');
		xhr.setRequestHeader('Access-Control-Allow-Headers','X-Auth-Token,Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With');		
		xhr.send(json);
	}
}


function userJsonIndexPage() {
	var cookie = document.cookie;
	console.log("ON LOAD:" + cookie);

	var userCookie = {};
	cookie.split(/\s*;\s*/).forEach(function(pair) {
	  pair = pair.split(/\s*=\s*/);
	  userCookie[pair[0]] = pair.splice(1).join('=');
	});

	var userJson = JSON.parse(JSON.stringify(userCookie, null, 4));
	return userJson;
}





function loadServiceList(){

			var servicesList = [];
			var xhr = new XMLHttpRequest();
			xhr.open("GET","http://127.0.0.1:9090/servicegeneral/api/services/metadata");
			xhr.send();
			xhr.onreadystatechange = function() {	

			if (this.readyState == 4 && this.status == 200 && this.responseText!="") {
				console.log("Response:"+this.responseText);
				servicesList = JSON.parse(this.responseText);
			}
			var count = 0;
	
		    for (var i = 0; i < servicesList.length/3; i++) {
		    	var rowElement = document.createElement("div");
				rowElement.className = "row";
			    rowElement.id = "serviceRow"+i;		

				$("#service-metadata").append(rowElement);
				
			    for (var j = 0; j<3; j++) {

			        var columnElement = document.createElement("div");
			        columnElement.className = "col-sm-4";
					
					var boxElement = document.createElement("div");
			        boxElement.className = "box-style-1 white-bg object-visible";
			        boxElement.style = "height:360px;";

			        var imgElement = document.createElement("div");
			        imgElement.style = "height:65%";
			        var imgTag = document.createElement("img");
			        imgTag.src = servicesList[count].serviceImgURL;
			        imgTag.style = "width:100%;height:100%";
			        imgElement.append(imgTag);

			        var titleTag = document.createElement("h2");
			        titleTag.innerHTML = servicesList[count].serviceTitle;

			        var titleElement = document.createElement("div");
			        titleElement.style = "height:20%;";
			        titleElement.append(titleTag);

			        var aTag = document.createElement("a");
			        aTag.href = "#";
			        aTag.className = "btn-default btn";
			        aTag.innerHTML = "Read More";

			        boxElement.append(imgElement);
			        boxElement.append(titleElement);
			        boxElement.append(aTag);
			        boxElement.setAttribute('data-animation-effect','fadeInUpSmall');
			        boxElement.setAttribute('data-effect-delay','0');

			        columnElement.append(boxElement);
			        $("#serviceRow"+i).append(columnElement);
			    	count++;
			    }    
			    
			}
		}
		}