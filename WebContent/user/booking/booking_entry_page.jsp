<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" import="user.search.searchClass.HotelSearchResult" %> 
<%@ page import="java.sql.*" import="com.connection.SingletonConnection"%>
<%
	String uname = (String)session.getAttribute("uname");
	String name = (String)session.getAttribute("name");
	session.setAttribute("uname", uname);
	session.setAttribute("name", name);
	String room_id = request.getParameter("val");
	String room_type = "";
	String hotel_id = "";
	String hotel_name = "";
	int max_capacity = 1;
	double room_price = 0.0;
	
	try{
  		Connection con = SingletonConnection.getSingletonConnection();
		PreparedStatement psmt;	
		String query = "SELECT * FROM HRB_ROOM WHERE ROOM_ID=?";
		psmt = con.prepareStatement(query);
		psmt.setString(1, room_id);
		ResultSet rs = psmt.executeQuery();
		if(rs.next()){
			room_type = rs.getString("ROOM_TYPE");
			hotel_id = rs.getString("HOTEL_ID");
		}
		// Second query to get price from HRB_HOTEL table
		double single_room_price = 0.0;
		double double_room_price = 0.0;
		double deluxe_room_price = 0.0;
		query = "SELECT * FROM HRB_HOTEL WHERE HOTEL_ID=?";
		psmt = con.prepareStatement(query);
		psmt.setString(1, hotel_id);
		rs = psmt.executeQuery();
		if(rs.next()){
			single_room_price = Double.valueOf(rs.getDouble("SINGLE_ROOM_PRICE"));
			double_room_price = Double.valueOf(rs.getDouble("DOUBLE_ROOM_PRICE"));
			deluxe_room_price = Double.valueOf(rs.getDouble("DELUXE_ROOM_PRICE"));
			hotel_name = rs.getString("HOTEL_NAME");
		}
		if(room_type.equals("single")){
			room_price = single_room_price;
			max_capacity = 2;
		}
		else if(room_type.equals("double")){
			room_price = double_room_price;
			max_capacity = 3;
		}
		else if(room_type.equals("deluxe")){
			room_price = deluxe_room_price;
			max_capacity = 4;
		}
		con.close();
  	}catch(Exception e){
  		out.println(e);
  	}
	System.out.println("booking page - "+name+" "+room_id+" "+room_type+" "+hotel_id+" "+room_price);
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
<script>
	var request;
	function sendinfo()
	{
		alert("inside sendinfo()");
		double v=room_price;
		int u=document.vinform.no_of_nights.value;
		var url="./booking_price_cal_page.jsp?val1="+v+"&val2="+u;
		// To get the browser Info
		if(window.XMLHttpRequest)
		{
			request = new XMLHttpRequest();
		}
		else if(window.ActiveXObject)
		{
			request = new ActiveXObject("MicrosoftXMLHTTP");
		}
		try
		{
			request.onreadystatechange = getinfo; // 3
			request.open("GET", url, true); // 1
			request.send(); // 2
		}
		catch(e)
		{
			alert("Unable to connect the server");
		}
		
		function getinfo()
		{
			if(request.readyState==4 && this.status == 200)
			{
				var val = request.responseText;
				document.getElementById("demo").innerHTML = val;
			}
		}
	}
</script>
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
	        <span class="navbar-nav ml-auto" style="font-size:1.5rem; font-weight:bold; color:white">BOOKING ENTRY</span>
	        <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	                <a href="../search/search_page1.jsp" class="nav-link custom-button2">Back</a>
	            </li>
	        </ul>
	    </div>
	</nav>
</section>
<section id="#">
<div class="container">
	<div class="jumbotron">
		<form  name="vinform">
		<input type="hidden" class="form-control" id="inputEmail3" value="<%=hotel_id %>" name="hotel_id" required>
		<input type="hidden" class="form-control" id="inputEmail3" value="<%=room_id %>" name="room_id" required>
		<input type="hidden" class="form-control" id="inputEmail3" value="<%=room_price %>" name="room_price" required>
			<div class="row mb-3">
			  <label for="inputEmail3" class="col-sm-2 col-form-label">Hotel Name</label>
			  <div class="col-sm-10">
			    <input type="text" class="form-control" id="inputEmail3" name="hotel_name" value="<%=hotel_name.toUpperCase() %>" readonly>
			  </div>
			</div>
			<div class="row mb-3">
			  <label for="inputEmail3" class="col-sm-2 col-form-label">User Id</label>
			  <div class="col-sm-10">
			    <input type="text" class="form-control" id="inputEmail3" name="user_id" value="<%=uname %>" readonly>
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
			    <input type="text" class="form-control" id="inputEmail3" name="user_name" value="<%=name %>" readonly>
			  </div>
			</div>  
			<div class="row mb-3">
			  <label for="inputEmail3" class="col-sm-2 col-form-label">Age</label>
			  <div class="col-sm-10">
			    <input type="number" class="form-control" id="inputEmail3" name="age" required>
			  </div>
			</div>  		  
			<div class="row mb-3">
			  <label for="inputEmail3" class="col-sm-2 col-form-label">No. of Guests</label>
			  <div class="col-sm-10">
			      <div class="slidecontainer">
			  <input type="range" min="1" max="<%=max_capacity %>" value="1" class="slider" id="myRange" name="no_of_guests" required>
			  <span id="number"></span>
			</div>
			  </div>
			</div>
			<div class="row mb-3">
			  <label for="inputEmail3" class="col-sm-2 col-form-label">Name of Guests</label>
			  <div class="col-sm-10">
			    <input type="text" class="form-control" id="inputEmail3" name="name_of_guests" required>
			  </div>
			</div>
			
			<div class="row mb-3">
			  <label for="floatingInput" class="col-sm-2 col-form-label">From Date</label>
			  <div class="col-sm-10">
			    <input type="date" class="form-control" id="floatingInput" name="from_date" required>
			  </div>
			</div>
			<div class="row mb-3">
			  <label for="floatingInput" class="col-sm-2 col-form-label">To Date</label>
			  <div class="col-sm-10">
			    <input type="date" class="form-control" id="floatingInput" name="to_date" required>
			  </div>
			</div>	
			<div class="row mb-3">
			  <label for="inputEmail3" class="col-sm-2 col-form-label">No. of Nights</label>
			  <div class="col-sm-10">
			    <input type="number" class="form-control" name="no_of_nights" onChange="sendinfo">
			  </div>
			</div>  	  
			
			<button type="submit" class="btn btn-primary">GO TO REVIEW</button>
		</form>	
		<span id="demo"></span>
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