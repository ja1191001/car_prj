<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form name="writeFrm" method="post" enctype="multipart/form-data" action="write_process.jsp">
<table style="border-spacing: 0px; border: 1px solid #333; margin: 0px auto;">
	<tr>
		<th colspan="2" align="center"><span>이벤트 작성</span>
			<span style="float: right; margin-top: 2px; margin-right: 2px">
			<a href="calendar.jsp?param_year=${ param.param_year }&param_month=${ param.param_month}"><img src="images/btn_close.png" alt="닫기" title="닫기"/></a>
			</span>
		</th>
	</tr>
	<tr>
		<td class="tdTitle">작성자</td>
		<td class="tdContent">
			<input type="text" name="writer" class="inputBox" autofocus="autofocus"/>
		</td>
	</tr>
	<tr>
		<td class="tdTitle">ip address</td>
		<td class="tdContent">
		<%= request.getRemoteAddr() %>
			<input type="hidden" name="ip" value="<%= request.getRemoteAddr() %>"/>
		</td>
	</tr>
	<tr>
		<td class="tdTitle">이벤트 일</td>
		<td class="tdContent">
			<input type="text" name="param_year" class="inputBox" style="width: 40px" value="${ param.param_year }" readonly="readonly"/>/
			<input type="text" name="param_month" class="inputBox" style="width: 40px" value="${ param.param_month }" readonly="readonly"/>/
			<input type="text" name="param_day" class="inputBox" style="width: 40px" value="${ param.param_day }" readonly="readonly"/>
			
		</td>
	</tr>
	<tr>
		<td class="tdTitle">작성일</td>
		<td class="tdContent">
			<input type="text" name="w_date" style="width: 150px" 
				value='<fmt:formatDate value="<%= new Date() %>" pattern="yyyy-MM-dd a HH:mm"/>' class="inputBox"/>
		</td>
	</tr>
	<tr>
		<td class="tdTitle">제목</td>
		<td class="tdContent">
			<input type="text" name="subject" class="inputBox" style="width: 250px"/>
		</td>
	</tr>
	<tr>
		<td class="tdTitle">내용</td>
		<td class="tdContent">
			<textarea name="content" class="inputBox" style="width: 250px; height: 70px"></textarea>
		</td>
	</tr>
	<tr>
		<td class="tdTitle">파일선택</td>
		<td class="tdContent">
			<input type="file" name="upfile" class="inputBox"/>
		</td>
	</tr>
	<tr>
		<td class="tdTitle">비밀번호</td>
		<td class="tdContent">
			<input type="password" name="pass" class="inputBox"/>
		</td>
	</tr>
	<tr>
		<td class="tdTitle" colspan="2" style="text-align: center;">
			<input type="button" value="이벤트작성" class="inputBox" onclick="writeChkNull()"/>
			<input type="reset" value="초기화" class="inputBox"/>
		</td>
	</tr>
</table>
</form>