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

	<!-- body classes:
			"boxed": boxed layout mode e.g. <body class="boxed">
			"pattern-1 ... pattern-9": background patterns for boxed layout mode e.g. <body class="boxed pattern-1">
	-->
	<body class="front" id="body">
		<!-- scrollToTop -->
		<!-- ================ -->
		<div class="scrollToTop"><i class="fa fa-angle-up"></i></div>

		<!-- page wrapper start -->
		<!-- ================ -->
		<div class="page-wrapper">

			<!-- header-top start (Add "dark" class to .header-top in order to enable dark header-top e.g <div class="header-top dark">) -->
			<!-- ================ -->
			
			<?php 
				include 'header.php'; 
			?>

			<!-- banner start -->
			<!-- ================ -->
			<div class="banner">

				<!-- slideshow start -->
				<!-- ================ -->
				<div class="slideshow-boxed" style="padding:0!important;">
					<div>

						<!-- slider revolution start -->
						<!-- ================ -->
						<div class="slider-revolution-5-container">
							<div id="slider-banner-boxedwidth" class="slider-banner-boxedwidth rev_slider" data-version="5.0">
								<ul class="slides" style="width:100%!important">
									<!-- slide 1 start -->
									<li data-transition="random" data-slotamount="default" data-masterspeed="default" data-title="Relocating made easy">

									<!-- main image -->
									<img src="images/feedbackSlide2.jpg"  alt="slidebg1" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat" class="rev-slidebg">


									</li>
									<!-- slide 1 end -->

									<!-- slide 2 start -->
									<li data-transition="random" data-slotamount="7" data-masterspeed="500" data-saveperformance="on" data-title="Setting up home internet">

									<!-- main image -->
									<img src="images/feedbackSlide1.jpg"  alt="slidebg1" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat" class="rev-slidebg">

									
									

									</li>
									<!-- slide 2 end -->

									<!-- slide 3 start -->
									<li data-transition="random" data-slotamount="7" data-masterspeed="500" data-saveperformance="on" data-title="Need local painters?">

									<!-- main image -->
									<img src="images/feedbackSlide3.jpg"  alt="kenburns" data-bgposition="left center" data-kenburns="on" data-duration="10000" data-ease="Linear.easeNone" data-scalestart="100" data-scaleend="120" data-rotatestart="0" data-rotateend="0" data-offsetstart="0 0" data-offsetend="0 0" data-bgparallax="10" class="rev-slidebg" data-no-retina>

									

									</li>
									<!-- slide 3 end -->

								</ul>
								<div class="tp-bannertimer tp-bottom"></div>
							</div>
						</div>
						<!-- slider revolution end -->

					</div>
				</div>
				<!-- slideshow end -->

			</div>
			<!-- banner end -->
			
			<!-- Form Start -->

			<div class="container">
			<h2>We would love to hear from you!</h2>
			<label id="feedback-message" style="font-size: 1.2em;"></label>
			<form id = "feedback-form" action="submitFeedback(e)">
				<div class="form-group">
					<label>Name:</label> <label class="control-label" id="feedback-nameMsg" style="color: red;"></label>
					<input type="text" class="form-control" id="name" placeholder="Enter Name" name="Name">
				</div>
				<div class="form-group">
					<label>Feedback:</label> <label class="control-label" id="feedback-feedbackMsg" style="color: red;"></label>
					<!--<input type="text" class="form-control" id="feedback" placeholder="Enter Feedback" name="feedback"> -->
					<textarea class="form-control" id="feedback" placeholder="Enter Feedback" name="feedback" rows="3"></textarea>
				</div>
				
				<button type="submit" id="submit" class="btn btn-default">SUBMIT</button>
				<button type="button" id="editBtn" onclick = "editFeedback()" class="btn btn-default">EDIT</button>
				<button type="button" id="deleteBtn" onclick = "deleteFeedback()" class="btn btn-default">DELETE</button>
			</form>
			</div>
			
		

			<!-- Form Start -->
 

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
			document.getElementById("body").onload = function() {
				loadFeedbackPage();				
			};

		const loadFeedbackPage = async ()=> {
			await saveAndLoadFeedback();
			await checkLoggedInUserOnFeedback();
		}

		function checkLoggedInUserOnFeedback() {
			var cookie = document.cookie;

			var userCookie = {};
			cookie.split(/\s*;\s*/).forEach(function(pair) {
			  pair = pair.split(/\s*=\s*/);
			  userCookie[pair[0]] = pair.splice(1).join('=');
			});

			var userJson = JSON.parse(JSON.stringify(userCookie, null, 4));

			if(userJson.username !=null){
				document.getElementById("login-div").style.display = "none";
				document.getElementById("register-div").style.display = "none";
				document.getElementById("user-profile").innerHTML = "Hi "+userJson.firstName + " " + userJson.lastName + " !";
				document.getElementById('name').value = userJson.username;
				document.getElementById("name").disabled = true;
				console.log(userJson.feedback);
				if(userJson.feedback != null){
					document.getElementById("submit").disabled = true;
					document.getElementById("feedback").disabled = true;
					document.getElementById("editBtn").style.display = "inline-block";
					document.getElementById("deleteBtn").style.display = "inline-block";
					console.log("execute edit and delete bth display")
				} else{
					document.getElementById("editBtn").style.display = "none";
					document.getElementById("deleteBtn").style.display = "none";
					console.log("execute edit and delete no display")
				}

			} else {
				document.getElementById("logout-div").style.display = "none";
				document.getElementById("submit").disabled = true;
				document.getElementById("editBtn").style.display = "none";
				document.getElementById("deleteBtn").style.display = "none";
				document.getElementById("feedback-message").innerHTML = "Please login to provide feedback!";	
			}
		}

		function editFeedback(){
			document.getElementById("submit").disabled = false;
			document.getElementById("feedback").disabled = false;

		}

		function deleteFeedback(){
			deleteUserFeedback();
			document.getElementById("editBtn").style.display = "none";
			document.getElementById("deleteBtn").style.display = "none";
			document.getElementById("feedback").disabled = false;			
			window.location.href = "http://127.0.0.1/servicegeneral/servicegeneral-ui/feedback.php";
		}

		document.getElementById('feedback-form').addEventListener('submit', feedback);

		</script>
	</body>
</html>
