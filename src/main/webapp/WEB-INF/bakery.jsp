<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value="/js/options.js" />"></script>
<!--<script src="<c:url value="/js/products.js" />"></script>-->
<link type="text/css" rel="stylesheet" href="<c:url value="/css/menu.css" />" />
<link type="text/css" rel="stylesheet" href="<c:url value="/css/products.css" />" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet"></head>
<link href="https://fonts.googleapis.com/css2?family=Monsieur+La+Doulaise&display=swap" rel="stylesheet">
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

     <a class="disabled" href="/options">${user.name}</a>
</div>
</div>
<div class="wrap">
<div id="cuadricula">
<c:forEach items="${cakes}" var="cake">
<div class="cardContainer item">
<div class="card">
		<div class="side" style="background-image:url('/images/${cake.imgFood}')"></div>
		<div class="description side">
		<div>
		<form:form method="POST" action="/addFood/${cake.id}" modelAttribute="food">
					<h3>${cake.foodName}</h3>
				    <p class="card-text" align="justify">${cake.description}</p>
				   	<b><p class="card-text">$${cake.price}</p></b>
				    <p class="card-text">QTY: <form:input path="amount" placeHolder="0"/></p>		  
				    <input class="btn btn-primary" type="submit" value="Add"/> 
				    </form:form>
		</div>
		</div>
	</div>
</div>
</c:forEach>
</div>
</div>
<!-- 
<div class="cart">
	<div class="test_div"></div>

</div>

<div class="wrap"><div class="four"><kbd>scaleX(-1)</kbd></div></div>


<div class="wrap"><div class="nine"><kbd>skewY(-20deg)</kbd></div></div> -->
 <!-- ---------------------------------------------- -->   
 <!-- <div class="container-fluid">
	<div class="container">
		
		<h1>OPTIONS</h1>
		
		<c:choose>
			<c:when test="${cakes.isEmpty()}">
				<h1>We are closed</h1>
			</c:when>
		</c:choose>
		
		<c:forEach items="${cakes}" var="cake">
		<div class="card" style="width: 15rem; display: inline-block; vertical-align:top;">
			<form:form method="POST" action="/addFood/${cake.id}" modelAttribute="food">
			    <img class="card-img-top" 	src="/images/${cake.imgFood}" 
			    							alt="${cake.foodName}"/>
			    <div class="card-body">
			       <h5 class="card-title">${cake.foodName}</h5>
				    <p class="card-text">${cake.description}</p>
				   	<p class="card-text">${cake.price}</p>
				    <p class="card-text">QTY: <form:input path="amount" placeHolder="0"/></p>		  
				    <input class="btn btn-primary" type="submit" value="ADD"/> 		    
			    </div>
			</form:form>
		</div>
		</c:forEach>
  </div>
 </div> -->

</body>
</html>