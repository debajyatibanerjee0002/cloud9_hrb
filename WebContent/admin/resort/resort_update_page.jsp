<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Resort Update Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
    crossorigin="anonymous">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Righteous&display=swap" rel="stylesheet">

<link href="fontawesome/css/fontawesome.css" rel="stylesheet">
<link href="fontawesome/css/brands.css" rel="stylesheet">
<link href="fontawesome/css/solid.css" rel="stylesheet">
<link href="../../styles/form_page.css" rel="stylesheet">

</head>
<body>
<section>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	    <a href="#" class="navbar-brand logoText" >
		    <img src="../../images/CLOUD9.png" alt="Bootstrap" width="50" height="50">
		    Cloud9
	    </a>
	    <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarMenu">
	        <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarMenu">
	        <span class="navbar-nav ml-auto" style="font-size:1.5rem; font-weight:bold; color:white">NEW RESORT ADD</span>
	        <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	                <a href="#" class="nav-link custom-button2">Back</a>
	            </li>
	        </ul>
	    </div>
	</nav>
</section>
<section id="#">
<div class="container">
	<div class="jumbotron">
		<form>
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">Resort ID</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="inputEmail3">
		    </div>
		  </div>
		  
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">Resort Name</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="inputEmail3">
		    </div>
		  </div>
		  
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">Upload Image</label>
		    <div class="col-sm-10">
		      <input type="file" class="form-control" id="inputEmail3">
		    </div>
		  </div>
		  
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">Location</label>
		    <div class="col-sm-10">
		        <select class="form-select" aria-label="Default select example">
				  <option selected>-- SELECT --</option>
				  <option value="1">KOLKATA</option>
				  <option value="2">MUMBAI</option>
				  <option value="3">DELHI</option>
				  <option value="4">GOA</option>
				  <option value="5">PURI</option>
				  <option value="6">OTHER</option>
				</select>
		    </div>
		  </div>
		  
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">ZIP</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control" id="inputEmail3">
		    </div>
		  </div>
		  
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">Resort Type</label>
		    <div class="col-sm-10">
		        <div class="slidecontainer">
				  <input type="range" min="1" max="5" value="1" class="slider" id="myRange">
				  <span id="demo"></span>
				  <span>STAR</span>
				</div>
		    </div>
		  </div>
		  
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">Room Types</label>
		    <div class="form-check">
		    	<div class="container">
		    		<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
			  		<label class="form-check-label" for="flexCheckDefault">Single</label>
		    	</div>
		    	<div class="container">
		    		<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
			  		<label class="form-check-label" for="flexCheckDefault">Double</label>
		    	</div>
		    	<div class="container">
		    		<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
			  		<label class="form-check-label" for="flexCheckDefault">Deluxe</label>
		    	</div>

			</div>
		  </div>
		  
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">Total Rooms</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control" id="inputEmail3">
		    </div>
		  </div>
		  
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">Resort Price</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control" id="inputEmail3">
		    </div>
		  </div>
		  
		  
		  
		  
		  
		  <button type="submit" class="btn btn-primary">ADD HOTEL</button>
		</form>	
	</div>
</div>
</section>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	    crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	    crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	    crossorigin="anonymous"></script>
	<script>
		var slider = document.getElementById("myRange");
		var output = document.getElementById("demo");
		output.innerHTML = slider.value; // Display the default slider value
	
		// Update the current slider value (each time you drag the slider handle)
		slider.oninput = function() {
		  output.innerHTML = this.value;
		}
	</script>
    
</body>
</html>