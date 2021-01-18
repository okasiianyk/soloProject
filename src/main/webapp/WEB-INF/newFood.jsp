<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Food</title>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/menu.css" />" />
<link type="text/css" rel="stylesheet" href="<c:url value="/css/newFood.css" />" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
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
<script type="text/javascript"> 


function getval(sel)
{
	 var nmeF="/images/" + sel.value
	 //$("#pict").attr("src",nmeF);
	
	 var img = document.createElement("IMG");
	    img.src = nmeF;
	    img.alt = nmeF;	  
	    $('#msgid').empty();
	    $('#msgid').append(img);
}
 
</script> 
 <div class="container-fluid">
	<div class="container">
<form:form action="/food/new" method="post" modelAttribute="food">
	<h1>Create a new food</h1>
	<div>
	<form:label path="foodName">Food name:</form:label>
	<form:input class="form-control" path="foodName" placeHolder="Name"/>
	</div>
	<div><form:label path="price">Price:</form:label>
	<form:input class="form-control" path="price" placeHolder="Amount"/>
	</div>
	<div>
	<form:label path="description">Description:</form:label>
	<form:input class="form-control" path="description" placeHolder="Description"/>
	</div>
	<div><form:label path="category">Category: </form:label>
	     <form:select class="form-control" path="category" multiple="false"> 
		    <form:options items="${categories}" itemValue="id" itemLabel="nameCategory"></form:options>
       	</form:select> 
    </div>
    <div>
       	<form:label path="imgFood">Image of food: </form:label>
       	
		<form:select class="form-control" onchange="getval(this);" path="imgFood" multiple="false"> 
		 	<form:option value="Choose a picture"/>
       	  	<form:options items="${imgFoods}" value="${imgFood}"></form:options>       	  
       	 </form:select>
       	 
    </div> 
	<input  class="btn" type="submit" value="Create"/>
</form:form>
 </div>
 </div>

 <div class="background">
 	<img src="/images/Pastries.jpg"/>
 </div>
</body>
</html>