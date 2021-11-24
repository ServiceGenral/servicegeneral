var xhr = new XMLHttpRequest();

document.getElementById('login-Form').addEventListener('submit', login);

function logout(){
	xhr.open("POST","http://127.0.0.1:9090/servicegeneral/api/user/logout/"+getCookie().username);
	xhr.send();
	xhr.onreadystatechange = function() {	
		if (this.readyState == 4 && this.status == 200 && this.responseText!="") {
			console.log("Response:"+this.responseText);
			clearCookie();
			alert("Logged Out");
			location.reload();
			window.location.href = "http://127.0.0.1/servicegeneral/servicegeneral-ui/index.php";
		}
	}
}

function clearCookie() {
	document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "firstName=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
    document.cookie = "lastName=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "address=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "email=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "phoneNumber=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "type=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "ACCEPT=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "PENDING=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "DECLINE=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "serviceType=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "serviceName=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "providers=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "feedback=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
}

function profileClearCookie() {
	document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "firstName=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
    document.cookie = "lastName=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "address=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "email=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "phoneNumber=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
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

		var messageElement = document.getElementById('profile-update-message');
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
		
		var json = JSON.stringify(data);
		
		xhr.open("POST","http://127.0.0.1:9090/servicegeneral/api/user/update");
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.setRequestHeader('Access-Control-Allow-Origin','*');
		xhr.setRequestHeader('Access-Control-Allow-Methods','POST, GET');
		xhr.setRequestHeader('Access-Control-Allow-Headers','X-Auth-Token,Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With');		
		xhr.send(json);

		xhr.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				console.log(this.responseText);

				profileClearCookie();
				
				var usernameCookie = "username="+username+";";
			    var firstNameCookie = "firstName="+firstName+";";
			    var lastNameCookie = "lastName="+lastName+";";
			    var addressCookie = "address="+address+";";
			    var emailCookie = "email="+email+";";
			    var phoneNumberCookie = "phoneNumber="+phoneNumber+";";
			   
				document.cookie = usernameCookie;
				document.cookie = firstNameCookie;
			    document.cookie = lastNameCookie;
				document.cookie = addressCookie;
				document.cookie = emailCookie;
				document.cookie = phoneNumberCookie;

				alert(this.responseText);
				location.reload();				

			}
		};			
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

			        var aTag = document.createElement("button");
			        /*aTag.href = "#";*/
			        aTag.className = "btn-default btn";
			        aTag.innerHTML = "Read More";
			        aTag.setAttribute("onClick","loadListServiceProviders('" + servicesList[count].serviceName + "')")

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

function loadAdvertisement(){
	var advertisementList = [];
	var xhr = new XMLHttpRequest();
	xhr.open("GET","http://localhost:9090/servicegeneral/api/advertisment");
	xhr.send();
	xhr.onreadystatechange = function() {	
		if (this.readyState == 4 && this.status == 200 && this.responseText!="") {
				console.log("Response:"+this.responseText);
				advertisementList = JSON.parse(this.responseText);
			}
		 var count = 0;
		 for (var i = 0; i < advertisementList.length/3; i++) {
		    	var rowElement = document.createElement("div");
				rowElement.className = "row";
			    rowElement.id = "advRow"+i;		

				$("#advertisement-metadata").append(rowElement);
				
			    for (var j = 0; j<3; j++) {

			        var columnElement = document.createElement("div");
			        columnElement.className = "col-sm-4";
					
					var boxElement = document.createElement("div");
			        boxElement.className = "box-style-1 white-bg object-visible";
			        boxElement.style = "height:360px;box-shadow: 0px 0px 18px #0606068a;padding-top:35px;background: #000000c2!important;";

			        var offerElement = document.createElement("h1");
			        offerElement.style="color: #e84c3d;"
			        var titleElement = document.createElement("h2");
			        titleElement.style="color: white;";
			        var serviceElement = document.createElement("h3");
			        serviceElement.style="color: wheat;"
			        var userElement = document.createElement("h3");
			        userElement.style="color: antiquewhite;"
			        var dateElement = document.createElement("h3");
			        dateElement.style="color: aquamarine;"


			        offerElement.innerHTML = advertisementList[count].offer;
			        titleElement.innerHTML = " for " +advertisementList[count].title + " on ";
			        serviceElement.innerHTML = retreiveServiceNameFromId(advertisementList[count].serviceName) + " by ";
			        userElement.innerHTML = advertisementList[count].username + " from ";
			        dateElement.innerHTML = advertisementList[count].startDate + " to " + advertisementList[count].endDate;
			        

			        boxElement.append(offerElement);
			        boxElement.append(titleElement);
			        boxElement.append(serviceElement);
			        boxElement.append(userElement);
			        boxElement.append(dateElement);

			        boxElement.setAttribute('data-animation-effect','fadeInUpSmall');
			        boxElement.setAttribute('data-effect-delay','0');

			        columnElement.append(boxElement);
			        $("#advRow"+i).append(columnElement);
			    	count++;
			    }    
			    
			}

	}


}

