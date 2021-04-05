<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login page</title>
 <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>

<header>
		<h1>
			Babycare
		</h1>
		<nav>
			<ul>
				<li><a style="color:white;font-family:Arial" href="Controller?page=home">Home</a></li>
				<li><a style="color:white;font-family:Arial" href="tips.jsp">Tips</a></li>
				<li><a style="color:white;font-family:Arial" href="Controller?page=product">Product</a></li>
				<li><a style="color:white;font-family:Arial" href="viewnames.jsp">Names</a></li>
				<li><a style="color:white;font-family:Arial" href="viewhospital.jsp">Appointment</a></li>
				<c:choose>
					<c:when test="${session == null}">
						<li><a style="color:blue;font-family:Arial"" href="Controller?page=login">Login</a></li>
						<li><a style="color:white;font-family:Arial" href="Controller?page=sign-up">Sign-up</a></li>
					</c:when>
					<c:when test="${session != null}">
						<li><a style="color:white;font-family:Arial" href="Controller?page=logout" style="color: #F24638;">Logout</a></li>
						<li><a style="color:white;font-family:Arial" href="#">My Account</a></li>
					</c:when>
				</c:choose>
				<li><a style="color:white;font-family:Arial" href="Controller?page=showcart">cart(<c:out value="${x}"/>)</a></li>
			</ul>
		</nav>
	</header>

	<div class="signup-header">
	 	<h2>Login to <mark>Babycare</mark></h2>
	</div>

	 <form method="post" action="Controller">
	 
	 <input type="hidden" name="page" value="login-form">
	 
	 	<!-- Validations errors -->
	 	<font color="#F24638"><c:out value="${msg }"></c:out></font>
	 
	 	<div class="signup-group">
	 		<label>Username</label>
	 		<input type="text" name="username" placeholder="Your Username" value="<c:out value="${username }"></c:out>">
	 	</div>
	 	<div class="signup-group">
	 		<label>Password</label>
	 		<input type="password" name="password" placeholder="Enter password">
	 	</div>
	 	<div class="signup-group">
	 		<button type="submit" name="login" class="signup-btn">Log in</button>
	 	</div>
	 	<p>
	 		New to babycare? <a href="Controller?page=sign-up" style="color:#F24638;">Create Account</a>
	 	</p>
	 </form>
	<br><br><br>
	<footer style="position: fixed;bottom: 0;left: 0;width: 100%;">
		<div class="footer"> Team
	      <a href="Controller?page=index"> </a>
	    </div>
	</footer>


</body>
</html>