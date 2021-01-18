<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/menu.css" />" />
<link type="text/css" rel="stylesheet" href="<c:url value="/css/update.css" />" />
</head>
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
  
  
<body>
 <div class="container-fluid">
	<div class="container">
	<div class="tb">
	<form:form action="/update/${currentFood.id}" method="post" modelAttribute="currentFood">
		<p><c:out value="${currentFood.foodName}" /><p>
		<img src="/images/${currentFood.imgFood}" alt="${currentFood.imgFood}" width="100px" height="100px"/>
	<form:label path="amount">Amount:</form:label>
	<form:input path="amount"/>
	     	  
	<input class="btn" type="submit" value="Update"/>
</form:form>
</div>
</div>
</div>

<div class="background">
	<img class="background_img" src="/images/Update.jpg">
</div> 
</body>
</html>