function loadListServiceProviders(serviceName){
			
			var xhr = new XMLHttpRequest();
			xhr.open("GET","http://localhost:9090/servicegeneral/api/services/providers/"+ serviceName);
			xhr.send();
			xhr.onreadystatechange = function() {	
			if (this.readyState == 4 && this.status == 200 && this.responseText!="") {
				
				console.log("Response:"+ this.responseText);

				var providerCookie = "providers=" +this.responseText;
				var serviceNameCookie = "serviceName=" +serviceName;
				
				document.cookie = providerCookie;
				document.cookie = serviceNameCookie;
				window.location.href = "http://127.0.0.1/servicegeneral/servicegeneral-ui/provider.php";
				
			}
		}
}

function saveFeedbackToCookie(){
	console.log("saving feedback to cookie");
	document.cookie = "feedback=; expires=Thu, 01 Jan 1970 00:00:00 UTC";

	var xhr = new XMLHttpRequest();
	xhr.open("GET","http://127.0.0.1:9090/servicegeneral/api/user/feedback/"+ getCookie().username);
	xhr.send();
	xhr.onreadystatechange = function() {	
		if (this.readyState == 4 && this.status == 200 && this.responseText!="") {
			console.log(" SAVING Feedback TO cookies :" + this.responseText);
			var feedbackCookie = "feedback=" +this.responseText;
			document.cookie = feedbackCookie;
		}	
	}
}

function saveRequestsToCookie(status, username, userType){
	var xhr = new XMLHttpRequest();
	xhr.open("GET","http://127.0.0.1:9090/servicegeneral/api/service/request/appointments/"+status+"/"+username+"/"+userType);
	xhr.send();
	xhr.onreadystatechange = function() {	
		if (this.readyState == 4 && this.status == 200 && this.responseText!="") {
			console.log(" SAVING REQUEST TO COOKIES for "+ status + ":" + this.responseText);

			var requestsCookie = status +"=" +this.responseText;
			document.cookie = requestsCookie;
		}	
	}
}

function loadProviders(){

	var providers = [];
	var serviceName;
	var userJson = getCookie();

	providers = JSON.parse(userJson.providers);
	var customerId =  userJson.username;
	serviceName = userJson.serviceName;


	console.log("list of providers" +providers.length);
	
	if(providers.length == 0){
		var noProvider = document.createElement("h2");
		noProvider.innerHTML = "Providers not found";
		$("#providerRow").append(noProvider);
	}
	else{
		document.getElementById("service-provider-title").innerHTML = retreiveServiceNameFromId(serviceName);
		document.getElementById("service-provider-title").style = "margin-left: -15px;display:block;";
		document.getElementById("date-value").style = "margin-left: -15px;display:block;";

	for (var j = 0; j < providers.length; j++) {
		var providerDiv = document.createElement("div");
		var providerName = document.createElement("h2");
		var providerAddress = document.createElement("h5");

		providerName.style = "color:deepskyblue;font-weight:bold;fontSize:15px;"
		providerAddress.style = "color:#045d7a;fontSize:10px;"

		var checkBtn = document.createElement("button");
		var requestBtn = document.createElement("button");
		providerName.innerHTML = providers[j].firstName + " " + providers[j].lastName
		providerAddress.innerHTML = "Location: " + providers[j].address;

		var bookRequestId = "bookRequestId" + j;
		checkBtn.innerHTML = "Check Availability";
		checkBtn.style = "margin-left:0px;background-color:green;color:white;height:50px;width:200px;border:none";
		checkBtn.setAttribute("onClick","checkAvailabilityOfProviders('" + providers[j].username + "','" + serviceName + "','" + bookRequestId + "')")
		

		requestBtn.innerHTML = "Book Service";
		requestBtn.style = "margin-left:20px;background-color:lightblue;color:white;height:50px;width:200px;border:none";
		requestBtn.disabled = true;
		requestBtn.setAttribute("onClick","bookServiceProvider('"+ customerId + "','" + providers[j].username + "','" + serviceName + "')");
		requestBtn.setAttribute("id", bookRequestId);



		providerDiv.append(providerName);
		providerDiv.append(providerAddress);
		providerDiv.append(checkBtn);
		providerDiv.append(requestBtn);
		
		var ratingLabel = document.createElement("label");
		ratingLabel.id = "ratingLabel"+providers[j].username;
		ratingLabel.style = "margin: 20px;color: #e84c3d;";
		getProviderRating(providers[j].username);
		providerDiv.append(ratingLabel);
		

		providerDiv.append(document.createElement("hr"));
		providerDiv.className = "row";
		providerDiv.style = "border-bottom: 1px solid gray;";
		$("#providerRow").append(providerDiv);
	}
	}
}

