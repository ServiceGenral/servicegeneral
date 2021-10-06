<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Service General | One stop for all services</title>
		<meta name="author" content="author">

		<!-- Mobile Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- Favicon -->
		<link rel="shortcut icon" href="images/favicon.ico">

		<!-- Web Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,400i,700,700i&amp;subset=latin-ext" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet">

		<!-- Bootstrap core CSS -->
		<link href="bootstrap/css/bootstrap.css" rel="stylesheet">

		<!-- Font Awesome CSS -->
		<link href="fonts/font-awesome/css/font-awesome.css" rel="stylesheet">

		<!-- Plugins -->
		<link href="plugins/rs-plugin-5/css/settings.css" rel="stylesheet">
		<link href="plugins/rs-plugin-5/css/layers.css" rel="stylesheet">
		<link href="plugins/rs-plugin-5/css/navigation.css" rel="stylesheet">
		<link href="plugins/magnific-popup/magnific-popup.css" rel="stylesheet">
		<link href="css/animations.css" rel="stylesheet">
		<link href="plugins/owl-carousel/assets/owl.carousel.css" rel="stylesheet">
		<link href="plugins/owl-carousel/assets/owl.theme.default.min.css" rel="stylesheet">

		<!-- IDea core CSS file -->
		<link href="css/style.css" rel="stylesheet">

		<!-- Color Scheme (In order to change the color scheme, replace the red.css with the color scheme that you prefer)-->
		<link href="css/skins/red.css" rel="stylesheet">

		<!-- Custom css -->
		<link href="css/custom.css" rel="stylesheet">


	</head>

	<body class="front" id="body">
		<div class="scrollToTop"><i class="fa fa-angle-up"></i></div>
		<div class="page-wrapper">
			<?php 
				include 'header.php'; 
			?>
		</div>


			<section class="main-container gray-bg">
				<div class="main">
					<div class="container">
						<div class="row">
							<div class="col-md-12" id="providerRow">
								
							</div>
						</div>
					</div>
				</div>
			</section>


		<?php 
			include 'footer.php';
		?>
		</div>

		

		<!-- page-wrapper end -->

		<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
		<!-- Jquery and Bootstap core js files -->
		<script src="plugins/jquery.min.js"></script>
		<script src="bootstrap/js/bootstrap.js"></script>

		<!-- jQuery REVOLUTION Slider  -->
		<script src="plugins/rs-plugin-5/js/jquery.themepunch.tools.min.js"></script>
		<script src="plugins/rs-plugin-5/js/jquery.themepunch.revolution.min.js"></script>

		<!-- Isotope javascript -->
		<script src="plugins/isotope/imagesloaded.pkgd.min.js"></script>
		<script src="plugins/isotope/isotope.pkgd.min.js"></script>

		<!-- Owl carousel javascript -->
		<script src="plugins/owl-carousel/owl.carousel.js"></script>

		<!-- Magnific Popup javascript -->
		<script src="plugins/magnific-popup/jquery.magnific-popup.min.js"></script>

		<!-- Appear javascript -->
		<script src="plugins/appear/jquery.appear.js"></script>

		<!-- Count To javascript -->
		<script src="plugins/countTo/jquery.countTo.js"></script>

		<!-- Initialization of Plugins -->
		<script src="js/template.js"></script>

		<!-- Custom Scripts -->
		<script src="js/custom.js"></script>

		<script src="servicegeneral.js"></script>

		<script>
	
function checkLoggedInUser() {
			var cookie = document.cookie;
			console.log("ON LOAD:" + cookie);

			var userCookie = {};
			cookie.split(/\s*;\s*/).forEach(function(pair) {
			  pair = pair.split(/\s*=\s*/);
			  userCookie[pair[0]] = pair.splice(1).join('=');
			});

			var userJson = JSON.parse(JSON.stringify(userCookie, null, 4));

			if(userJson.username !=null){
				document.getElementById("register-div").style.display = "none";
				document.getElementById("login-div").style.display = "none";
				document.getElementById("user-profile").innerHTML = "Hi "+userJson.firstName + " " + userJson.lastName + " !";
				
				document.getElementById("profile-firstName").value = userJson.firstName;
				document.getElementById("profile-lastName").value = userJson.lastName;
				document.getElementById("profile-email").value = userJson.email;
				document.getElementById("profile-address").value = userJson.address;
				document.getElementById("profile-phoneNumber").value = userJson.phoneNumber;
				document.getElementById("profile-username").value = userJson.username;
				
				
				if(userJson.type == "customer"){
					document.getElementById("usertype").style.display = "none";
				} else {
					if(userJson.serviceType=="isp"){
						document.getElementById("profile-service").value = "INTERNET SERVICE PROVIDER";						
					}
					if(userJson.serviceType=="painting"){
						document.getElementById("profile-service").value = "LOCAL HOUSE PAINTERS";						
					}
					if(userJson.serviceType=="roofing"){
						document.getElementById("profile-service").value = "ROOFING";						
					}
					if(userJson.serviceType=="movers"){
						document.getElementById("profile-service").value = "MOVERS AND PACKERS";						
					}
					if(userJson.serviceType=="repair"){
						document.getElementById("profile-service").value = "PHONE AND MOBILE REPAIRER";						
					}
					if(userJson.serviceType=="locksmith"){
						document.getElementById("profile-service").value = "LOCKSMITH";						
					}
					if(userJson.serviceType=="salon"){
						document.getElementById("profile-service").value = "SALON";						
					}
					if(userJson.serviceType=="plumbing"){
						document.getElementById("profile-service").value = "PLUMBING";						
					}
					if(userJson.serviceType=="cleaning"){
						document.getElementById("profile-service").value = "DRY CLEANING";						
					}
				}

			} else {
				document.getElementById("logout-div").style.display = "none";
			}
		}

	    </script>
		

	</body>
</html>
