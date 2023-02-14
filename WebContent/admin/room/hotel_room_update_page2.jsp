<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="com.connection.SingletonConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Hotel Room Select Page</title>
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
<section id="#">
<div class="container">
	<div class="jumbotron">
		<form action="./hotel_room_update_page3.jsp" method="post">		  
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">Select Room ID</label>
		    <div class="col-sm-10">
		        <select class="form-select" aria-label="Default select example" name="room_id" >
				  <option selected>-- SELECT --</option>
				  <%
				  	try{
				  		String hotel_id = request.getParameter("val");
				  		Connection con = SingletonConnection.getSingletonConnection();
		    			PreparedStatement psmt;	
		    			String query = "SELECT ROOM_ID FROM HRB_ROOM WHERE HOTEL_ID=?";
		    			psmt = con.prepareStatement(query);
		    			psmt.setString(1, hotel_id);
		    			ResultSet rs = psmt.executeQuery();
		    			while(rs.next()){
		    				%>
		    				<option value="<%=rs.getString("ROOM_ID")%>"><%=rs.getString("ROOM_ID") %></option>
		    				<%
		    			}
				  	}catch(Exception e){
				  		out.println(e);
				  	}
		    			
		    	  %>
				</select>
		    </div>
		  </div>
		  
		  <button type="submit" class="btn btn-primary">GO</button>
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