function getProviderRating(providerId){
	var xhr = new XMLHttpRequest();
	xhr.open("GET","http://127.0.0.1:9090/servicegeneral/api/service/request/rating/"+providerId);
	xhr.send();
	xhr.onreadystatechange = function() {	
		if (this.readyState == 4 && this.status == 200 && this.responseText!="") {
			console.log(" Rating for "+ providerId + ":" + this.responseText);
			if(this.responseText == 0.0){
				document.getElementById("ratingLabel"+providerId).innerHTML = "Not yet rated";
			} else {
				document.getElementById("ratingLabel"+providerId).style = "margin: 20px;color: #1b6a91;"
				document.getElementById("ratingLabel"+providerId).innerHTML = "Ratings: " + this.responseText;
			}
			return this.responseText;
		}
	}
}

const sleep = (ms) => new Promise(resolve => setTimeout(resolve, ms))

const saveAndLoad = async() => {
	   await saveRequestsToCookie('PENDING', getCookie().username, getCookie().type);
	   await saveRequestsToCookie('ACCEPT', getCookie().username, getCookie().type);
	   await saveRequestsToCookie('DECLINE', getCookie().username, getCookie().type);

	   //await demo()
	   await sleep(1000);

	   await loadRequest('PENDING', 'requestsPENDING');
	   await loadRequest('ACCEPT', 'requestsACCEPT');
	   await loadRequest('DECLINE', 'requestsDECLINE');
}

const saveAndLoadFeedback = async() => {
	await saveFeedbackToCookie();
	await sleep(1000);
	await loadFeedback();
}

function checkAvailabilityOfProviders(providerId, serviceId, bookRequestId){
	var date = document.getElementById("date-value").value
	console.log(date +"," + providerId + ", " + serviceId)

	var xhr = new XMLHttpRequest();
		xhr.open("GET","http://127.0.0.1:9090/servicegeneral/api/service/request/"+providerId+"/"+serviceId+"/"+date);
		xhr.send();
		xhr.onreadystatechange = function() {	
		var requestBtn = document.getElementById(bookRequestId);
		if (this.readyState == 4 && this.status == 200 && this.responseText!="") {
			console.log("Response:"+this.responseText);
			if(this.responseText == "true"){
				alert("Provider is available");
			}
			else{
				alert("Provider is not available");
			}

			if(getCookie().username !=null && this.responseText == "true") {
				requestBtn.removeAttribute("disabled");
				requestBtn.style = "margin-left:20px;background-color:blue;color:white;height:50px;width:200px;border:none";
			}
			else{
				requestBtn.disabled = true;
				requestBtn.style = "margin-left:20px;background-color:lightblue;color:white;height:50px;width:200px;border:none";
			}
			
		}

	}
}

function bookServiceProvider(customerId, providerId, serviceId){
	var date = document.getElementById("date-value").value;
	var xhr = new XMLHttpRequest();
			xhr.open("POST","http://127.0.0.1:9090/servicegeneral/api/service/request/"+customerId+"/"+providerId+"/"+serviceId+"/"+date);
			xhr.send();
			xhr.onreadystatechange = function() {	
			if (this.readyState == 4 && this.status == 200 && this.responseText!="") {
				console.log("Response:"+this.responseText);
				alert(this.responseText);
			}
		}
}

