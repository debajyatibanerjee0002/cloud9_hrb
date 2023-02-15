<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Login</title>
	<link rel="stylesheet" href="../styles/admin_login_style.css">
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>
    <div class="bg-img">
      <div class="content">
        <header>User Login</header>
        <form action="/cloud9_hrb//LoginProcessUser">
          <div class="field">
            <span class="fa fa-user"></span>
            <input type="email" required placeholder="Email" name="email" required>
          </div>
          <div class="field space">
            <span class="fa fa-lock"></span>
            <input type="password" class="pass-key" placeholder="Password" name="pass" required>
            <span class="show">SHOW</span>
          </div>
          <div class="pass">
            <a href="#">Forgot Password?</a>
          </div>
          <div class="signup-field">
            <input type="submit" value="LOGIN">
          </div>
        </form>
        <div class="signup">Don't have account?
          <a href="./user_signup.jsp">Signup Now</a>
        </div>
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