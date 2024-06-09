<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

	<link rel="stylesheet" href="./css/login.css" />
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
</head>
<style>
	.custom-btn{
		padding: 10px;
		color: red;
		background-color: white;
		width: 50%;
		display: block;
		margin: auto;
	}
	.custom-btn:hover{
		background-color:green;
		color:white;
	}
	.card{
		margin: auto;
		margin-top:50px;
		margin-bottom:100px;
	}
</style>
<body>
	<div class ="row">
		<div class="card">
<div class="login-box">
	<div class="login-snip">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Login</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
		
		<div class="login-space">
		
			<form action="Login" method="post">
			    <div class="login">
			        <div class="group">
			            <label for="user" class="label">Username</label>
			            <input id="user" name="user" type="text" class="input" placeholder="Enter your username">
			        </div>
			        <div class="group">
			            <label for="pass" class="label">Password</label>
			            <input id="pass" name="pass" type="password" class="input" data-type="password" placeholder="Enter your password">
			        </div>
			        <div class="group">
			            <input id="check" name="check" type="checkbox" class="check" checked>
			            <label for="check"><span class="icon"></span> Keep me Signed in</label>
			        </div>
			        <div class="group">
			            <button class="custom-btn" type="submit" >Sign in</button>
			        </div>
			        <div class="hr"></div>
			        <div class="foot">
			            <a href="#">Forgot Password?</a>
			            
			        </div>
			        <div class="alertaler-danger" role="alert" >
			 			<p class="text-danger">${mess}</p>
					</div>
			    </div>
			   
			</form>
		<form action="SignUp" method="post">
    <div class="sign-up-form">
        <div class="group">
            <label for="user" class="label">Username</label>
            <input id="user" name="user" type="text" class="input" placeholder="Create your Username" required>
        </div>
        <div class="group">
            <label for="pass" class="label">Password</label>
            <input id="pass" name="pass" type="password" class="input" data-type="password" placeholder="Create your password" required>
        </div>
        <div class="group">
            <label for="repass" class="label">Repeat Password</label>
            <input id="repass" name="repass" type="password" class="input" data-type="password" placeholder="Repeat your password" required>
        </div>
        <div class="group">
            <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i>Sign up</button>
        </div>
        <div class="hr"></div>
<div class="foot">
            <label for="tab-1">Already Member?</label>
        </div>
    </div>
</form>

		
		</div>
	</div>
</div>   
</div>

</div>

</body>
</html>