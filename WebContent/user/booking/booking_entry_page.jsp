<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" import="com.connection.SingletonConnection"%>
<%
	String type = request.getParameter("val2");

	String uname = (String)session.getAttribute("uname");
	String name = (String)session.getAttribute("name");
	String from_date = (String)session.getAttribute("from_date");
	String to_date = (String)session.getAttribute("to_date");
	session.setAttribute("from_date", from_date);
	session.setAttribute("to_date", to_date);
	session.setAttribute("uname", uname);
	session.setAttribute("name", name);
	
	// for hotel
	String room_id = "";
	String room_type = "";
	String hotel_id = "";
	String hotel_name = "";
	int max_capacity = 1;
	double room_price = 0.0;
	
	//for resort
	String resort_id = "";
	String resort_name = "";
	int resort_type = 1;
	String addr = "";
	int total_rooms = 0;
	int no_of_guests = 0;
	double resort_price = 0.0;
	String available = "";
	
	if(type.equals("HOTEL")){
		room_id = request.getParameter("val");
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
	}else{
		resort_id = request.getParameter("val");
		try{
	  		Connection con = SingletonConnection.getSingletonConnection();
			PreparedStatement psmt;	
			String query = "SELECT * FROM HRB_RESORT WHERE RESORT_ID=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, resort_id);
			ResultSet rs = psmt.executeQuery();
			if(rs.next()){
				resort_name = rs.getString("RESORT_NAME");
				resort_type = rs.getInt("RESORT_TYPE");
				addr = rs.getString("ADDR");
				total_rooms = rs.getInt("TOTAL_ROOMS");
				resort_price = rs.getDouble("RESORT_PRICE");
				available = rs.getString("AVAILABLE");
			}
			no_of_guests = total_rooms*3;
			con.close();
	  	}catch(Exception e){
	  		out.println(e);
	  	}
	}
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
		<%
			if(type.equals("HOTEL")){
		%>
				<form action="./booking_entry_review_page.jsp" method="POST">
					<input type="hidden" class="form-control" id="inputEmail3" value="<%=type %>" name="type" required>
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
					    <input type="date" class="form-control" id="floatingInput" value="<%=from_date %>" name="from_date" required>
					  </div>
					</div>
					<div class="row mb-3">
					  <label for="floatingInput" class="col-sm-2 col-form-label">To Date</label>
					  <div class="col-sm-10">
					    <input type="date" class="form-control" id="floatingInput" value="<%=to_date %>" name="to_date" required>
					  </div>
					</div>	
					<div class="row mb-3">
					  <label for="inputEmail3" class="col-sm-2 col-form-label">No. of Nights</label>
					  <div class="col-sm-10">
					    <input type="number" class="form-control" name="no_of_nights" required>
					  </div>
					</div>
					<button type="submit" class="btn btn-primary">GO TO REVIEW</button>
				</form>
		<%				
			}else{
		%>
				<form action="./booking_entry_review_page.jsp" method="POST">
					<input type="hidden" class="form-control" id="inputEmail3" value="<%=type %>" name="type" required>
					<input type="hidden" class="form-control" id="inputEmail3" value="<%=resort_id %>" name="resort_id" required>
					<input type="hidden" class="form-control" id="inputEmail3" value="<%=resort_price %>" name="resort_price" required>
					<input type="hidden" class="form-control" id="inputEmail3" value="<%=addr %>" name="addr" required>
					<div class="row mb-3">
					  <label for="inputEmail3" class="col-sm-2 col-form-label">Resort Name</label>
					  <div class="col-sm-10">
					    <input type="text" class="form-control" id="inputEmail3" name="resort_name" value="<%=resort_name.toUpperCase() %>" readonly>
					  </div>
					</div>
					<div class="row mb-3">
					  <label for="inputEmail3" class="col-sm-2 col-form-label">User Id</label>
					  <div class="col-sm-10">
					    <input type="text" class="form-control" id="inputEmail3" name="user_id" value="<%=uname %>" readonly>
					  </div>
					</div>
					<div class="row mb-3">
					  <label for="inputEmail3" class="col-sm-2 col-form-label" >Ratings</label>
					  <div class="col-sm-10">
					    <input type="text" class="form-control" id="inputEmail3" name="resort_type" value="<%=resort_type %>" readonly>
					  </div>
					</div>
					<div class="row mb-3">
					  <label for="inputEmail3" class="col-sm-2 col-form-label">Total Rooms</label>
					  <div class="col-sm-10">
					    <input type="number" class="form-control" id="inputEmail3" name="total_rooms" value="<%=total_rooms %>" readonly>
					  </div>
					</div>
					<div class="row mb-3">
					  <label for="inputEmail3" class="col-sm-2 col-form-label">Resort Price</label>
					  <div class="col-sm-10">
					    <input type="number" class="form-control" id="inputEmail3" name="resort_price" value="<%=resort_price %>" readonly>
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
					  <input type="range" min="1" max="<%=no_of_guests %>" value="1" class="slider" id="myRange" name="no_of_guests" required>
					  <span id="number"></span>
					</div>
					  </div>
					</div>
					
					<div class="row mb-3">
					  <label for="floatingInput" class="col-sm-2 col-form-label">From Date</label>
					  <div class="col-sm-10">
					    <input type="date" class="form-control" id="floatingInput" value="<%=from_date %>" name="from_date" required>
					  </div>
					</div>
					<div class="row mb-3">
					  <label for="floatingInput" class="col-sm-2 col-form-label">To Date</label>
					  <div class="col-sm-10">
					    <input type="date" class="form-control" id="floatingInput" value="<%=to_date %>" name="to_date" required>
					  </div>
					</div>	
					<div class="row mb-3">
					  <label for="inputEmail3" class="col-sm-2 col-form-label">No. of Days</label>
					  <div class="col-sm-10">
					    <input type="number" class="form-control" name="no_of_nights" required>
					  </div>
					</div>
					<button type="submit" class="btn btn-primary">GO TO REVIEW</button>
				</form>
		
		<%			
				
			}
		%>
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