function loadRequest(status, requestId){
	var requests = [];
	var requestCookie = getCookie();
	
	if(status == "PENDING" || status == "pending") {
		requests = JSON.parse(requestCookie.PENDING);
	} else if (status == "ACCEPT" || status == "accept"){
			requests = JSON.parse(requestCookie.ACCEPT);
	} else {
			requests = JSON.parse(requestCookie.DECLINE);
	}
	
	console.log(requests.length + "is the length of the requests");

	for (var j = 0; j < requests.length; j++) {
				var requestName = document.createElement("div");
				requestName.style = "color:deepskyblue;font-weight:bold;font-size:20px;"
				
				var reqStatus = null;				
				var reqsDate = new Date(requests[j].date);
				reqsDate.setDate(reqsDate.getDate() + 1);

				if( reqsDate < new Date()
					&& 
					(requests[j].status == "ACCEPT") ){
				
					reqStatus = "SERVED";
				} else {
					reqStatus = requests[j].status;
				}


				var requestLabel =  document.createElement("label");
				requestLabel.innerHTML = ((requests[j].providerId).toUpperCase()) +
				 " To Provide " + 
				retreiveServiceNameFromId(requests[j].serviceName) + 
				" Service To "+ 
				(requests[j].customerId).toUpperCase() + 
				" On " + requests[j].date;
				requestLabel.style = "color:deepskyblue;font-weight:bold;font-size:20px;";

				var requestStatusLabel = document.createElement("label");
				

				if(reqStatus == "ACCEPT"){
					reqStatus = "APPOINTMENT CONFIRMED";
					requestStatusLabel.style = "color:#48c548;font-weight:bold;font-size:20px;";
				} else if(reqStatus == "SERVED"){
					requestStatusLabel.style = "color:black;font-weight:bold;font-size:20px;";
				} else if(reqStatus == "PENDING"){
					reqStatus = "PENDING FOR ACCEPTANCE";
					requestStatusLabel.style = "color:orange;font-weight:bold;font-size:20px;";
				}	else if(reqStatus == "DECLINE"){
 					reqStatus = "REQUEST DECLINED";
					requestStatusLabel.style = "color:red;font-weight:bold;font-size:20px;";
				}
				requestStatusLabel.innerHTML = " | Status: " + reqStatus;
				requestName.append(requestLabel);
				requestName.append(requestStatusLabel);
				
				
				var hr = document.createElement("hr");
				hr.style="border-top: 1px solid #a91515;"
				$("#"+requestId).append(requestName);

				if(requestCookie.type == "provider"){
					var acceptBtn = document.createElement("button");
					acceptBtn.innerHTML = "Accept";
					acceptBtn.style = "margin-left:20px;background-color:#0080008c;color:white;height:50px;width:200px;border:none";
					acceptBtn.setAttribute("onClick", "takeActionOnRequest('"+requests[j].serviceRequestId +"','ACCEPT')");
					var rejectBtn = document.createElement("button");
					rejectBtn.innerHTML = "Decline";
					rejectBtn.style = "margin-left:20px;background-color:#ff000069;color:white;height:50px;width:200px;border:none";
					rejectBtn.setAttribute("onClick", "takeActionOnRequest('"+requests[j].serviceRequestId +"','DECLINE')");
					if(requestId == 'requestsPENDING'){
						$("#"+requestId).append(acceptBtn);
						$("#"+requestId).append(rejectBtn);
					}
				} else if (requestCookie.type == "customer" && requests[j].status == "ACCEPT") {

					if(isCurrentOrPastDate(new Date(), new Date(requests[j].date))) {
						if(requests[j].rating!=null){
							var rateLabel = document.createElement("label");
							rateLabel.innerHTML = "You have rated this service request. Rating submitted: "+requests[j].rating;
							$("#"+requestId).append(rateLabel);
							$("#"+requestId).append(rateLabel);
						} 
						else {
						console.log("Date: "+requests[j].date + " is current or past");
						
						var rateLabel = document.createElement("label");
						rateLabel.innerHTML = "Rate this service ";

						var rateBtn = createRatingButton(requests[j].serviceRequestId);
						
						var rateSubmitBtn  = document.createElement("button");
						rateSubmitBtn.innerHTML = "Rate";
						rateSubmitBtn.style = "margin-left:20px;background-color:#0080008c;color:white;height:50px;width:100px;border:none";
						rateSubmitBtn.setAttribute("onClick",  "submitRating("+requests[j].serviceRequestId+")");
						
						if(reqStatus == "SERVED"){
							$("#"+requestId).append(rateLabel);
							$("#"+requestId).append(rateBtn);
							$("#"+requestId).append(rateSubmitBtn);
						}
						
						
					}

					} else {
						var rateLabel = document.createElement("label");
						rateLabel.innerHTML = "Upcoming service. You will be able to rate this service after the request is completed";
						$("#"+requestId).append(rateLabel);
					}

				}
				$("#"+requestId).append(hr);
	}
}

