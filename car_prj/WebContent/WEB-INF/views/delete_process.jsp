<%@page import="java.io.File"%>
<%@page import="kr.co.sist.util.HashUtil"%>
<%@page import="kr.co.sist.cal.vo.DelEventVO"%>
<%@page import="kr.co.sist.cal.dao.CalendarDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	String path=application.getInitParameter("upload_path");
	MultipartRequest mr=new MultipartRequest(request,path,"UTF-8");
	
	String writer=mr.getParameter("writer");
	String pass=mr.getParameter("pass");
	String num=mr.getParameter("num");
	
	//파라메터를 VO에 설정
	DelEventVO dev=new DelEventVO(Integer.parseInt(num), writer,HashUtil.hashText(pass));
	CalendarDAO c_dao=CalendarDAO.getInstance();
	//삭제수행
	boolean flag=c_dao.deleteEvent(dev);
	
	if(flag){ //삭제 성공
		//업로드한 파일이 존재하면 파일을 삭제
		String fileName=mr.getParameter("upfile1");
		File file=new File("C:/dev/workspace/jsp_prj/WebContent/upload/"+fileName);
		if(file.exists()){ //파일 삭제
			file.delete();
		}//end if
	}//end if
	
	//삭제시 수행결과를 세션에 설정	
	session.setAttribute("cal_del_flag", flag);
	response.sendRedirect("calendar.jsp?param_year="+mr.getParameter("param_year")+"&param_month="+mr.getParameter("param_month"));	
%>
