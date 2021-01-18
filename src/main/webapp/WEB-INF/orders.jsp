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
<link type="text/css" rel="stylesheet" href="<c:url value="/css/orders.css" />" />
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
    <div class="content">
<div class=table>
<table>
<thead>
	<tr>
	<th scope="col">#</th>
	<th scope="col">Image</th>
	<th scope="col">Name</th>
	<th scope="col">Amount</th>
	<th>Common</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="currentFood" varStatus="loop" items="${currentFoodsInOrder}">
		<tr>
		 <th scope="row">${loop.index}</th>
		<td><img src="/images/${currentFood.imgFood}" alt="${currentFood.imgFood}" width="100px" height="100px"/></td>
    	<td><c:out value="${currentFood.foodName}" /></td>
    	<td><c:out value="${currentFood.amount}" /></td>
    	<td><a class="btn_a" href="/delete/${currentFood.id}">Delete</a>
    		<a class="btn_a" href="/update/${currentFood.id}">Update</a></td>
    	</tr>
    </c:forEach>
</tbody>
</table>
</div>
<div>
   <c:choose>
   	<c:when test="${delivery==null}">
   		<a class="btn primary-btn" href="/delivery">Delivery</a>
   	</c:when>
   	<c:otherwise>
   	<table class="table">
		<thead>
			<tr>
			<th scope="col">Method Delivery</th>
			<th scope="col">Street</th>
			<th scope="col">City</th>
			<th scope="col">State</th>
			<th scope="col">Postal Code</th>
			<th scope="col">Country</th>
			<th scope="col">Delivery Price</th>
			<th scope="col">Phone</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<td>${delivery.methodDelivery}</td>
			<td>${delivery.street}</td>
			<td>${delivery.city}</td>
			<td>${delivery.state}</td>
			<td>${delivery.postalCode}</td>
			<td>${delivery.country}</td>
			<td>${delivery.deliveryPrice}</td>
			<td>${delivery.phone}</td>
			</tr>
		</tbody>
		</table>
		 <c:choose>
   	<c:when test="${cart==null}">
<div class="tipsForm">
<form:form method="POST" action="/tips" modelAttribute="cart1">
	<form:label path="tips">Tips:
	<form:input path="tips"/></form:label>
	<button class="btn">ADD</button>
</form:form>
</div>
   	</c:when>
   	<c:otherwise>
		 	<table class="table">
		<thead>
			<tr>
			<th scope="col">Tips</th>
			<th scope="col">Tax</th>
			<th scope="col">Total</th>
			<th scope="col">Final Total</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<td>${cart.tips}</td>
			<td>${cart.tax}</td>
			<td>${cart.total}</td>
			<td>${cart.finalTotal}</td>
			</tr>
		</tbody>
		</table>
		 <a class="btn primary-btn" href="/cart">Cart</a>
		</c:otherwise>
		</c:choose>
   	</c:otherwise>
   </c:choose>
   	</div>
   </div>
   <div class="fullscreen-bg">
   <div class="overlay">
   </div>
   </div>
<div>
    <video loop="" muted="" autoplay="" poster="<c:url value="video/c3.mp4" />" class="fullscreen-bg__video">
        <source src="<c:url value="video/c3.mp4" />" type="video/mp4">
    </video>
</div>
</body>
</html>