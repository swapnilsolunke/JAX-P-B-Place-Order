<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bulk Order System Home</title>
<link rel="shortcut icon" href="resourcess/img/logo.png">
<link rel="stylesheet" href="resourcess/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="resourcess/js/jquery.min.1.11.1.js"></script>
<script src="resourcess/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<style type="text/css">
	.invoiceHeading{
			background: rgba(241, 243, 242, 0.55);
		    border: 1px solid rgba(74, 84, 94, 0.08);
		    border-radius:8px;
		    -webkit-border-radius:8px;
		    -moz-border-radius:8px;
		    box-shadow: 5px 5px 22px -2px rgba(0, 0, 0, 0.7);
		    -webkit-box-shadow: 5px 5px 22px -2px rgba(0, 0, 0, 0.7);
		    -moz-box-shadow: 5px 5px 22px -2px rgba(0, 0, 0, 0.7);
		    margin-bottom:20px;
		    padding: 15px 26px;
		}
		
</style>
</head>
<body style="background-image: url('resourcess/img/bg_lea1.png');">
<jsp:include page="loggedHeader.jsp"></jsp:include>
	<div class="container">
		<h2 class="invoiceHeading">
		<%
		if(session!=null){  
	        String name=(String)session.getAttribute("fname");  
	          
	        out.print("Wlcome "+name);  
	        }  
	        else{  
	            response.sendRedirect("login.htm");
	        }  
		%>
		
		</h2>
	</div>
</body>
</html>