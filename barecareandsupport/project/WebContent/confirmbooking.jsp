<%@page import="dao.Bookingsdao"%>
<%@page import="bean.Booking"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking confirm</title>
</head>

<img src="resources/images/logo1.jpg" style="float:left;margin-left:5%;height:30%;width:12%">
<img src="resources/images/logo2.png"  style="float:right;margin-right:8%;height:30%;width:12%">

<style>
td
{ color:darkblue;
}
p
{ font-size: 40px;
  color:red;
}
 body
  { background-image:url(resources/images/backgroundlogin.jpg);       
  background-repeat: no-repeat;
  background-size: 1300px 900px;
 background-position:center;
  }
  button{  
	text-align:center;
    color:white;
    background-color:#0074D9;
	font-size:15;
    font-family:serif;
    border-radius:10px;
    height:15%;
    width:15%
}	
</style>
<body>
	<p align="center">Booking Successful !!</p>
	<%	Booking booking = new Booking(); 
		int id = Bookingsdao.getID();
		booking.setId(id);
		booking.setHname(request.getParameter("hname"));
		booking.setPname(request.getParameter("pname"));
		booking.setPcname(request.getParameter("pcname"));
		booking.setPcage(request.getParameter("pcage"));
		booking.setPreason(request.getParameter("preason"));
		booking.setPdate(request.getParameter("pdate"));
		booking.setHphone(request.getParameter("hphone"));
		Bookingsdao.insertBooking(booking);
	%>
		<table align="center">
			<tr>
				<td style="font-size: 30px">Booking ID :</td>
				<td style="font-size: 30px"><%=booking.getId() %></td>
			</tr>
			<tr>
				<td style="font-size: 30px">Name :</td>
				<td style="font-size: 30px"><%=booking.getPname() %></td>
			</tr>
			<tr>
				<td style="font-size: 30px">Child's Name : </td>
				<td style="font-size: 30px"><%=booking.getPcname() %></td>
			</tr>
			<tr>
				<td style="font-size: 30px">Child's Age : </td>
				<td style="font-size: 30px"><%=booking.getPcage() %></td>
			</tr>
			<tr>
				<td style="font-size: 30px">Reason of Visit : </td>
				<td style="font-size: 30px"><%=booking.getPreason() %></td>
			</tr>
			<tr>
				<td style="font-size: 30px">Date : </td>
				<td style="font-size: 30px"><%=booking.getPdate() %></td>
			</tr>
			<tr>
				<td style="font-size: 30px">Hospital Name : </td>
				<td style="font-size: 30px"><%=booking.getHname() %></td>
			</tr>
			<tr>
				<td style="font-size: 30px">Hospital Contact No : </td>
				<td style="font-size: 30px"><%=booking.getHphone() %></td>
			</tr>		
         <tr><td align="center" style="font-size: 30px">
            <button onclick="window.print()" >Print</button>            
		     </td>
  <td><a 
    style="
    color:white;
    background-color:#0074D9;
    border: solid black;
    font-family:serif;
    border-radius:7px;
    text-decoration:none;
    height:20%;
    width:30%"  href="Controller?page=home">Home</a>
    </td>
    
	</tr>
		
		</table>
</body>
</html>