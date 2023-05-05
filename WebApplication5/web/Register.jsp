<%-- 
    Document   : Register
    Created on : May 2, 2023, 1:51:28 PM
    Author     : phu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="WEB-INF/../RegisteringCssPagge.css" >

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script type="text/javascript">
    function validate() {
        var username = document.myform.username.value;
        var gmail = document.myform.email.value;
        var password = document.myform.password.value;
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        const maxLength = 20;
        const minLength = 8;
        const uppercaseRegex = /[A-Z]/;
        const specialCharRegex = /[!@#$%^&*(),.?":{}|<>]/;

        if (username === "") {
            document.getElementById("error_username").innerHTML = "-Username cannot be null";
            document.myform.username.className = "unable";
        } else if (username.length > maxLength) {
            document.getElementById("error_username").innerHTML = "-Username can not over 20 digits!";
            document.myform.username.className = "unable";
        } else {
            document.getElementById("error_username").innerHTML = "";
            document.myform.username.className = "enable";
        }

        if (gmail === "") {
            document.getElementById("error_email").innerHTML = "-Email cannot be null";
            document.myform.email.className = "unable";
        } else if (!emailRegex.test(gmail)) {
            document.getElementById("error_email").innerHTML = "-Invalid email address";
            document.myform.email.className = "unable";
        } else {
            document.getElementById("error_email").innerHTML = "";
            document.myform.email.className = "enable";
        }

        if (password === "") {
            document.getElementById("error_pass").innerHTML = "-password cannot be null";
            document.myform.password.className = "unable";
        } else if (password.length < minLength) {
            document.getElementById("error_pass").innerHTML = "-the password must contain at least 8 characters";
            document.myform.password.className = "unable";
        } else if (!uppercaseRegex.test(password) || !specialCharRegex.test(password)) {
            document.getElementById("error_pass").innerHTML = "-password must including uppercase letters and special characters!";
            document.myform.password.className = "unable";
        } else {
            document.getElementById("error_pass").innerHTML = " ";
            document.myform.password.className = "enable";
        }

        var gmail_able = document.myform.email.className;
        var user_able = document.myform.username.className;
        var pass_able = document.myform.password.className;

        if (gmail_able === "enable" && user_able === "enable" && pass_able === "enable") {
            const button = document.querySelector('.Registeringbutton');
            button.disabled = false;
        }
    }
</script>
    <body>
        
        <form action="registering" method="post" name="myform" >
        <div class="register_box">
            <h2>Create an account.</h2>
            <div  class="gmail_box">
                <div class="email_error_box" >
                <h4>Email</h4>
                <p class="error" id="error_email" ></p>
                </div>
                <input class="unable" type="email" name="email" placeholder="Input email" onkeyup="validate()">
            </div>
            
            <div class="user_name_box">
                <div class="username_error_box" >
                <h4>username</h4>
                <p class="error" id="error_username" ></p>
                </div>
                <input class="unable" type="text" name="username" placeholder="Input username" onkeyup="validate()">
            </div>
            
            <div class="password_box">
                <div class="password_error_box" >
                <h4>password</h4>
                <p class="error" id="error_pass" ></p>
                </div>
                <input class="unable" type="password" name="password" placeholder="Input password" onkeyup="validate()">
            </div>
            
            <input class="Registeringbutton" type="submit" value="Register" disabled  >           
        </div>
    </form>
</body>
</html>
