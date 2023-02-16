<%
	String room_id = (String)session.getAttribute("room_id");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" import="com.connection.SingletonConnection"%>
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
<style type="text/css">
.jumbotron {
    margin-left: 0px;
}
</style>
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
	        <span class="navbar-nav ml-auto" style="font-size:1.5rem; font-weight:bold; color:white">ALL BOOKINGS</span>
	        <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	                <a href="../admin_login_success.jsp" class="nav-link custom-button2">Back</a>
	            </li>
	        </ul>
	    </div>
	</nav>
</section>
<section id="#">
<div class="">
	<div class="jumbotron">
	  <table class="table table-dark">
		  <thead>
		    <tr>
		      <th scope="col">BILL NO</th>
		      <th scope="col">H/R NAME</th>
		      <th scope="col">USER ID</th>
		      <th scope="col">NAME</th>
		      <th scope="col">AGE</th>
		      <th scope="col">ROOM TYPE</th>
		      <th scope="col">NO OF GUESTS</th>
		      <th scope="col">GUESTS NAME</th>
		      <th scope="col">CHECK IN DATE</th>
		      <th scope="col">CHECK OUT DATE</th>
		      <th scope="col">NO OF NIGHTS</th>
		      <th scope="col">TOTAL AMOUNT</th>
		    </tr>
		  </thead>
		  <tbody>
		  		<%
				  	try{
				  		Connection con = SingletonConnection.getSingletonConnection();
		    			PreparedStatement psmt;	
		    			String user = "admin";
		    			String avail = "yes";
		    			String query = "SELECT * FROM HRB_BOOKING";
		    			psmt = con.prepareStatement(query);
		    			ResultSet rs = psmt.executeQuery();
		    			while(rs.next()){
		    				String s = rs.getString("BILL_NO");
		    				String hr_type = rs.getString("TYPE");
		    				if(hr_type.equals("HOTEL")){
		    					s = s.substring(5);
		    				}else{
		    					s = s.substring(0, 6);
		    				}		 
		    				System.out.println(s);
		    				%>
		    				<tr>
						      <td><%=rs.getString("BILL_NO") %></td>
						      <td><%=rs.getString("HOTEL_RESORT_NAME") %></td>
						      <td><%=rs.getString("USER_ID") %></td>
						      <td><%=rs.getString("USER_NAME") %></td>
						      <td><%=rs.getString("AGE") %></td>
						      <td><%=rs.getString("TYPE_OF_ROOM") %></td>
						      <td><%=rs.getString("NO_OF_GUEST") %></td>
						      <td><%=rs.getString("GUEST_NAME") %></td>
						      <td><%=rs.getString("CHECK_IN_DATE") %></td>
						      <td><%=rs.getString("CHECK_OUT_DATE") %></td>
						      <td><%=rs.getString("NO_OF_NIGHT") %></td>
						      <td><%=rs.getString("TOTAL_AMOUNT") %></td>
						      <td><a href="/cloud9_hrb/BookingDelete?val=<%=s %>&val2=<%=user %>&val3=<%=rs.getString("BILL_NO") %>&val4=<%=hr_type %>" class="btn btn-danger btn-cus">DELETE</a></td>
						    </tr>
		    				<%
		    			}
				  	}catch(Exception e){
				  		out.println(e);
				  	}
		    			
		    	  %>
		  </tbody>
		</table>
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