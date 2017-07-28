<%@page import="kr.co.sist.cal.vo.DetailEventVO"%>
<%@page import="kr.co.sist.cal.dao.CalendarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="상세 글 보기"
    errorPage="cal_err.jsp"
    %>
<%
   String param_num = request.getParameter("num");
   int num = Integer.parseInt(param_num);
   CalendarDAO c_dao=CalendarDAO.getInstance();
   DetailEventVO dev = c_dao.selectEvent(num);
   if(dev==null){//외부 사용자 조작시, num 조작
      throw new Exception("글 번호 조작");
   }//end if
   
   pageContext.setAttribute("d_evt", dev);
%>  
    
<form name="readFrm" method="post" enctype="multipart/form-data" style="margin-top: 7px">
<input type="hidden" name="num" value="${param.num }"/>
<table style="border-spacing: 0px; border: 1px solid #333; margin: 0px auto;">
   <tr>
      <th colspan="2" align="center"><span>이벤트 읽기</span>
         <span style="float: right; margin-top: 2px; margin-right: 2px">
         <a href="calendar.jsp?param_year=${ param.param_year }&param_month=${ param.param_month}"><img src="images/btn_close.png" alt="닫기" title="닫기"/></a>
         </span>
      </th>
   </tr>
   <tr>
      <td class="tdTitle">작성자</td>
      <td class="tdContent">
         <input type="text" name="writer" class="inputBox" autofocus="autofocus" value="${ d_evt.writer }"/>
      </td>
   </tr>
   <tr>
      <td class="tdTitle">ip address</td>
      <td class="tdContent">
      ${ d_evt.ip }
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
      ${ d_evt.w_date }
      </td>
   </tr>
   <tr>
      <td class="tdTitle">제목</td>
      <td class="tdContent">
      ${ d_evt.subject }
      </td>
   </tr>
   <tr>
      <td class="tdTitle">내용</td>
      <td class="tdContent">
         <textarea name="contents" class="inputBox" style="width: 250px; height: 70px">${ d_evt.contents }</textarea>
      </td>
   </tr>
   <tr>
      <td class="tdTitle">파일선택</td>
      <td class="tdContent">
         <input type="file" name="upfile" class="inputBox" style="width: 190px"/>
         <input type="hidden" name="upfile1" value="${d_evt.filename }"/>
       <div style="color:#B71616;font-weight:bold; position:relative;"id="img_name">
       <script type="text/javascript">
       $(function(){
       	$("#img_name").hover(function(){
       		$("#img_view").toggle();
       	});//hover
       })
       </script>
       <a href="../day0627/download.jsp?file_name=${ d_evt.filename }">${ d_evt.filename }</a>
        <div id="img_view" style="display:none;position:absolute;top:20px;left:10px">
       		<img src='../upload/${d_evt.filename}'>
        </div>
       </div>
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
         <input type="button" value="이벤트 변경"id="btnUpd" class="inputBox" onclick="modifyChkNull()"/>
         <input type="button" value="이벤트 삭제"id="btnDel" class="inputBox" onclick="deleteChkNull()"/>
         <input type="reset" value="초기화" class="inputBox"/>
      </td>
   </tr>
</table>
</form>