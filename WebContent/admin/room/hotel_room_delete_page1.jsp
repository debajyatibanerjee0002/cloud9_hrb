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
<script>
	var request;
	function sendinfo()
	{
		var v=document.vinform.hotel_id.value;
		var url="./hotel_room_delete_page2.jsp?val="+v;
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
	        <span class="navbar-nav ml-auto" style="font-size:1.5rem; font-weight:bold; color:white">HOTEL ID SELECT</span>
	        <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	                <a href="./room_page.jsp" class="nav-link custom-button2">Back</a>
	            </li>
	        </ul>
	    </div>
	</nav>
</section>
<section id="#">
<div class="container">
	<div class="jumbotron">
		<form name="vinform" method="post">		  
		  <div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">Select Hotel ID</label>
		    <div class="col-sm-10">
		        <select class="form-select" aria-label="Default select example" name="hotel_id" onchange="sendinfo()">
				  <option selected>-- SELECT --</option>
				  <%
				  	try{
				  		Connection con = SingletonConnection.getSingletonConnection();
		    			PreparedStatement psmt;	
		    			String query = "SELECT HOTEL_ID FROM HRB_HOTEL";
		    			psmt = con.prepareStatement(query);
		    			ResultSet rs = psmt.executeQuery();
		    			while(rs.next()){
		    				%>
		    				<option value="<%=rs.getString("hotel_id")%>"><%=rs.getString("hotel_id") %></option>
		    				<%
		    			}
				  	}catch(Exception e){
				  		out.println(e);
				  	}
		    			
		    	  %>
				</select>
		    </div>
		  </div>
		  <!--  <button type="button" class="btn btn-primary" onClick="sendinfo()">GO</button> -->
		</form>	
	</div>
</div>
<span id="demo"></span>
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