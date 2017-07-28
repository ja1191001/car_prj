<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 메뉴 -->
 <link type="text/css" href="../common/jquery/menu.css" rel="stylesheet" />
 <script type="text/javascript" src="../common/jquery/menu.js"></script>
 <style type="text/css">
div#menu {
    margin:30px 0 0 95px;
   /*  position:absolute; */
}
 </style>
    
<div id="menu">
    <ul class="menu">
        <li><a href="#" class="parent"><span>일정관리</span></a>
            <div>
	       		<ul>
	                <li><a href="calendar.jsp"><span>달력</span></a></li>
	                <li><a href="list.jsp"><span>리스트</span></a></li>
	                <li>
	                
	                
	                </li>
	           	</ul>
           	</div>
        </li>
        <li><a href="#"><span>글쓰기</span></a></li>
        <li class="last"><a href="#"><span>도움말</span></a></li>
    </ul>
</div>