<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Welcome Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
    crossorigin="anonymous">
<link rel="stylesheet" href="main.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Righteous&display=swap" rel="stylesheet">

<link href="fontawesome/css/fontawesome.css" rel="stylesheet">
<link href="fontawesome/css/brands.css" rel="stylesheet">
<link href="fontawesome/css/solid.css" rel="stylesheet">

<link href="styles/welcome_page.css" rel="stylesheet">


</head>

<body>
<section>
	<div id="preloader"></div>
</section>

<section>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	    <a href="#" class="navbar-brand logoText" >
		    <img src="images/CLOUD9.png" alt="Bootstrap" width="50" height="50">
		    Cloud9
	    </a>
	    <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarMenu">
	        <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarMenu">
	        <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	                <a href="#home" class="nav-link">Home</a>
	            </li>
	            <li class="nav-item">
	                <a href="#about_us" class="nav-link">About Us</a>
	            </li>
	            <li class="nav-item">
	                <a href="#contact_us" class="nav-link">Contact Us</a>
	            </li>
	            <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
		            Log In
		          </a>
		          <ul class="dropdown-menu">
		            <li><a class="dropdown-item" href="admin/admin_login.jsp">Admin</a></li>
		            <li><hr class="dropdown-divider"></li>
		            <li><a class="dropdown-item" href="user/user_login.jsp">User</a></li>
		          </ul>
		        </li>
	        </ul>
	    </div>
	</nav>
</section>
<section id="home">	
	<div class="jumbotron img-jumbo banner-area">
		<div class="container">
			<h1 class="text-white">Welcome to <span class="logoText">Cloud9</span></h1>
			<h3 class="text-white">Hotel & Resort Booking</h3>
		</div>
		<div class="container-fluid">
			<form action="user/user_login.jsp" method="post">
				<div class="mb-3">
				  <label for="floatingInput" class="text-white">From Date</label>
				  <input type="date" class="form-control" id="floatingInput">
				</div>
				<div class="mb-3">
				  <label for="floatingInput" class="text-white">To Date</label>
				  <input type="date" class="form-control" id="floatingInput">
				</div>
				<div class="form-floating mb-3">
				  	<label for="floatingInput" class="text-white">Place</label>
				    <div class="">
				        <select class="form-control" id="floatingInput" name="place">
						  <option selected>-- SELECT --</option>
						  <option value="kolkata">KOLKATA</option>
						  <option value="mumbai">MUMBAI</option>
						  <option value="delhi">DELHI</option>
						  <option value="goa">GOA</option>
						  <option value="puri">PURI</option>
						</select>
				    </div>
				</div>
				<div class="form-floating mb-3">
				  	<label for="floatingInput" class="text-white">Type</label>
				    <div class="">
				        <select class="form-control" id="floatingInput" name="hotel_resort">
						  <option selected>-- SELECT --</option>
						  <option value="hotel">Hotel</option>
						  <option value="resort">Resort</option>
						</select>
				    </div>
				</div>
				<input type="submit" class="btn btn-primary" value="Search">
			</form>			
		</div>
		<div class="container">
			<img src="images/CLOUD9.png" alt="Bootstrap" width="70%">
		</div>
	</div>
</section>

<section>
	<div class="room-container">
		<div class="container reveal">
			<span class="logoText">ROOMS WE HAVE</span>
		</div>
		<div class="card-container">
			<div class="card reveal" style="width: 18rem;">
			  <img src="images/single_room.jpg" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">Single Room</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn btn-primary">More</a>
			  </div>
			</div>
			<div class="card reveal" style="width: 18rem;">
			  <img src="images/sea_side_room.jpg" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">Sea View</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn btn-primary">More</a>
			  </div>
			</div>
			<div class="card reveal" style="width: 18rem;">
			  <img src="images/double_room.jpg" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">Double Room</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn btn-primary">More</a>
			  </div>
			</div>
			<div class="card reveal" style="width: 18rem;">
			  <img src="images/hill_side_room.jpg" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">Hill View</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn btn-primary">More</a>
			  </div>
			</div>
			<div class="card reveal" style="width: 18rem;">
			  <img src="images/deluxe_room.jpg" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">Deluxe Room</h5>
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <a href="#" class="btn btn-primary">More</a>
			  </div>
			</div>		
		</div>
	</div>
</section>

