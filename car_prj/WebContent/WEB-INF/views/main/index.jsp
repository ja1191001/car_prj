<%@page import="kr.co.sist.notice.vo.NoticeValueVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.notice.controller.MainController"%>
<%@page import="kr.co.sist.notice.dao.MainDAO"%>
<%@page import="kr.co.sist.notice.util.HangulConv"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Hyerim RentCar</title>

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="http://localhost:8080/car_prj/template/css/bootstrap.css">
        <link rel="stylesheet" href="http://localhost:8080/car_prj/template/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://localhost:8080/car_prj/template/css/bootstrap-theme.css">
        <link rel="stylesheet" href="http://localhost:8080/car_prj/template/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="http://localhost:8080/car_prj/template/css/fontAwesome.css">
        <link rel="stylesheet" href="http://localhost:8080/car_prj/template/css/templatemo-style.css">
		<link rel="stylesheet" href="http://localhost:8080/car_prj/common/css/main.css">
   	<style type="text/css">
	#agr_wrap{margin:0px auto;width:650px; height:600px}
	#agr_header{text-align:center}
	#agr_footer{text-align:center;margin-top:30px}
 	.ag_1{ border:1px solid #333; width:650px; min-height: 250px; overflow: auto;}
   	#wrap{width:700px; min-height:100px; margin:0px auto}
   	#header{wedth:700px; height: 100px; position: relative; 
   	background: #FFBFBF 
   	url(http://localhost:8080/car_prj/common/images/header_background.png) no-repeat;}
   	#logo{position: absolute; top:20px;left:50px}
   	#content{width: 700px; min-height: 100px; position: relative;}
   	#footer{width:700px; height:100px;}
   	#footer_text{width:500px;height:80px; padding-top:20px;float:right; padding-right: 10px}
   	.btn{
   	height: 25px
   	}
   	.tab {
   border-top: 3px solid #404040;
   border-spacing: 0px
}

th {
	text-align: center;
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
	//검색란이 공란인 상태로 검색시 전체 검색으로 적용
	/* if(obj.keyword.value==""){
		 alert("검색어를 입력해 주세요");
		obj.keyword.focus(); 
		
		return;
	}//end if */
	
	obj.submit();
}//chkNull

function chkValue(){
	var obj=document.movePage;
	
	obj.submit();
}//chkNull

</script>   
</head>
<body>
	<!-- 작성일 : 2017. 7. 26.
		  작성자 : user
		  내용 : 			
	-->
	 <div class="overlay"></div>
        <section class="top-part">
        </section>
        
        <section class="cd-hero">
		<div class="cd-slider-nav">
		
		<c:import url="${ request.contextPath }/menu.do"/>
		</div>

     <!--      <ul>

            <li> -->
              <div class="heading">
                <h1>공지사항</h1>
                <span>공지사항</span>
              </div>
              <div class="cd-full-width first-slide" style="height: 750px">
                <div class="container" style="height: 400px">
                  <div class="row" style="height: 400px;">
                    <div class="col-md-12">
                      <div class="content first-content">
	<div id="wrap">
	<div id="content">
	<div id="notice" style="width:750px; min-height:700px;top:100px;'margin:0px auto">
	<table class="tab" style="margin: 10px">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="20%"/>
		</colgroup>
	<thead>
	<tr>
		<th class="numTitle" scope="col">번호</th>
		<th class="subjectTitle" scope="col"	>제목</th>
		<th class="writerTitle" scope="col">작성자</th>
		<th class="dateTitle" scope="col">작성일</th>
	</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${empty requestScope.noticeList }">
			<tr><td colspan="4" align="center">작성된 글이 없습니다.</td></tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="notice" items="${requestScope.noticeList }">
			<tr>
				<td><c:out value="${notice.num }"/></td>
				<td align="left"> <a href="notice/read_notice_detail.do?num=${ notice.num }"><c:out value="${notice.title }"/></a></td>
				<td>관리자</td>
				<td><c:out value="${notice.hiredate }"/></td>
			</tr>	
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</tbody>
	</table>
	<br/>
	<form action="index.do" method="get" name="movePage">	
<div align="center">
<c:if test="${ not empty requestScope.noticePage }">
	<c:if test="${requestScope.noticePage.currentPage !=1 }">
		<a href="index.do?currentPage=${noticePage.currentPage-1 }&columnName=${ columnName}&keyword=${ keyword}" ><img alt="이전 페이지" src="http://localhost:8080/car_prj/images/btn_prev.png" title="이전 페이지"></a>
	</c:if>
	<c:choose>
	<c:when test="${ empty param.columnName }">
	
	<c:forEach var="i" begin="${requestScope.noticePage.firstPage }" end="${ requestScope.noticePage.lastPage }" step="1">
	[ <a href="index.do?currentPage=${ i }">${ i }</a> ]
	</c:forEach> 
	
	</c:when>
	<c:otherwise>
	<c:forEach var="i" begin="${requestScope.noticePage.firstPage }" end="${ requestScope.noticePage.lastPage }" step="1">
	[ <a href="index.do?currentPage=${ i }&columnName=${ param.columnName}&keyword=${ param.keyword}" >${ i }</a> ]
	</c:forEach>
	<c:out value="${requestScope.noticePage.totalPage }"/>
	</c:otherwise>
	</c:choose>
	<c:if test="${requestScope.noticePage.currentPage  != requestScope.noticePage.lastPage }">
		<a href="index.do?currentPage=${noticePage.currentPage+1 }&columnName=${ columnName}&keyword=${ keyword}" onclick="chkValue()" ><img alt="다음 페이지" src="http://localhost:8080/car_prj/images/btn_next.png" title="다음 페이지"></a>
	</c:if>
</c:if>
</div>	
</form>
	<div style="text-align: center; min-height: 100px;" >
	<form action="index.do" method="get" name="searchFrm">
		<select name="columnName">
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="text" name="keyword" class="inputBox" value=""/>
		<input type="button" value="검색" class="btn" onclick="chkNull('columnName','keyword')" />
		
	</form>

	</div>
	</div>
	</div>
	</div>
                      </div>
                    </div>
                  </div>                  
                </div>
              </div>
       <!--      </li>
          </ul> .cd-hero-slider -->
        </section> <!-- .cd-hero -->
	<footer >
		<!-- <div id="footer_text"> -->
		Copyright &copy; 2017 class4 dongha, All Right Reserved
		<!-- </div> -->
	</footer>
	 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
</body>
</html>