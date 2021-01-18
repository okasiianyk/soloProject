<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Options</title>
<script src="<c:url value="/js/options.js" />"></script>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/optionsCSS.css" />" />
<link type="text/css" rel="stylesheet" href="<c:url value="/css/menu.css" />" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Monsieur+La+Doulaise&display=swap" rel="stylesheet">
</head>
<body>
<div class="nav_a" onmouseover="onNav()" onmouseout="outNav()">
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
<!-- <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand pl-3" href="#">L'ours Bakery</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
  
    <div id="menu" class="navbar-nav d-flex justify-content-around">
      <a class="nav-link active" href="/options">Home <span class="sr-only">(current)</span></a>
            <c:choose>
      	<c:when test="${!currentFoodsInOrder.isEmpty()}">
      		<a class="nav-link" href="/orders">Order (${currentFoodsInOrder.size()})</a>
      	</c:when>
      	<c:otherwise>
      	<a class="nav-link disabled" href="/orders">Order</a>
      	</c:otherwise>
      </c:choose>  
      <c:choose>
      	<c:when test="${user.userPosition.toString().equals('admin')}">
      		<a class="nav-link" href="/category/new">New Category</a>
      		<a class="nav-link" href="/food/new">New Food</a>
      	</c:when>
      </c:choose>  
      <a class="nav-link" href="/userLogout">Logout</a>

     <a class=" nav-link disabled" href="/options">${user.name}</a>
 	</div>
 	
  </div>
</nav> -->
  
 <!-- ---------------------------------------------- -->   
 <!--
 <div class="container-fluid ">
 <div class="container np">
 	<h1>OPTIONS</h1>
 </div>
	<div class="container d-flex justify-content-around">
		
		
		<c:choose>
			<c:when test="${cakes.isEmpty()}">
				<h1>We are closed</h1>
			</c:when>
		</c:choose>
		
		<c:forEach items="${categories}" var="category">
		<a href="/bakery/${category.id}" class="custom-card">
		<div class="card" style="width: 20rem; display: inline-block; vertical-align:top; height:18rem">
			    <img class="card-img-top" height="300px" src="/images/${category.nameCategory}.jpg" 
			    							alt="${category.nameCategory}"/>
			    <div class="card-body">
			       <h5 class="card-title">${category.nameCategory}</h5>	 		    
			    </div>
		</div>
		</a>
		</c:forEach>
  </div>
 </div>
-->
<div class="myContainer">
<c:forEach items="${categories}" var="category">
		<div onclick="window.location='/bakery/${category.id}';" class="card" style="cursor: pointer; background:url('/images/${category.nameCategory}.jpg') no-repeat; background-size: cover;">
				 <div class="card-body">
			       <h5 class="card-title">${category.nameCategory}</h5>	 		    
			    </div>
		</div>
		</c:forEach>
</div>
</body>
</html>