<section id="about_us">
	<div class="offer-container">
		<div class="container reveal">
			<span class="logoText">What We Offer</span>
		</div>
		<div class="child-offer-container">
			<div>
				<div class="offer-card reveal">
					<div class="card mb-3" style="max-width: 540px;">
					  <div class="row g-0">
					    <div class="col-md-4">
					      <img src="images/tea_coffee.jpg" class="img-fluid rounded-start" alt="...">
					    </div>
					    <div class="col-md-8">
					      <div class="card-body">
					        <h5 class="card-title">Tea Coffee</h5>
					        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					      </div>
					    </div>
					  </div>
					</div>
					<div class="card mb-3" style="max-width: 540px;">
					  <div class="row g-0">
					    <div class="col-md-4">
					      <img src="images/hot_shower.jpg" class="img-fluid rounded-start" alt="...">
					    </div>
					    <div class="col-md-8">
					      <div class="card-body">
					        <h5 class="card-title">Hot Shower</h5>
					        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					      </div>
					    </div>
					  </div>
					</div>				
				</div>
				<div class="offer-card reveal">
					<div class="card mb-3" style="max-width: 540px;">
					  <div class="row g-0">
					    <div class="col-md-4">
					      <img src="images/laundry.jpg" class="img-fluid rounded-start" alt="...">
					    </div>
					    <div class="col-md-8">
					      <div class="card-body">
					        <h5 class="card-title">Laundry</h5>
					        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					      </div>
					    </div>
					  </div>
					</div>
					<div class="card mb-3" style="max-width: 540px;">
					  <div class="row g-0">
					    <div class="col-md-4">
					      <img src="images/ac.png" class="img-fluid rounded-start" alt="...">
					    </div>
					    <div class="col-md-8">
					      <div class="card-body">
					        <h5 class="card-title">Air Conditionar</h5>
					        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					      </div>
					    </div>
					  </div>
					</div>				
				</div>
				<div class="offer-card reveal">
					<div class="card mb-3" style="max-width: 540px;">
					  <div class="row g-0">
					    <div class="col-md-4">
					      <img src="images/kitchen.jpg" class="img-fluid rounded-start" alt="...">
					    </div>
					    <div class="col-md-8">
					      <div class="card-body">
					        <h5 class="card-title">Kitchen</h5>
					        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					      </div>
					    </div>
					  </div>
					</div>
					<div class="card mb-3" style="max-width: 540px;">
					  <div class="row g-0">
					    <div class="col-md-4">
					      <img src="images/wifi.jpg" class="img-fluid rounded-start" alt="...">
					    </div>
					    <div class="col-md-8">
					      <div class="card-body">
					        <h5 class="card-title">WiFi</h5>
					        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					      </div>
					    </div>
					  </div>
					</div>				
				</div>								
			</div>
			<div class="map reveal">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d217562.41485246381!2d-77.15115454269088!3d38.88729971212717!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89b7c6de5af6e45b%3A0xc2524522d4885d2a!2sWashington%2C%20DC%2C%20USA!5e0!3m2!1sen!2sin!4v1667627277801!5m2!1sen!2sin" width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
			</div>
		</div>
	</div>
</section>	

<section id="contact_us">
	<div class="contact-container">
		<div class="container reveal">
			<span class="logoText">Contact Us</span>
		</div>
		<div class="contact-container-col reveal">
			<div class="social-links">
				<div class="social-icons">
					<a href="#"><i class="fa-brands fa-facebook"></i></a>
					<a href="#"><i class="fa-brands fa-linkedin"></i></a>
					<a href="#"><i class="fa-brands fa-github"></i></a>
				</div>
				<div class="social-icons-address">
					<a href="https://goo.gl/maps/wUKDkuctmNhzy3Fa8" target="_blank"><i class="fa-solid fa-location-dot"></i></a>
					<div class="address-row">
						<h4>Address</h4>
						<span>14390 Air & Space</span>
						<span>Museum Pkwy</span>
						<span>Chantilly, VA 20151</span>
						<span>United States</span>
					</div>
				</div>
				<div class="social-icons-address">
					<a href="#"><i class="fa-solid fa-envelope"></i></a>
					<div class="address-row">
						<h4>Email ID</h4>
						<span>cloud9_hrb@gmail.com</span>
					</div>
				</div>
			</div>
			<div class="message-box">
				<form action="#" method="post">
					<div class="mb-3">
					  <label for="floatingInput" class="text-black">Name</label>
					  <input type="text" class="form-control form-size" id="floatingInput" autocomplete="off">
					</div>
					<div class="mb-3">
					  <label for="floatingInput" class="text-black">Email Id</label>
					  <input type="email" class="form-control form-size" id="floatingInput" autocomplete="off">
					</div>
					<div class="form-floating mb-3">
					  <label for="floatingInput" class="text-black">Message</label>
					  <textarea class="form-control form-size" id="floatingInput"></textarea>
					</div>
					<input type="submit" class="btn btn-primary" value="Submit" autocomplete="off">
				</form>
			</div>
		</div>
	</div>
</section>
<section>
	<div class="footer-container">
		<span class="text-white">Created By </span>
		<span class="text-white">Debajyati Banerjee |</span>
		<i class="fa-solid fa-copyright" color="white"></i>
		<span class="text-white">2022 All Rights Reserved.</span>
	</div>
</section>

<script>
	var loader = document.getElementById("preloader");
	window.addEventListener("load", function(){
		loader.style.display = "none";
	});
	window.addEventListener("scroll", function(){
		var reveals = document.querySelectorAll(".reveal");
		for(var i=0; i<reveals.length; i++)
		{
			var windowHeight = window.innerHeight;
			var revealTop = reveals[i].getBoundingClientRect().top;
			var revealPoint = 30;
			if(revealTop < windowHeight - revealPoint)
			{
				reveals[i].classList.add("active");
			}
			else
			{
				reveals[i].classList.remove("active");
			}
		}
	});
</script>
	
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
</body>
</html>