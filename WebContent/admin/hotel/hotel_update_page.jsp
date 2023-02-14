<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="com.connection.SingletonConnection"%>
<%
	String hotel_id = request.getParameter("hotel_id");
	String hotel_name="";
	String hotel_room_type="";
	String hotel_addr="";
	double room_price1=0.0;
	double room_price2=0.0;
	double room_price3=0.0;
	int hotel_type=1;
	Connection con = SingletonConnection.getSingletonConnection();
	PreparedStatement psmt;
	String query = "SELECT * FROM HRB_HOTEL WHERE HOTEL_ID=?";
	psmt = con.prepareStatement(query);
	psmt.setString(1, hotel_id);
	ResultSet rs = psmt.executeQuery();
	if(rs.next()){
		hotel_name = rs.getString("HOTEL_NAME");
		hotel_room_type = rs.getString("HOTEL_ROOM_TYPE");
		hotel_addr = rs.getString("HOTEL_ADDR");
		room_price1 = rs.getDouble("SINGLE_ROOM_PRICE");
		room_price2 = rs.getDouble("DOUBLE_ROOM_PRICE");
		room_price3 = rs.getDouble("DELUXE_ROOM_PRICE");
		hotel_type = rs.getInt("HOTEL_TYPE");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Hotel Update Page</title>
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
	        <span class="navbar-nav ml-auto" style="font-size:1.5rem; font-weight:bold; color:white">HOTEL UPDATE</span>
	        <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	                <a href="./hotel_update_select_page.jsp" class="nav-link custom-button2">Back</a>
	            </li>
	        </ul>
	    </div>
	</nav>
</section>
<section id="#">
<div class="container">
	<div class="jumbotron">
		<form action="/cloud9_hrb/update_hotel" method="POST">
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">Hotel ID</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="inputEmail3" value="<%=hotel_id %>" name="hotel_id" readonly>
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label" >Hotel Name</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="inputEmail3" value="<%=hotel_name %>" name="hotel_name">
		    </div>
		  </div>
		  
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">Location</label>
		    <div class="col-sm-10">
		        <select class="form-select" aria-label="Default select example" name="location">
				  <option value="<%=hotel_addr %>"><%=hotel_addr %></option>
				  <option value="kolkata">KOLKATA</option>
				  <option value="mumbai">MUMBAI</option>
				  <option value="delhi">DELHI</option>
				  <option value="goa">GOA</option>
				  <option value="puri">PURI</option>
				  <option value="other">OTHER</option>
				</select>
		    </div>
		  </div>
		  
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">Hotel Type</label>
		    <div class="col-sm-10">
		        <div class="slidecontainer">
				  <input type="range" min="1" max="5" value="value="<%=hotel_type %>"" class="slider" id="myRange" name="hotel_type">
				  <span id="demo"></span>
				  <span>STAR</span>
				</div>
		    </div>
		  </div>
		  
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label" >Hotel Room Type</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="inputEmail3" value="<%=hotel_room_type %>" name="room_type">
		    </div>
		  </div>	  
		  		  
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">Single Room Price</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control" id="inputEmail3" value="<%=room_price1 %>" name="room_price1">
		    </div>
		  </div>
		  
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">Double Room Price</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control" id="inputEmail3" value="<%=room_price2 %>" name="room_price2">
		    </div>
		  </div>
		  
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">Deluxe Room Price</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control" id="inputEmail3" value="<%=room_price3 %>" name="room_price3">
		    </div>
		  </div>	  
		  
		  <button type="submit" class="btn btn-primary">UPDATE HOTEL</button>
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