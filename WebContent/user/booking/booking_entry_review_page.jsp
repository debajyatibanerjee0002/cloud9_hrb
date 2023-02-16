<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" import="com.connection.SingletonConnection"%>
<%
	String hotel_id = request.getParameter("hotel_id");
	String room_id = request.getParameter("room_id");
	String user_id = request.getParameter("user_id");
	String room_type = request.getParameter("room_type");
	String hotel_name = request.getParameter("hotel_name");
	double room_price = Double.valueOf(request.getParameter("room_price"));
	String user_name = request.getParameter("user_name");
	int age = Integer.parseInt(request.getParameter("age"));
	int no_of_guests = Integer.parseInt(request.getParameter("no_of_guests"));
	String name_of_guests = request.getParameter("name_of_guests");
	String from_date = request.getParameter("from_date");
	String to_date = request.getParameter("to_date");
	int no_of_nights = Integer.parseInt(request.getParameter("no_of_nights"));
	
	String bill_no = hotel_id+room_id;
	double total = 0.0;
	total = Double.valueOf(room_price*no_of_nights);
	System.out.println(total);
	if(total<7500.0){
		total = total + ((total*12)/100);
	}else{
		total = total + ((total*15)/100);
	}
	//System.out.println("booking page - "+name+" "+room_id+" "+room_type+" "+hotel_id+" "+room_price);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Booking Entry Page</title>
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
	        <span class="navbar-nav ml-auto" style="font-size:1.5rem; font-weight:bold; color:white">BOOKING REVIEW</span>
	        <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	                <a href="../search/search_page1.jsp" class="nav-link custom-button">Cancle</a>
	            </li>
	        </ul>
	    </div>
	</nav>
</section>
<section id="#">
<div class="container">
	<div class="jumbotron">
		<form action="/cloud9_hrb/Booking" method="POST">
		<input type="hidden" class="form-control" id="inputEmail3" value="<%=hotel_id %>" name="hotel_id" required>
		<input type="hidden" class="form-control" id="inputEmail3" value="<%=room_id %>" name="room_id" required>
		<input type="hidden" class="form-control" id="inputEmail3" value="<%=room_price %>" name="room_price" required>
			<div class="row mb-3">
			  <label for="inputEmail3" class="col-sm-2 col-form-label">Bill No</label>
			  <div class="col-sm-10">
			    <input type="text" class="form-control" id="inputEmail3" name="bill_no" value="<%=bill_no %>" readonly>
			  </div>
			</div>
			<div class="row mb-3">
			  <label for="inputEmail3" class="col-sm-2 col-form-label">Hotel Name</label>
			  <div class="col-sm-10">
			    <input type="text" class="form-control" id="inputEmail3" name="hotel_name" value="<%=hotel_name.toUpperCase() %>" readonly>
			  </div>
			</div>
			<div class="row mb-3">
			  <label for="inputEmail3" class="col-sm-2 col-form-label">User Id</label>
			  <div class="col-sm-10">
			    <input type="text" class="form-control" id="inputEmail3" name="user_id" value="<%=user_id %>" readonly>
			  </div>
			</div>
			<div class="row mb-3">
			  <label for="inputEmail3" class="col-sm-2 col-form-label" >Room Type</label>
			  <div class="col-sm-10">
			    <input type="text" class="form-control" id="inputEmail3" name="room_type" value="<%=room_type %>" readonly>
			  </div>
			</div>
			<div class="row mb-3">
			  <label for="inputEmail3" class="col-sm-2 col-form-label">Room Price</label>
			  <div class="col-sm-10">
			    <input type="number" class="form-control" id="inputEmail3" name="room_price" value="<%=room_price %>" readonly>
			  </div>
			</div>
			<div class="row mb-3">
			  <label for="inputEmail3" class="col-sm-2 col-form-label" >User Name</label>
			  <div class="col-sm-10">
			    <input type="text" class="form-control" id="inputEmail3" name="user_name" value="<%=user_name %>" readonly>
			  </div>
			</div>  
			<div class="row mb-3">
			  <label for="inputEmail3" class="col-sm-2 col-form-label">Age</label>
			  <div class="col-sm-10">
			    <input type="number" class="form-control" id="inputEmail3" name="age" value="<%=age %>" readonly>
			  </div>
			</div>  		  
			<div class="row mb-3">
			  <label for="inputEmail3" class="col-sm-2 col-form-label">No. of Guests</label>
			  <div class="col-sm-10">
			    <input type="number" class="form-control" name="no_of_guests" value="<%=no_of_guests %>" readonly>
			  </div>
			</div>
			<div class="row mb-3">
			  <label for="inputEmail3" class="col-sm-2 col-form-label">Name of Guests</label>
			  <div class="col-sm-10">
			    <input type="text" class="form-control" id="inputEmail3" name="name_of_guests" value="<%=name_of_guests %>" readonly>
			  </div>
			</div>
			
			<div class="row mb-3">
			  <label for="floatingInput" class="col-sm-2 col-form-label">From Date</label>
			  <div class="col-sm-10">
			    <input type="date" class="form-control" id="floatingInput" name="from_date"  value="<%=from_date %>"readonly>
			  </div>
			</div>
			<div class="row mb-3">
			  <label for="floatingInput" class="col-sm-2 col-form-label">To Date</label>
			  <div class="col-sm-10">
			    <input type="date" class="form-control" id="floatingInput" name="to_date" value="<%=to_date %>" readonly>
			  </div>
			</div>	
			<div class="row mb-3">
			  <label for="inputEmail3" class="col-sm-2 col-form-label">No. of Nights</label>
			  <div class="col-sm-10">
			    <input type="number" class="form-control" name="no_of_nights" value="<%=no_of_nights %>" readonly>
			  </div>
			</div>
			<div class="row mb-3">
			  <label for="inputEmail3" class="col-sm-2 col-form-label">Total Amount + %GST</label>
			  <div class="col-sm-10">
			    <input type="number" class="form-control" name="total" value="<%=total %>" readonly>
			  </div>
			</div>
			<button type="submit" class="btn btn-primary">BOOK</button>
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
		var output = document.getElementById("number");
		output.innerHTML = slider.value; // Display the default slider value
	
		// Update the current slider value (each time you drag the slider handle)
		slider.oninput = function() {
		  output.innerHTML = this.value;
		}
	</script>
    
</body>
</html>