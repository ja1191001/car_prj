<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" 
   href="http://localhost:8080/spring_mvc1/common/css/main.css">
   	<style type="text/css">
   	#wrap{width:1000px; height:900px; margin:0px auto}
   	#header{wedth:1000px; height: 100px; position: relative; 
   	background: #FFBFBF 
   	url(http://localhost:8080/spring_mvc1/common/images/header_background.png) no-repeat;}
   	#logo{position: absolute; top:20px;left:50px}
   	#content{width: 1000px; height:700px}
   	#footer{width:1000px; height:100px}
   	#footer_text{width:500px;height:80px; padding-top:20px;float:right; padding-right: 10px}
   	
   </style>
</head>
<body>
	<!-- 작성일 : 2017. 7. 26.
		  작성자 : user
		  내용 : 			
	-->
	<div id="wrap">
	<div id="header">
		<div id="logo">
			<a href="#"><img src="http://localhost:8080/spring_mvc1/common/images/default.jpg" width="100" height="60" title="메인으로"></a>
		</div>
	</div>	
	<div id="content">
	
		<div id="main_banner">
			<img src="http://localhost:8080/spring_mvc1/images/main/main_banner.png">
		</div>
		
		<div id="newCarList">
			<c:if test="${empty requestScope.carList }">
				<marquee scrollamount="9">
				<strong>등록된 매물이 없습니다.</strong>
				</marquee>
			</c:if>
			<table>
			<c:forEach var="car" items="${requestScope.carList }">
				<td>
					<img src="http://localhost:8080/spring_mvc1/images/car_img/${car.car_img }" width="110">
					<br/><c:out value="${car.model }"/> (<c:out value="${car.car_year }"/>년식)
				</td>
			</c:forEach>
			</table>
		</div>
		
		<div id="bestEmpList">
		<ul>
		<li>최고 판매사원</li>
		<c:if test="${empty requestScope.empList }">
			<li>최고 판매사원 없음.</li>
		</c:if>
		<c:forEach var="emp" items="${requestScope.empList }">
			<li><c:out value="${emp.ename }/${emp.job }/${emp.empno }"/></li>
		</c:forEach>
		</ul>
		</div>
		
	</div>
	<div id="footer">
		<div id="footer_text">
		Copyright &copy; 2017 class4 dongha, All Right Reserved
		</div>
	</div>
	</div>
</body>
</html>