<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link type="text/css" rel="stylesheet" href="<c:url value="/css/indexCss.css" />" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>
<body>
<div class="fullscreen-bg">
    <div class="overlay">
    <div>
	<div id="left">
	  	<h3>Register</h3>
		<form:form class="col-12" action="/registration" method="post" modelAttribute="user">
			<div>
		   <form:errors path="name"/>
	       <form:label path="name">Name:</form:label>
	       <form:input  path="name"/>
	       </div>
	       <div>
	       <form:errors path="email"/>
	       <form:label path="email">Email:</form:label>
	       <form:input type="email" path="email"/>
	   		</div>
	   		<div>
	   		<form:errors path="password"/>
	       <form:label path="password">Password:</form:label>
	       <form:input type="password" path="password"/>
	   		</div>
	   		<div>
	   		<form:errors path="confPassword"/>
	       <form:label path="confPassword">Password Conf:</form:label>
	       <form:input type="confPassword"  path="confPassword"/>
	       </div>
	       <div class="obtn">
	       <input class="btn" type="submit" value="Register"/>
	       </div>
		</form:form>
	</div>
	
	<div id="right">
		<h3>Login</h3>
		<c:out value="${loginError}"/>
		<form method="POST" action="/userLogin">
			<div>
		   	<label>Email:</label>
		   	<input type="email" name="loginEmail">
		   	</div>
		   	<div>
		   	<label>Password:</label>
		   	<input type="password" name="loginPassword">
		  	</div>
		  	<div class="obtn">
		    <input class="btn" type="submit" value="Login"/>
		    </div>
		</form>
	</div>
	</div>
</div>
    <video loop="" muted="" autoplay="" poster="<c:url value="video/c1.mp4" />" class="fullscreen-bg__video">
        <source src="<c:url value="video/c1.mp4" />" type="video/mp4">
    </video>
</div>
</body>
</html>