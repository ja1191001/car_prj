<%@page import="java.io.File"%>
<%@page import="kr.co.sist.util.HashUtil"%>
<%@page import="kr.co.sist.cal.vo.CalUpdateVO"%>
<%@page import="kr.co.sist.cal.dao.CalendarDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파일을 처리하기 위해서 : multipartrequest
	String path=application.getInitParameter("upload_path");
	MultipartRequest mr=new MultipartRequest(request,path,1024*1024*10,"UTF-8",new DefaultFileRenamePolicy());
	//파일이 업로드 되면 파일명이 반환되고
	//파일이 업로드 되지 않으면 null이 반환 된다.
	String filename=mr.getFilesystemName("upfile");
	//업로드된 파일명이 들어있는 hidden
	String upfile1=mr.getParameter("upfile1");
	//기존에 업로드한 파일이 존재하고, 업데이트시 파일을 선택하지 않은경우
	boolean fileDelFlag=false;
	//기존의 파일이 있으면서, 새로운 파일이 있으면서, 기존의 파일명과 새로운 파일명이 같지 않으면 삭제진행
	if(!"".equals(upfile1)&& filename!=null&&(!upfile1.equals(filename))){
		//기존에 업로드된 파일명으로 파일명을 재설정한다
		//filename=upfile1;
		fileDelFlag=true;
	}//end if
	
	
	CalUpdateVO cuv=new CalUpdateVO(
			Integer.parseInt(mr.getParameter("num")),
			HashUtil.hashText(mr.getParameter("pass")),
			mr.getParameter("writer"),
			mr.getParameter("contents"),
			fileDelFlag?filename:upfile1);
	//fileDelFlag 가 true 라면 새 파일명으로 업데이트가 실행되어야 하고,
	//그렇지 않으면 기존 파일명으로 업데이트가 실행되어야 한다
	//int num, String pass, String writer, String contents, String fileName
	CalendarDAO c_dao=CalendarDAO.getInstance();
	boolean flag = c_dao.updateEvent(cuv);
	
	if(flag){//변경 성공시 이전의 이미지를 삭제
		//기존에 업로드된 파일이 존재하면서 새로운 파일을 선택했을때
		if(fileDelFlag){
			//기존에 업로드된 파일은 삭제한다.
			File file=new File("C:/dev/workspace/jsp_prj/WebContent/upload/"+upfile1);
			if(file.exists()){ //파일이 존재하면
				//파일을 지운다.
				file.delete();
			}//end if
		}//end if
	}//end if
	
	if(!flag){ //업데이트 실패
		//새로 선택하여 업로드된 파일을 삭제한다.
		if(filename!=null){
			File file=new File("C:/dev/workspace/jsp_prj/WebContent/upload/"+upfile1);
			if(file.exists()){ //파일이 존재하면
				//파일을 지운다.
				file.delete();
			}//end if
		}//end if
	}//end if
		
	//update 결과를 session에 설정한다.
	session.setAttribute("update_flag", flag);
	//이동할 페이지 설정
	response.sendRedirect("calendar.jsp?param_year="+mr.getParameter("param_year")+"&param_month="+mr.getParameter("param_month"));
%>