function takeActionOnRequest(reqId, action){
	var xhr = new XMLHttpRequest();
	xhr.open("POST","http://127.0.0.1:9090/servicegeneral/api/service/request/"+reqId+"/"+action);
	xhr.send();
	xhr.onreadystatechange = function() {	
		if (this.readyState == 4 && this.status == 200 && this.responseText!="") {
			console.log("Response:"+this.responseText);
			document.cookie = "pending=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
			document.cookie = "accept=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
			document.cookie = "decline=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
			
			saveAndLoad();
			window.location.href = "http://127.0.0.1/servicegeneral/servicegeneral-ui/requests.php";
		}
	}
}

function getRatingValue(ratingSelectId){
	return document.getElementById(ratingSelectId).value;
}

function isCurrentOrPastDate(currDate, pastDate) {
	return currDate >= pastDate;
}


function createRatingButton(ratingSelectId){
	var ratings = ["1","2","3","4","5"];

	var ratingSelect = document.createElement("select");
	ratingSelect.id = "rating"+ratingSelectId;
	ratingSelect.style.margin = "20px";

	for (var i = 0; i < ratings.length; i++) {
	    var option = document.createElement("option");
	    option.value = ratings[i];
	    option.text = ratings[i];
	    ratingSelect.appendChild(option);
	}
	return ratingSelect;
}

const submitFeedback = async(e) => {
	await feedback(e);
	await sleep(1000);
	await saveFeedbackToCookie();
	await sleep(1000);
	await loadFeedback();
	await sleep(1000);
}



function loadFeedback(){
	 console.log("updating page from feedback cookie");
	var feedbackCookie = getCookie().feedback;
	if(feedbackCookie != null){
		var feedback = JSON.parse(getCookie().feedback);
		document.getElementById("feedback").innerHTML = feedback.message;
		document.getElementById("feedback").disabled = true;
		document.getElementById("submit").disabled = true;
	}
}

function feedback(e){
	e.preventDefault();
	console.log("saving feedback to database");
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
	if(nameCheck == null && feebackCheck == null) {
		
		var data = 
		{
			"name" : name,
			"message" : feedback
		};					
		
		var json = JSON.stringify(data);
		
		xhr.open("POST","http://127.0.0.1:9090/servicegeneral/api/user/feedback");
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.send(json);
		xhr.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				console.log("Resonse from database "+this.responseText);
				document.getElementById("feedback-message").innerHTML = "Your feedback is valuable. Thanks for your time.";
			}
		};
	}
}

function deleteUserFeedback(){
	var xhr = new XMLHttpRequest();
	xhr.open("POST","http://127.0.0.1:9090/servicegeneral/api/user/delete/feedback/"+getCookie().username);
	xhr.send();
	xhr.onreadystatechange = function() {	
		if (this.readyState == 4 && this.status == 200 && this.responseText!="") {
			console.log("Response:"+this.responseText);
		}
  	}
  	sleep(1000);
  	document.cookie = "feedback=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
}

function submitRating(ratingSelectId){
	var ratingValue = document.getElementById("rating"+ratingSelectId).value;
	var xhr = new XMLHttpRequest();
	xhr.open("POST","http://127.0.0.1:9090/servicegeneral/api/service/request/rating/"+ratingSelectId+"/"+ratingValue);
	xhr.send();
	xhr.onreadystatechange = function() {	
		if (this.readyState == 4 && this.status == 200 && this.responseText!="") {
			console.log(this.responseText);
			alert("Thanks for submitting the rating");
			window.location.reload();
		}
	}
}


const searchProviders = async() => {
	await saveProvidersToCookie();
	await sleep(2000);
	await loadProviderData();
}

function saveProvidersToCookie(){
	console.log("inside method search");
	
	var serviceType = document.getElementById('input-service-type-name').selectedOptions[0].value;
	var zipcode = document.getElementById('zipcode').value;
	
	
	if(zipcode==''){
		zipcode='empty';
	}
	console.log("type "+ serviceType);
	console.log("zipcode "+ zipcode);

	var xhr = new XMLHttpRequest();
	xhr.open("GET","http://127.0.0.1:9090/servicegeneral/api/user/searchfilter/"+serviceType+"/"+zipcode);
	xhr.send();
	xhr.onreadystatechange = function() {	
		if (this.readyState == 4 && this.status == 200 && this.responseText!="") {
			var providerCookie = "providers=" +this.responseText;
			var serviceNameCookie;
			
			console.log(this.responseText);

			document.cookie = providerCookie;

			if(serviceType != "empty"){
				serviceNameCookie = "serviceName=" +serviceType;
			}
			else {
				serviceNameCookie = "serviceName=List of providers";
			}
			document.cookie = serviceNameCookie;
		}
	}
			
}

