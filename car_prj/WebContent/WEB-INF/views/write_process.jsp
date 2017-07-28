<%@page import="java.io.File"%>
<%@page import="kr.co.sist.util.HashUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.cal.dao.CalendarDAO"%>
<%@page import="kr.co.sist.cal.vo.EventVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path=application.getInitParameter("upload_path");
	MultipartRequest mr= new MultipartRequest(request, path, 1024*1024*10, "UTF-8", new DefaultFileRenamePolicy());
	String ip = request.getRemoteAddr();
	String fileName = mr.getFilesystemName("upfile");
	
	//입력된 값으로 VO생성
	EventVO ev=new EventVO(mr.getParameter("param_year"),
			mr.getParameter("param_month"),
			mr.getParameter("param_day"),
			mr.getParameter("writer"),
			mr.getParameter("subject"),
			mr.getParameter("content"),
			ip, HashUtil.hashText(mr.getParameter("pass")),fileName);
	
	//DAO생성
	CalendarDAO cd=CalendarDAO.getInstance();
	StringBuilder moveURL=new StringBuilder();
	try{
		//DB작업 후 이동할 URL
		moveURL.append("calendar.jsp?param_year=")
		.append(mr.getParameter("param_year"))
		.append("&param_month=")
		.append(mr.getParameter("param_month"));
		//DB추가작업
		cd.insertEvent(ev);
		//성공했을 때의 파라미터
		moveURL.append("&write_flag=true");
	}catch(SQLException se){
		//실패했을 때의 파라미터
		moveURL.append("&write_flag=false");
		//파일을 선택했으나 이벤트의 insert가 실패되었다면
		//업로드된 파일을 삭제한다.
		if(fileName!=null){
			File file=new File("C:/dev/workspace/jsp_prj/WebContent/upload"+fileName);
			if(file.exists()){ //파일이 존재하면
				//파일을 지운다.
				file.delete();
			}//end if
		}//end if
		
		se.printStackTrace();
	}finally{
		//성공/ 실패한 후 페이지 이동
		response.sendRedirect(moveURL.toString());
	}//end finally
%>
