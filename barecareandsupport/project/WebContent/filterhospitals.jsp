<%@page import="bean.Hospital"%>
<%@page import="java.util.List"%>
<%@page import="dao.HospitalDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hospital</title>
<style>
	.hospital-box{
		background-color: #e5e5e5;
		padding: 20px;
		padding-bottom: 30px;
		border-radius = 10%;
		border:1px solid black;
	}
	
	.filters{
		background-color: #f1faee;
		border: 1px solid black;
		padding : 5px;
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
						<li><a style="color:white" href="Controller?page=logout" style="color: #F24638;">Logout</a></li>
						<li><a style="color:white" href="#">My Account(<c:out value="${username }"></c:out>)</a></li>
					</c:when>
				</c:choose>
				<li><a style="color:white" href="Controller?page=showcart">cart(<c:out value="${x}"/>)</a></li>
			</ul>
		</nav>
	</header>
<link rel="stylesheet" href="resources/bootstrap.min.css"/>

<body>
<div class="filters">
		<form action="filterhospitals.jsp">
		    <table>
		    <tr><td> <label for="State">State : </label>
		        </td>
		     <td>
			<select name="state" id="state">
				<option value="ALL"> Select</option>
				<%
				List<String> states = HospitalDao.getStates();
				for(int i = 0; i < states.size(); i++){
					%>
					<option value="<%=states.get(i)%>"><%=states.get(i)%></option>
					<%
				}
				%>
			</select>
			</td>
			</tr>
			<tr><td>
			<label for="religion">Region :</label></td>
			<td>
			<select name="city" id="city">
			<option value="ALL">Select</option>
			<%
				List<String> cities = HospitalDao.getCities();
				for(int i = 0; i < cities.size(); i++){
					%>
					<option value="<%=cities.get(i)%>"><%=cities.get(i)%></option>
					<%
				}
			%>
			</select>
			</td></tr>
			<td colspan="2" align="center">
			<Button> Apply</Button>
			</td>
			
			</table>
		</form>
	</div>
	<div class="hospital-list">
		<%
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		List<Hospital> list= HospitalDao.getRecordsbyFilters(city, state);
		for(int i = 0; i < list.size(); i++){
			%>
				<div class="hospital-box">
						<h3><%out.println(list.get(i).getName()); %></h3>
						<h4><%out.println(list.get(i).getAddress()); %></h4>
						<p><%out.println(list.get(i).getDescription()); %></p>
						<h4><%out.println("Phone :"+list.get(i).getPhone()); %></h4>
					<a href="Controller?page=bookhospital&id=<%=list.get(i).getId()%>"><button>Book</button></a>
				</div>
			<%
		}
		%>
	</div>
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
</body>

</html>