function advertisementSubmit(e){
	e.preventDefault();
	var advTitle = document.getElementById('adv-title').value;
	var advOffer = document.getElementById('adv-offer').value;
	var advStartDt = document.getElementById('adv-startdate').value;
	var advEndDt = document.getElementById('adv-enddate').value;
	let today = new Date().toISOString().slice(0, 10);
	console.log(today);
	console.log(" startDate :" + advStartDt);

	if (advTitle == "" || advTitle == null || advTitle.trim() == '') {
		document.getElementById("adv-title-lbl").innerHTML = "Title Cannot be empty";		
	}
	else{
		if (advTitle.length > 30 ) {
		document.getElementById("adv-title-lbl").innerHTML = "Length should be less than 30 Character";		
		}
		else{
		document.getElementById("adv-title-lbl").innerHTML = "";
		if (advOffer == "" || advOffer == null || advOffer.trim() == '') {
			document.getElementById("adv-offer-lbl").innerHTML = "Offer Cannot be empty";		
		}
		else{
			if (advOffer.length > 30) {
			document.getElementById("adv-offer-lbl").innerHTML = "Length should be less than 30 Character";		
			}
			else{
			document.getElementById("adv-offer-lbl").innerHTML = "";
			if(advStartDt < today){
				document.getElementById("adv-startdate-lbl").innerHTML = "Start Date should  not be less than today's Date.";
			}
			else{
				document.getElementById("adv-startdate-lbl").innerHTML = "";

				if(advEndDt < today){
					document.getElementById("adv-enddate-lbl").innerHTML = "End Date should  not be less than today's Date.";
				}
				else{

					document.getElementById("adv-enddate-lbl").innerHTML = "";
					if(advStartDt > advEndDt){
						document.getElementById("adv-startdate-lbl").innerHTML = "Start Date should be less than End Date.";
					}
					else{
					document.getElementById("adv-startdate-lbl").innerHTML = "";
					var data = {
						"username":getCookie().username,
						"title" : advTitle,
						"offer" : advOffer,
						"startDate" : advStartDt,
						"endDate" : advEndDt
					};

					var json = JSON.stringify(data);

					xhr.open("POST","http://localhost:9090/servicegeneral/api/advertisment");
					xhr.setRequestHeader("Content-Type", "application/json");
					xhr.send(json);

					xhr.onreadystatechange = function() {
						if (this.readyState == 4 && this.status == 200) {
							console.log(this.responseText);
							alert("Submitted Successfully");
							window.location.reload();
						}
					}
				}
			}
		}
	}
	}
	}
}
}

function loadProviderData(){

	window.location.href = "http://127.0.0.1/servicegeneral/servicegeneral-ui/provider.php";
}


function getCookie(){

	var cookie = document.cookie;
	
	var userCookie = {};
	cookie.split(/\s*;\s*/).forEach(function(pair) {
			  pair = pair.split(/\s*=\s*/);
			  userCookie[pair[0]] = pair.splice(1).join('=');
			});

	var userJson = JSON.parse(JSON.stringify(userCookie, null, 4));

	return userJson;	
}

function retreiveServiceNameFromId(serviceId){
	if(serviceId =="isp"){
		return "INTERNET";						
	}
	else if(serviceId =="painting"){
		return "PAINTING";						
	}
	else if(serviceId =="roofing"){
		return "ROOFING";						
	}
	else if(serviceId =="movers"){
		return "MOVERS AND PACKERS";						
	}
	else if(serviceId =="repair"){
		return "PHONE AND MOBILE REPAIR";						
	}
	else if(serviceId =="locksmith"){
		return "LOCKSMITH";						
	}
	else if(serviceId =="salon"){
		return "SALON";						
	}
	else if(serviceId =="plumbing"){
		return "PLUMBING";						
	}
	else if(serviceId =="cleaning"){
		return "DRY CLEANING";						
	} else{
		return serviceId;
	}
}

function wait(ms){
   var start = new Date().getTime();
   var end = start;
   while(end < start + ms) {
     end = new Date().getTime();
  }
}








