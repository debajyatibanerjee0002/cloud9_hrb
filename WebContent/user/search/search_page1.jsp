<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" import="java.util.ArrayList"  %>
<%@ page import="user.search.searchClass.HotelSearchResult"%>  
<%@ page import="user.search.searchClass.ResortSearchResult"%>
<%
	String type = (String)session.getAttribute("type");
	ArrayList<HotelSearchResult> rs1 = (ArrayList<HotelSearchResult>) session.getAttribute("hotelSearchResult");
	ArrayList<ResortSearchResult> rs2 = (ArrayList<ResortSearchResult>) session.getAttribute("resortSearchResult");
	if(type.equals("HOTEL")){
		session.setAttribute("hotelSearchResult", rs1);
	}else{
		session.setAttribute("resortSearchResult", rs2);
	}
	
	
	String uname = (String)session.getAttribute("uname");
	String name = (String)session.getAttribute("name");
	String from_date = (String)session.getAttribute("from_date");
	String to_date = (String)session.getAttribute("to_date");
	session.setAttribute("from_date", from_date);
	session.setAttribute("to_date", to_date);
	int size = (int)session.getAttribute("size");
	session.setAttribute("uname", uname);
	session.setAttribute("name", name);
	System.out.println("search_page1 - "+name+" "+size+" "+from_date+" "+to_date+" "+type);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Search Page</title>
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
	        <span class="navbar-nav ml-auto" style="font-size:1.5rem; font-weight:bold; color:white">HOTEL SEARCH RESULT</span>
	        <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	                <a href="../user_login_success.jsp" class="nav-link custom-button2">Back</a>
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
	  	<table class="table table-dark">
		  <thead>
		    <tr>
		      <th scope="col">HOTEL_NAME</th>
		      <th scope="col">RATING</th>
		      <th scope="col">LOCATION</th>
		      <th scope="col">ROOMS</th>
		      <th scope="col">SI-ROOM PRICE</th>
		      <th scope="col">DO-ROOM PRICE</th>
		      <th scope="col">SE-ROOM PRICE</th>
		    </tr>
		  </thead>
		  <tbody>
		    <%
		    if(size>0){
		    	for(HotelSearchResult it: rs1)
			  {
			  %>
			    <tr>
			      <td><%=it.getHotel_name() %></td>
			      <td><%=it.getHotel_type() %></td>
			      <td><%=it.getAddr() %></td>
			      <td><%=it.getHotel_room_type() %></td>
			      <td><%=it.getSingle_room_price() %></td>
			      <td><%=it.getDouble_room_price() %></td>
			      <td><%=it.getDeluxe_room_price() %></td>
			      <td><a href="./search_page2.jsp?val=<%=it.getHotel_id() %>&val2=<%=type %>" class="btn btn-success btn-cus">GO</a></td>
			    </tr>
			   <%
			  }
		    }
		    else{
		    	%>
		    	  <tr><h2>SORRY NO DATA FOUND</h2></tr>
		    	<%
		    }
			%>
		  </tbody>
		</table>
	  <%
	  	}else{
	  %>
	  		<table class="table table-dark">
		  <thead>
		    <tr>
		      <th scope="col">RESORT_NAME</th>
		      <th scope="col">RATING</th>
		      <th scope="col">LOCATION</th>
		      <th scope="col">ROOMS</th>
		      <th scope="col">PRICE</th>
		      <th scope="col">AVAILABLE</th>
		    </tr>
		  </thead>
		  <tbody>
		    <%
		    if(size>0){
			  for(ResortSearchResult it: rs2)
			  {
			  %>
			    <tr>
			      <td><%=it.getResort_name() %></td>
			      <td><%=it.getResort_type() %></td>
			      <td><%=it.getAddr() %></td>
			      <td><%=it.getTotal_rooms() %></td>			      
			      <td><%=it.getResort_price() %></td>
			      <td><%=it.getAvailable() %></td>
			      <td><a href="../booking/booking_entry_page.jsp?val=<%=it.getResort_id() %>&val2=<%=type %>" class="btn btn-success btn-cus">GO</a></td>
			    </tr>
			   <%
			  }
		    }
		    else{
		    	%>
		    	  <tr><h2>SORRY NO DATA FOUND</h2></tr>
		    	<%
		    }
			%>
		  </tbody>
		</table>
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
		var output = document.getElementById("demo");
		output.innerHTML = slider.value; // Display the default slider value
	
		// Update the current slider value (each time you drag the slider handle)
		slider.oninput = function() {
		  output.innerHTML = this.value;
		}
	</script>
    
</body>
</html>