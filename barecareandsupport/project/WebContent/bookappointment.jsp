<%@page import="bean.Hospital"%>
<%@page import="dao.HospitalDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking Appointment</title>
<style>
	.form-elements{
		display:block;
	}
	
	.form-elements label{
		width=200px;
	}
	
	.form-elements input{
		width=200px;
	}
	td
	{border:0px;
	}	
</style>
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
			    <li><a style="color:white"href="Controller?page=home">Home</a></li>			    
				<li><a style="color:white" href="tips.jsp">Tips</a></li>
				<li><a style="color:white" href="Controller?page=product">Product</a></li>
				<li><a style="color:white" href="viewnames.jsp">Names</a></li>
				<li><a style="color:blue" href="viewhospital.jsp">Appointment</a></li>								
					<c:choose>
					<c:when test="${session == null}">
						<li><a style="color:white" href="Controller?page=login">Login</a></li>
						<li><a style="color:white" href="Controller?page=sign-up">Sign-up</a></li>
					</c:when>
					<c:when test="${session != null}">
						<li><a  href="Controller?page=logout" style="color: #F24638;">Logout</a></li>
						<li><a style="color:white" href="#">My Account(<c:out value="${username }"></c:out>)</a></li>
					</c:when>
				</c:choose>			
				<li><a style="color:white" href="Controller?page=showcart">cart(<c:out value="${x}"/>)</a></li>				
			</ul>
		</nav>
	</header>
<link rel="stylesheet" href="resources/bootstrap.min.css"/> 
	
	<% 	String hid = request.getParameter("id");
		Hospital h = HospitalDao.getHospital(hid);
	%>
	<form method="GET" action="confirmbooking.jsp">
	
	<table >
	<div class="form-elements">
	  <tr ><td style=border:0px><label for="pname">Parent's Name : </label>
	      </td>
		  <td style=border:0px><input type="text" id="pname" placeholder="Parent's Name" name="pname" required>
		  </td>
	 </tr>	
	</div>
	 <tr ><td style=border:0px> <label for="pcname">Child's Name : </label>
	      </td>
		 <td style=border:0px><input type="text" id="pcname" placeholder="Child's Name" name="pcname" required>
		 </td>
	</tr>
		
		
	<div class="form-elements">
		<tr><td style=border:0px><label for="pcage">Child's Age : </label>
		    </td>
		<td style=border:0px><input type="text" id="pcage" placeholder="Child's Age" name="pcage"  
		  pattern="[0-9]*"  title="Must be a number"required>
		</td>
		</tr>
	</div>
	
	<div class="form-elements">
		<tr><td style=border:0px><label for="pdate"> Choose date : </label>
		    </td>
		<td style=border:0px><input  type="date" id="pdate" placeholder="dd/mm/yyyy" name="pdate" required>
		</td>
		</tr>
	</div>
	<div class="form-elements">
	   <tr><td style=border:0px><label for="preason">Reason : </label>
	       </td>
	 	<td style=border:0px><input type="text" id="pdate" placeholder="Enter your Reason" name="preason" required>
	 	</td>
	 	</tr>
	</div>
	<div class="form-elements">
	    <tr><td style=border:0px><label for="hname">Hospital_Name:</label>
	        </td>
	    <td style=border:0px><input type="text" id="hname" value="<%= h.getName()%>" name="hname" readonly>
	    </td>
	    </tr>
	</div>
	<div class="form-elements">
	    <tr><td style=border:0px><label for="hphone">Hospital_Phone:</label>
	        </td>
		<td style=border:0px><input type="text" id="hphone" value ="<%= h.getPhone()%>" name="hphone" readonly>
		</td>
		</tr>
		
	</div>		
	     <td colspan="2" rowspan="1" align="center" style=border:0px>	
		<button type="submit">_Submit_</button>
		</td>
		
	</table>
	</form>
</body>
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

</html>