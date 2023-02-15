<%
	String uname = (String)session.getAttribute("uname");
	session.setAttribute(uname, "uname");
	System.out.println(uname);
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="com.connection.SingletonConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Password Change Page</title>
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
		<form action="/cloud9_hrb/change_password" method="post">
			<div class="col-sm-15">
		        <div class="row mb-1">
				    <label for="inputEmail3" class="col-sm-5 col-form-label">ENTER NEW PASSWORD</label>
				    <div class="col-sm-5">
				  <%
				    	try{
					  		String oldPassword = request.getParameter("val");
					  		Connection con = SingletonConnection.getSingletonConnection();
			    			PreparedStatement psmt;	
			    			String query = "SELECT * FROM HRB_ADMIN WHERE ADMIN_PASS=? AND ADMIN_ID=?";
			    			psmt = con.prepareStatement(query);
			    			psmt.setString(1, oldPassword);
			    			psmt.setString(2, uname);
			    			ResultSet rs = psmt.executeQuery();
			    			if(rs.next()){
			    				%>
			    					<input type="hidden" class="form-control" id="inputEmail3" name="uname" value="<%=uname %>" >
			    					<input type="text" class="form-control" id="inputEmail3" name="newPassword" >
			    				<%
			    			}else{
			    				%>
			    					<h4>Enter valid Old Password</h4>
			    				<%
			    				return;
			    			}
					  	}catch(Exception e){
					  		out.println(e);
					  	}
				   %>
				      
				    </div>
				  </div>
		    </div>
		  
		  <button type="submit" class="btn btn-primary">CHANGE PASSWORD</button>
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