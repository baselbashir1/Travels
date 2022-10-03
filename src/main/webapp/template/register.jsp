<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register Page</title>
<link href="login.css" rel="stylesheet">
<link class="jsbin"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<section>
		<div class="imgBx">
			<img src="../images/travel.jpg" style="width:100%;height:100%">
		</div>
		<div class="contentBx">
			<div class="formBx">
				<h2>Register</h2>
				<form action="../RegisterUserServlet" method="post">
				<div class="inputBx">
						<span>Name</span> <input type="text" name="name" placeholder="Enter Name" required>
					</div>
					<div class="inputBx">
						<span>Username</span> <input type="text" name="username" placeholder="Enter Username" required>
					</div>
					<div class="inputBx">
						<span>Email</span> <input type="text" name="email" placeholder="Enter Email" required>
					</div>
					<div class="inputBx">
						<span>Password</span> <input type="password" name="password" placeholder="Enter Password" required>
					</div><br>
					<div class="inputBx">
						<input type="submit" value="Sign up" name="">
					</div>
					<div class="inputBx">
						<p>
							go to login page? <a href="login.html">Sign in</a>
						</p>
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
</html>