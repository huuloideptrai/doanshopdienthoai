<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>

</head>
<jsp:include page="head.jsp"></jsp:include>
<body class="signup-body">
		<div class="agile-signup">	
		
			<div class="content2">
				<div class="grids-heading gallery-heading signup-heading">
					<h2>Sign Up</h2>
				</div>
				<form>
					<input type="text" name="Username" value="Username" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}">
					<input type="tel" name="Phone" value="Phone" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Phone';}">
					<input type="email" name="Email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}">
					<input type="password" name="Password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
					<input type="submit" class="register" value="Sign Up">
				</form>
				<a href="index.html">Back To Home</a>
			</div>
			
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
	
</body>
</html>