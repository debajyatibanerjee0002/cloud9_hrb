<%
	String uname = (String)session.getAttribute("uname");
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Welcome Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
    crossorigin="anonymous">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Righteous&display=swap" rel="stylesheet">

<link href="fontawesome/css/fontawesome.css" rel="stylesheet">
<link href="fontawesome/css/brands.css" rel="stylesheet">
<link href="fontawesome/css/solid.css" rel="stylesheet">
<link href="../styles/admin_login_success.css" rel="stylesheet">
<!-- /${pageContext.request.contextPath} -->
</head>
<body>
<section>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	    <a href="#" class="navbar-brand logoText" >
	    	<!-- /<%=request.getContextPath() %> -->
		    <img src="../images/CLOUD9.png" alt="Bootstrap" width="50" height="50">
		    Cloud9
	    </a>
	    <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarMenu">
	        <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarMenu">
	        <span class="navbar-nav ml-auto" style="font-size:1.5rem; font-weight:bold; color:white"><%=uname %></span>
	        <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	            	<!-- /<%=request.getContextPath() %> -->
	                <a href="../logout/logout.jsp" class="nav-link custom-button">LOG OUT</a>
	            </li>
	        </ul>
	    </div>
	</nav>
</section>
<section id="#">
<div class="jumbotron-fluid">
	<div class="container">
		<div class="jumbotron img-jmbo">
			<h1>HOTELS</h1>
			<a href="./hotel/hotel_page.jsp" class="nav-link custom-button1">GO</a>
		</div>
		<div class="jumbotron img-jmbo">
			<h1>RESORTS</h1>
			<a href="./resort/resort_page.jsp" class="nav-link custom-button1">GO</a>
		</div>
	</div>
	<div class="container">
		<div class="jumbotron img-jmbo">
			<h1>ROOMS</h1>
			<a href="#" class="nav-link custom-button1">GO</a>
		</div>
		<div class="jumbotron img-jmbo">
			<h1>BOOKINGS</h1>
			<a href="#" class="nav-link custom-button1">GO</a>
		</div>
	</div>
	<div class="container">
		<div class="jumbotron img-jmbo">
			<h1>CHANGE PASSWORD</h1>
			<a href="#" class="nav-link custom-button1">GO</a>
		</div>
	</div>
</div>
</section>
	
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
</body>
</html>