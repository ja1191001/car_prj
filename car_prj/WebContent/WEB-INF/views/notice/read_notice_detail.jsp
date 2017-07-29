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
   	#wrap{width:1000px; height:900px; margin:0px auto}
   	#header{wedth:1000px; height: 100px; position: relative; 
   	background: #FFBFBF 
   	url(http://localhost:8080/spring_mvc1/common/images/header_background.png) no-repeat;}
   	#logo{position: absolute; top:20px;left:50px}
   	#content{width: 1000px; height:700px; position: relative;}
   	#footer{width:1000px; height:100px}
   	#footer_text{width:500px;height:80px; padding-top:20px;float:right; padding-right: 10px}
   	
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
<script type="text/javascript">
function chkNull(){
	var obj=document.searchFrm;
	if(obj.keyword.value==""){
		alert("검색어를 입력해 주세요");
		obj.keyword.focus();
		return;
	}//end if
	obj.submit();
}//chkNull

</script>   
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
			<img src="http://localhost:8080/spring_mvc1/images/main/main_banner.png">
		</div>
		
	<div id="notice" style="width:800px; height:360px;top:100px;'margin:0px auto">
    
 <table class="tab" style="margin: 10px">
	<colgroup>
		<col width="15%"/>
		<col width="35%"/>
		<col width="15%"/>
		<col width="35%"/>
	</colgroup>
	<caption style="background-color: #ccc">게시글 상세</caption>
	<tbody >
	<c:set var="noticeDetail" value="${requestScope.noticeDetailList }"></c:set>
		<tr>
			<th scope="row">글 번호</th>
			<td><c:out value="${requestScope.data.num }"/> </td>
			<th scope="row">조회수</th>
			<td><c:out value="${requestScope.data.num }"/></td>
		</tr>
		<tr>
			<th scope="row">작성자</th>
			<td>관리자</td>
			<th scope="row">작성시간</th>
			<td><c:out value="${requestScope.data.hiredate }"/></td>
		</tr>
		<tr>
			<th scope="row">제목</th>
			<td colspan="3"><c:out value="${requestScope.data.title }"/></td>
		</tr>
		<tr>
			<td colspan="4" style="border: 1px solid #ccc; height : 100px;">
				<c:out value="${requestScope.data.content }"/>
			</td>
		</tr>
	</tbody>
 </table>
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