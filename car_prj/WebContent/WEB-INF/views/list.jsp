<%@page import="java.net.URLEncoder"%>
<%@page import="kr.co.sist.util.HangulConv"%>
<%@page import="kr.co.sist.cal.vo.ListVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.cal.dao.CalendarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="cal_err.jsp"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" 
   href="http://localhost:8080/jsp_prj/common/css/main.css">
   	<style type="text/css">
   	#wrap{width:1000px; height:900px; margin:0px auto}
   	#header{wedth:1000px; height: 100px; position: relative; 
   	background: #FFBFBF 
   	url(http://localhost:8080/jsp_prj/common/images/header_background.png) no-repeat;}
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
	<!-- 작성일 : 2017. 6. 30.
		  작성자 : user
		  내용 : 			
	-->
	<div id="wrap">
	<div id="header">
		<div id="logo">
			<a href="#"><img src="http://localhost:8080/jsp_prj/common/images/default.jpg" width="100" height="60" title="메인으로"></a>
		</div>
	</div>	
	<div id="content">
	<c:import url="menu.jsp"/>
	<div style="width:800px; height:360px;top:100px;'margin:0px auto">
	<%
		//index List를 클릭했을 때 발생하는 parameter
		String paramPage=request.getParameter("currentPage");
		//검색을 위한 컬럼명
		String columnName=request.getParameter("field");
		//검색을 위한 값
		String keyword=request.getParameter("keyword");
		if(columnName==null){
			columnName="";
		}//end if
		if(keyword==null){
			keyword="";
		}//end if
		keyword=HangulConv.toUTF(keyword);
	
		CalendarDAO c_dao=CalendarDAO.getInstance();
	//이벤트의 전체 수
		int totalCount=c_dao.selectAllEvtCnt(columnName,keyword);
	//한 화면에 보여줄 게시물의 수
	int pageScale=10;
	//전체 페이지 수
	int totalPage=0;
	totalPage=totalCount/pageScale;
	if(totalCount%pageScale!=0){//나머지가 존재하는 경우
		totalPage++;
	}//end if
	//시작번호
	int startNum=1;
	if(paramPage !=null){
		startNum=Integer.parseInt(paramPage)*pageScale-pageScale+1;
	}//end if
	//끝번호
	int endNum=startNum+pageScale-1;
	//시작번호와 끝 번호 사이의 이벤트 조회
	//검색값이 있다면 검색값에 대한 이벤트를 조회
	List<ListVO> list=c_dao.selectEvt(startNum, endNum, columnName, keyword);
	pageContext.setAttribute("list", list);
	%>
	<%-- <%= totalCount %>건<br/>
	한 화면에 보여줄 글 수 <%=pageScale %>건<br/>
	필요한 장 <%= totalPage %>장<br/>
	시작번호 <%= startNum %>번<br/>
	끝번호 <%= endNum %>번<br/> --%>
	<table class="tab" style="margin: 20px">
	<thead>
	<tr>
		<th class="numTitle">번호</th>
		<th class="subjectTitle">제목</th>
		<th class="writerTitle">작성자</th>
		<th class="evtTitle">이벤트일</th>
		<th class="dateTitle">작성일</th>
		<th class="fileTitle">첨부파일</th>
	</tr>
	</thead>
	<tbody>
	<c:set var="cnt" value="<%= totalCount+1 %>"/>
	<c:if test="${empty list }">
	<tr>
		<td colspan="6">
			작성된 이벤트가 없습니다.<br/>
		</td>
	</tr>
	</c:if>
	<%
	int i=0;
	int currentPage=1;
	if(paramPage!=null){
	 currentPage=Integer.parseInt(paramPage);
	}//end if
	%>
	<c:forEach var="lv" items="${list }">
	<c:set var="cnt" value="${cnt-1 }"/>
	<tr>
		<%-- <td><c:out value="${cnt}"/></td> --%>
		<td><%=totalCount-(currentPage-1)*pageScale-i %></td>
		<%i++; %>
	<%-- 	<td><a href="read_form.jsp?num=${lv.num }"><c:out value="${lv.subject }"/></a></td> --%>
		<td><a href="calendar.jsp?pageFlag=read_form&num=${lv.num }&param_year=${lv.e_year}&param_month=${lv.e_month}&param_day=${lv.e_day}"><c:out value="${lv.subject }"/></a></td>
		<td><c:out value="${lv.writer }"/></td>
		<td><c:out value="${lv.e_year }-${lv.e_month }-${lv.e_day }"/></td>
		<td><c:out value="${lv.w_date }"/></td>
		<td><a href="../day0627/download.jsp?file_name=${lv.origin_file }"><c:out value="${lv.filename }"/></a></td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	</div>
	<div style="text-align:center;">
	<%
	
	
		for(int pageNum=1;pageNum<=totalPage;pageNum++){
			%>
			[<a href="list.jsp?currentPage=<%= pageNum %><%= !"".equals(keyword)?"&field="+columnName+"&keyword="+URLEncoder.encode(keyword,"UTF-8"):""%>"><%=pageNum %></a>]
			
			<%
		}//end for
		
	%>
	</div>
	<div style="text-align: center;">
	<form action="list.jsp" method="get" name="searchFrm">
		<select name="field">
			<option value="subject"${param.field eq 'subject'?" selected":"" }>제목</option>
			<option value="writer""${param.field eq 'writer'?" selected":"" }>작성자</option>
			<option value="contents""${param.field eq 'contents'?" selected":"" }>내용</option>
		</select>
		<%-- <input type="text" name="keyword" class="inputBox" value="${param.keyword ne null?param.keyword:'' }"/> --%>
		<input type="text" name="keyword" class="inputBox" value="<%= !"".equals(keyword)?keyword:""%>"/>
		<input type="button" value="검색" class="btn" onclick="chkNull()" />
		
	</form>
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