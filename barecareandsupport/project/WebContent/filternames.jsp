<%@page import="dao.NamesDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Name"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Names</title>
<style>
	.names-box{
		background-color: #e5e5e5;
		padding: 20px;
		padding-bottom: 30px;
		border-radius =10%;
		border:1px solid black;
	}
	
	.filters{
		background-color: #f1faee;
		border: 1px solid black;
	}
	
</style>
<script>
	function printFiltered()
    {
		var gender=document.getElementsByName('gender');
		var mustInclude = document.getElementsByName('must-include');
		var religion = document.getElementsByName('religion');
		//var selectedItems=gender+"_"+religion+"_"+mustInclude;
        var ob=new XMLHttpRequest();
        ob.onreadystatechange=function ss()
        {
	        if(ob.readyState==4)
	        {
	        	var str=ob.responseText;
	        	document.getElementById("names").innerHTML=str;
        	}
        }
        ob.open("GET","FilterNames?msg="+mustInclude,true);
        ob.send();
	}			
</script>
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
				<li><a style="color:blue" href="viewnames.jsp">Names</a></li>
				<li><a style="color:white" href="viewhospital.jsp">Appointment</a></li>								
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
		<form action="filternames.jsp">
		    <table> <tr><td><label for="gender">Gender : </label>
			            </td>			
			            <td><select name="gender" id="gender">
			                     <option value="ALL">Select</option>
				                 <option value="MALE">MALE</option>
				                 <option value="FEMALE">FEMALE</option>
			                </select>
			           </td>
        		   </tr>					
			     <tr><td><label for="religion">Religion : </label>
			         </td>
			         <td><select name="religion" id="religion">
			                  <option value="ALL">Select</option>
				              <option value="HINDU">HINDU</option>
				              <option value="MUSLIM">MUSLIM</option>
				              <option value="CHRISTIAN">CHRISTIAN</option>
			            </select>
			        </td>
			    </tr>		
			    <tr><td> <label for="must-include">Must Include: </label>
			       </td>
			        <td><input type="text" name="must-include" id="must-include">
			       </td>
			    </tr>			
			    <td colspan="2" align="center">
			      <Button onclick='printFiltered()'>   Apply  </Button>			  
			  </td>
			</table>			
		</form>
	</div>
  
<div class="names-list" id="names">
		<%  String gender=request.getParameter("gender");
		    String religion=request.getParameter("religion");
			String mustInclude = request.getParameter("must-include");
			
			//System.out.println(gender+" "+religion+" "+mustInclude);
			
			List<Name> list;					
		    list = NamesDao.getNames(gender,religion,mustInclude);			
			for(int i = 0; i < list.size(); i++){
				%>
				<div class="names-box">
					<h3>Name : <% out.println(list.get(i).getName()); %></h3>
					<h4>Meaning : <%out.println(list.get(i).getMeaning()); %></h4>
					<p>Gender : <%out.println(list.get(i).getGender()); %></p>
					<p>Religion : <%out.println(list.get(i).getReligion());%></p>	
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