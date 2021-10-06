<div class="header-top">
	<div class="container">
		<div class="row">
			<div class="col-xs-2  col-sm-6" style="margin-top: 5px;">
				<div>
					<div class="logo-title">
					<span><a href="/servicegeneral/servicegeneral-ui/index.php"><font color="orange">Service</font> General</span></a>
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="grey" class="bi bi-hammer" viewBox="0 0 16 16">
							  <path d="M9.972 2.508a.5.5 0 0 0-.16-.556l-.178-.129a5.009 5.009 0 0 0-2.076-.783C6.215.862 4.504 1.229 2.84 3.133H1.786a.5.5 0 0 0-.354.147L.146 4.567a.5.5 0 0 0 0 .706l2.571 2.579a.5.5 0 0 0 .708 0l1.286-1.29a.5.5 0 0 0 .146-.353V5.57l8.387 8.873A.5.5 0 0 0 14 14.5l1.5-1.5a.5.5 0 0 0 .017-.689l-9.129-8.63c.747-.456 1.772-.839 3.112-.839a.5.5 0 0 0 .472-.334z"/>
							</svg>
					</div>
				</div>
			</div>
			<div class="col-xs-10 col-sm-6" style="margin-top: 5px;">

				<!-- header-top-second start -->
				<!-- ================ -->
				<div id="header-top-second"  class="clearfix">

					<!-- header top dropdowns start -->
					<!-- ================ -->
					<div class="header-top-dropdown">
						<div class="btn-group dropdown">
							<button onclick=" window.open('feedback.php', '_self');" style="color: beige!important;" class="btn dropdown-toggle" data-toggle="dropdown"><u>Feedback</u></button>
						</div>
						<div class="btn-group dropdown" id="register-div">
							<button onclick=" window.open('register.php', '_self');" style="color: beige!important;" class="btn dropdown-toggle" data-toggle="dropdown"><u>Resister Today!</u></button>
						</div>
						<div class="btn-group dropdown">
							<button style="color: beige!important;" type="button" class="btn dropdown-toggle" data-toggle="dropdown"><i class="fa fa-plus"></i> More</button>
							<ul class="dropdown-menu dropdown-menu-right dropdown-animation">
								<li>
									<a href="#">Blog</a>
								</li>
								<li>
									<a href="#">About us</a>
								</li>
								<li>
									<a href="#">Contact us</a>
								</li>
								<li>
									<a href="#">Terms of use</a>
								</li>
								<li>
									<a href="#">Privacy policy</a>
								</li>
								<li>
									<a href="#">Customer Support</a>
								</li>
							</ul>
						</div>
						<div class="btn-group dropdown" id="login-div">
							<button id="login-button" style="color: beige!important;" type="button" class="btn dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Login</button>
							<ul class="dropdown-menu dropdown-menu-right dropdown-animation">
								<li>
									<form class="login-form" id="login-Form" action="login(e)">
										<div class="form-group form-check">
											<input type="radio" name="service-login" class="form-check-input" id="customer" checked/>
											<label class="control-label">I need service</label>
										</div>
										<div class="form-group form-check">
											<input type="radio" name="service-login" class="form-check-input" id="provider" />
											<label class="control-label">I provide service</label>
										</div>
										<div class="form-group has-feedback">
											<label class="control-label">Username</label>
											<input type="text" class="form-control" placeholder="" id="username">
											<i class="fa fa-user form-control-feedback"></i>
										</div>
										<div class="form-group">
											<label class="control-label" id="usernamemsg" style="color: red;"></label>
										</div>
										<div class="form-group has-feedback">
											<label class="control-label">Password</label>
											<input type="password" class="form-control" placeholder="" id="password">
											<i class="fa fa-lock form-control-feedback"></i>
										</div>
										<div class="form-group">
											<label class="control-label" id="passwordmsg" style="color: red;"></label>
										</div>
										<button type="submit" class="btn btn-group btn-dark btn-sm">Log In</button>
										<span>or</span>
										<button type="reset" onclick="window.open('register.php', '_self');" class="btn btn-group btn-default btn-sm">Sign Up</button>

										<ul>
											<li><a href="#">Forgot your password?</a></li>
										</ul>
										<div class="form-group">
											<label class="control-label" id="message" style="color: red;"></label>
										</div>
										
									</form>
								</li>
							</ul>
						</div>

						<div class="btn-group dropdown" id="logout-div">
							<button id="logout-button" style="color: beige!important;" type="button" class="btn dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><label id="user-profile"></label></button>
							<ul class="dropdown-menu dropdown-menu-right dropdown-animation">
								<li>
									<a href="/servicegeneral/servicegeneral-ui/index.php"><i class="fa fa-home"></i> Home</a>
								</li>
								<li>
									<a href="/servicegeneral/servicegeneral-ui/profile.php">Profile</a>
								</li>
								<li>
									<a onclick="logout()">Logout</a>
								</li>
								<li>
									<a onclick="deleteAccount()">Delete Account</a>
								</li>
							</ul>
						</div>
					<!--  header top dropdowns end -->

				</div>
				<!-- header-top-second end -->

			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
	function deleteAccount() {
		
		if (confirm("Are you sure you want to Delete Account")) {
			  
			  var xhr = new XMLHttpRequest();
			var cookie = document.cookie;
					console.log("ON LOAD:" + cookie);

					var userCookie = {};

					cookie.split(/\s*;\s*/).forEach(function(pair) {
					  pair = pair.split(/\s*=\s*/);
					  userCookie[pair[0]] = pair.splice(1).join('=');
					});

					var userJson = JSON.parse(JSON.stringify(userCookie, null, 4));
			
				var username = userJson.username;
				xhr.open("POST","http://127.0.0.1:9090/servicegeneral/api/user/delete/"+username);
				xhr.send();
				
				xhr.onreadystatechange = function() {	

					if (this.readyState == 4 && this.status == 200 && this.responseText!="") {
						console.log(this.responseText);
						alert("Account Deleted Successfully");
						logout();
					}
				}
			}
		}
		
			
</script>