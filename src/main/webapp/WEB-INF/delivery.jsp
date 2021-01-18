<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/deliverycss.css" />" />
<script src="<c:url value="/js/delivery.js" />"></script>
</head>
<body>
<div class="fullscreen-bg">
<div class="wrapContainer">
<form:form method="POST" action="/delivery" modelAttribute="delivery">                 
    <div id="cirMain" class="imgCircle">
      <img  src="/images/circle.svg" >
      <div class="pointCircle c1"><a>
      	<select class="form-control" name="methodDelivery">
			   		<option value="true">Delivery</option>
			  	  	<option value="false">Pick up</option>
		</select>
      </a></div>
      <div class="pointCircle c2">
      
      <a onclick="aClick(this)">Street <br>
      <span></span></a>
      <div class="inpTxt">
          <form:input path="street"/>
          <p onclick="btnClick(this)"> OK</p>
        </div></div>
        
      <div class="pointCircle c3">
      <a onclick="aClick(this)">City <br>
      <span></span></a>
      <div class="inpTxt">
          <form:input path="city"/>
          <p onclick="btnClick(this)"> OK</p> 
        </div></div>
        
      <div class="pointCircle c4">
      <a onclick="aClick(this)">State <br>
      <span></span></a>
      <div class="inpTxt">
          <form:input path="state"/>
          <p onclick="btnClick(this)"> OK</p> 
        </div></div>
        
      <div class="pointCircle c5">
      <a onclick="aClick(this)">Postal Code <br>
      <span></span></a>
      <div class="inpTxt">
          <form:input path="postalCode"/>
          <p onclick="btnClick(this)"> OK</p> 
        </div></div>
        
      <div class="pointCircle c6">
      <a onclick="aClick(this)">Country <br>
      <span></span></a>
      <div class="inpTxt">
          <form:input path="country"/> 
           <p onclick="btnClick(this)"> OK</p>  
        </div></div>
        
      <div class="pointCircle c7">
      <a onclick="aClick(this)">Phone  <br>
      <span></span></a>
      <div class="inpTxt">
          <form:input path="phone"/>
          <p onclick="btnClick(this)"> OK</p>  
        </div></div>
      <!-- <div class="pointCircle c8"><a>C8</a></div>-->
  <input class="pointCircle c9" type="submit" value="Next"/>
 </div>
 </form:form> 
 </div>
    <video loop="" muted="" autoplay="" poster="<c:url value="video/fon2.mp4" />" class="fullscreen-bg__video">
        <source src="<c:url value="video/fon2.mp4" />" type="video/mp4">
    </video> 
</div>
 
 <!-- ---------------------------------------------- -->   
 <!--  <div class="container-fluid">
 <div class="container">
<form:form method="POST" action="/delivery" modelAttribute="delivery">
	<div class="form-group">
				<select class="form-control" name="methodDelivery">
			   		<option value="true">Delivery</option>
			  	  	<option value="false">Pick up</option>
				</select>
	</div>
	<div class="form-group">
	<form:label path="street">Street:
	<form:input class="form-control" path="street"/></form:label>
	</div>
	<div class="form-group">
	<form:label path="city">City:
	<form:input class="form-control" path="city"/></form:label>
	</div>
	<div class="form-group">
	<form:label path="state">State:
	<form:input class="form-control" path="state"/></form:label>
	</div>
	<div class="form-group">
	<form:label path="postalCode">Postal Code:
	<form:input class="form-control" path="postalCode"/></form:label>
	</div>
	<div class="form-group">
	<form:label path="country">Country:
	<form:input class="form-control" path="country"/></form:label>
	</div>
	<div class="form-group">
	<form:label path="phone">Phone:
	<form:input class="form-control" path="phone"/></form:label>
	</div>
	<div class="form-group">
	<button class="btn primary-btn">NEXT</button>
	</div>
</form:form>
</div>
</div>
-->
</body>
</html>