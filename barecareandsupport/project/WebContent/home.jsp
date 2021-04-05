<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>

	<header>
		<h1 style="color:white">
			Babycare
		</h1>
		<nav>
			<ul>
			    <li><a style="color:blue"href="Controller?page=home">Home</a></li>
			    
				<li><a style="color:white" href="tips.jsp">Tips</a></li>
				<li><a style="color:white" href="Controller?page=product">Product</a></li>
				<li><a style="color:white" href="viewnames.jsp">Names</a></li>
				<li><a style="color:white" href="viewhospital.jsp">Appointment</a></li>
				
				
				<c:choose>
					<c:when test="${session == null}">
						<li><a style="color:white" href="Controller?page=login">Login</a></li>
						<li><a style="color:white" href="Controller?page=sign-up">Sign-up</a></li>
					</c:when>
					<c:when test="${session != null}">
						<li><a href="Controller?page=logout" style="color: #F24638;">Logout</a></li>
						<li><a style="color:white" href="#">My Account(<c:out value="${username }"></c:out>)</a></li>
					</c:when>
				</c:choose>
				<li><a style="color:white" href="Controller?page=showcart">cart(<c:out value="${x}"/>)</a></li>
			</ul>
		</nav>
	</header>
	<html>		
	
  <link rel="stylesheet" href="resources/bootstrap.min.css"/>
  <style>
     div.box{width:250px;border:1px solid pink;padding:20px;float:left}
  </style>
  
<div style="margin-top:-20px" id="myCarousel" class="carousel slide" data-ride="carousel">    

    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="resources/images/baby1.jpg" alt="baby 1" >
      </div>

      <div class="item">
        <img src="resources/images/baby2.jpg" alt="baby 2" >
      </div>          
      <div class="item">
        <img src="resources/images/baby4.jpg" alt="baby 4" >
      </div>
    </div>    
</div>
<script src="resources/jquery.min.js"></script>
<script src="resources/bootstrap.min.js"></script>

 <style>
 .navbar-inverse{background:linear-gradient(black,gray);border-color:#080808}
 </style>
	
	</html>
	<footer>
		<div class="footer"> Team	      
	    </div>/
	</footer>	
</body>

</html>