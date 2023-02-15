<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Signup</title>
	<link rel="stylesheet" href="../styles/user_signup_style.css">
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>
    <div class="bg-img">
      <div class="content">
        <header>User SignUp</header>
        <form action="/cloud9_hrb/SignupProcessUser" method="post">
          <div class="field space">
            <input type="text" required placeholder="First Name" name="fname" required>
          </div>
          <div class="field space">
            <input type="text" required placeholder="Last Name" name="lname" required>
          </div>
          <div class="field space">
            <input type="email" required placeholder="Email" name="email" required>
          </div>
          <div class="field space">
            <input type="password" class="pass-key" placeholder="Password" name="password" required>
            <span class="show">SHOW</span>
          </div>
          <div class="field space">
            <input type="text" required placeholder="Address" name="addr" required>
          </div>
          <div class="field space">
            <input type="number" required placeholder="ZIP" name="zip" required>
          </div>
          <div class="signup-field space">
            <input type="submit" value="SIGN UP">
          </div>
        </form>
      </div>
    </div>

    <script>
      const pass_field = document.querySelector('.pass-key');
      const showBtn = document.querySelector('.show');
      showBtn.addEventListener('click', function(){
       if(pass_field.type === "password"){
         pass_field.type = "text";
         showBtn.textContent = "HIDE";
         showBtn.style.color = "#3498db";
       }else{
         pass_field.type = "password";
         showBtn.textContent = "SHOW";
         showBtn.style.color = "#222";
       }
      });
    </script>


  </body>
</html>