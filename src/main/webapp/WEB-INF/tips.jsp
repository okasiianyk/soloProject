<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link type="text/css" rel="stylesheet" href="<c:url value="/css/style.css" />" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">L'ours Bakery</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
  
    <div class="navbar-nav mr-auto">
      <a class="nav-link active" href="/options">Home <span class="sr-only">(current)</span></a>
      <a class="nav-link" href="/orders">Order</a>
      <c:choose>
      	<c:when test="${user.userPosition.toString().equals('admin')}">
      		<a class="nav-link" href="/category/new">New Category</a>
      		<a class="nav-link" href="/food/new">New Food</a>
      	</c:when>
      </c:choose>  
      <a class="nav-link" href="/userLogout">Logout</a>
     </div>
     
     <div class="navbar-nav">
     <a class=" nav-link disabled ml-auto" href="/options">${user.name}</a>
 	</div>
 	
  </div>
</nav>

 <div class="container-fluid">
 <div class="container">
<form:form method="POST" action="/tips" modelAttribute="cart">
	<div class="form-group">
	<form:label path="tips">Tips:
	<form:input class="form-control" path="tips"/></form:label>
	<button class="btn primary-btn">ADD</button>
	</div>
</form:form>
</div>
</div>
</body>
</html>