<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Category</title>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/menu.css" />" />
<link type="text/css" rel="stylesheet" href="<c:url value="/css/newCategory.css" />" />
</head>
<body>
<div class="nav_a" >
<div class="nav">
	
	<a class="logo" href="#">L'ours Bakery</a>
	<a class="active" href="/options">Home <span class="sr-only">(current)</span></a>
         <c:choose>
      	<c:when test="${!currentFoodsInOrder.isEmpty()}">
      		<a class="" href="/orders">Order (${currentFoodsInOrder.size()})</a>
      	</c:when>
      	<c:otherwise>
      	<a class="disabled" href="/orders">Order</a>
      	</c:otherwise>
      </c:choose>  
      <c:choose>
      	<c:when test="${user.userPosition.toString().equals('admin')}">
      		<a class="" href="/category/new">New Category</a>
      		<a class="" href="/food/new">New Food</a>
      	</c:when>
      </c:choose>  
      <a class="" href="/userLogout">Logout</a>

     <a class="disabled logo" href="/options">${user.name}</a>
</div>
</div>
  
 <!-- ---------------------------------------------- -->   
 
 <div class="container-fluid">
	<div class="container">

		<form:form action="/category/new" method="post" modelAttribute="category">
				<h1>Create a new category</h1>
				<select class="form-control" name="nameCategory">
			   		<option value="Cakes">Cakes</option>
			  	  	<option value="Macaroons">Macaroons</option>
				</select>
				<br/>
				<input class="btn primary-btn" type="submit" value="Create"/>
			
		</form:form>
 	</div>
 </div>
 
 <div class="background">
 	<img src="/images/Truffle.jpg"/>
 </div>
</body>
</html>