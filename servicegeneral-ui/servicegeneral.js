var xhr = new XMLHttpRequest();

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
	document.cookie = "ACCEPT=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "PENDING=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "DECLINE=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "serviceType=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "serviceName=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "providers=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
	document.cookie = "feedback=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
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
	if(nameCheck == null && feebackCheck == null){
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

const submitFeedback = async(e) => {
	await feedback(e);
	await sleep(1000);
	await saveFeedbackToCookie();
	await sleep(1000);
	await loadFeedback();
	await sleep(1000);
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




function loadProviders(){

	var providers = [];
	var serviceName;
	var userJson = getCookie();

	providers = JSON.parse(userJson.providers);
	var customerId =  userJson.username;
	serviceName = userJson.serviceName;


	console.log("list of providers" +providers.length);
	document.getElementById("service-provider-title").innerHTML = retreiveServiceNameFromId(serviceName);
	
	for (var j = 0; j < providers.length; j++) {
		var providerDiv = document.createElement("div");
		var providerName = document.createElement("h2");
		
		providerName.style = "color:deepskyblue;font-weight:bold;fontSize:15px;"
		var checkBtn = document.createElement("button");
		var requestBtn = document.createElement("button");
		providerName.innerHTML = providers[j].firstName + " " + providers[j].lastName
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
		
		providerDiv.append(checkBtn);
		providerDiv.append(requestBtn);
		providerDiv.append(document.createElement("hr"));
		providerDiv.className = "row";
		providerDiv.style = "border-bottom: 1px solid gray;";
		$("#providerRow").append(providerDiv);
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

function loadRequest(status, requestId){
	//await saveRequestsToCookie(status);
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
				var requestName = document.createElement("h3");
				requestName.style = "color:deepskyblue;font-weight:bold;fontSize:15px;"
				requestName.innerHTML = retreiveServiceNameFromId(requests[j].serviceName) + " " + requests[j].customerId + " " + requests[j].providerId + " " +requests[j].date + " " + requests[j].status;
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
				}

				$("#"+requestId).append(hr);
	}

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
		return "INTERNET SERVICE PROVIDER";						
	}
	if(serviceId =="painting"){
		return "LOCAL HOUSE PAINTERS";						
	}
	if(serviceId =="roofing"){
		return "ROOFING";						
	}
	if(serviceId =="movers"){
		return "MOVERS AND PACKERS";						
	}
	if(serviceId =="repair"){
		return "PHONE AND MOBILE REPAIRER";						
	}
	if(serviceId =="locksmith"){
		return "LOCKSMITH";						
	}
	if(serviceId =="salon"){
		return "SALON";						
	}
	if(serviceId =="plumbing"){
		return "PLUMBING";						
	}
	if(serviceId =="cleaning"){
		return "DRY CLEANING";						
	}
}


function wait(ms){
   var start = new Date().getTime();
   var end = start;
   while(end < start + ms) {
     end = new Date().getTime();
  }
}
