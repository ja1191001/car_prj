<%@page import="kr.co.sist.notice.dao.MainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="상세 글 보기"
    errorPage="cal_err.jsp"
    %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" 
   href="http://localhost:8080/car_prj/common/css/main.css">
   	<style type="text/css">
   	#wrap{width:800px; height:900px; margin:0px auto}
   	#header{wedth:1000px; height: 100px; position: relative; 
   	background: #FFBFBF 
   	url(http://localhost:8080/spring_mvc1/common/images/header_background.png) no-repeat;}
   	#logo{position: absolute; top:20px;left:50px}
   	#content{width: 800px; min-height:700px; position: relative;}
   	#footer{width:1000px; min-height:100px}
   	#footer_text{width:500px;min-height:80px; padding-top:20px;float:right; padding-right: 10px}
   	
   	.tab {
   border-top: 3px solid #5B7CE5;
   border-spacing: 0px
}

th {
   font-weight: normal;
   background-color: #FAFAFA;
   border-bottom: 1px solid #E7E7E7;
   height: 37px
}

.numTitle {width: 60px}
.subjectTitle {width: 300px}
.writerTitle {width: 100px}
.evtTitle {width: 120px}
.dateTitle {width: 120px}
.fileTitle {width: 80px}
/* text-align : 글자 정렬  left,center,right  */
td {
   border-bottom: 1px solid #E7E7E7;
   height: 28px;
   text-align: center;
}

tr:HOVER {background-color: #EAE9F7}
   </style>
</head> 
<body>
<%
 
%>

  <div id="wrap">
	<div id="header">
		<div id="logo">
			<a href="#"><img src="http://localhost:8080/spring_mvc1/common/images/default.jpg" width="100" height="60" title="메인으로"></a>
		</div>
	</div>	
	<div id="content">
	
		<div id="main_banner">
			<img src="http://localhost:8080/car_prj/images/main/main_banner.png">
		</div>
		
	<div id="notice" style="width:800px; height:360px;top:100px;'margin:0px auto">
    
 <table class="tab" style="margin: 10px">
	<colgroup>
		<col width="7%"/>
		<col width="*%"/>
		<col width="8%"/>
		<col width="20%"/>
	</colgroup>
	<caption style="background-color: #ccc">게시글 상세</caption>
	<tbody >
	<c:set var="noticeDetail" value="${requestScope.detail_data }"></c:set>
		<tr>
			<th scope="col">글 번호</th>
			<th scope="col" width="500">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">작성시간</th>
		</tr>
		<tr>	
			<td><c:out value="${requestScope.detail_data.num }"/> </td>
			<td><c:out value="${requestScope.detail_data.title }"/></td>
			<td>관리자</td>
			<td><c:out value="${requestScope.detail_data.hiredate }"/></td>
		</tr>
		<tr>
			<td colspan="4" align="left" style="border: 1px solid #ccc; height : 100px;" >
				<c:out value="${requestScope.detail_data.content }"/>
			</td>
		</tr>
	</tbody>
 </table>
</div>
<div align="center">
<a href="notice/read_notice_detail.do?num=${ requestScope.detail_data.num-1 }"><input type="button" class="btn" value="이전 글" ></a>
<a href="notice/read_notice_detail.do?num=${ requestScope.detail_data.num+1 }"><input type="button" class="btn" value="다음 글" ></a>
<a href="../index.do"><input type="button" class="btn" value="목록으로" ></a>
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