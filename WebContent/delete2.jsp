<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.javaex.sec.GuestVo2" %>
<%@ page import="com.javaex.sec.GuestDao2" %>

<%--내용 삭제 --%>

<%
	request.setCharacterEncoding("UTF-8");

	int no = Integer.parseInt(request.getParameter("no"));
	String password = request.getParameter("password");
	
	GuestDao2 gDao = new GuestDao2();
	
	//등록된 방명록의 데이터를 불러올 필요없이 contentDelete의 count가 반환되는지 따져봄
	int num = gDao.contentDelete(no, password);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestbook1 삭제 다른 방식</title>
</head>
<body>
	<%if(num == 1 ){ 
		response.sendRedirect("./addList2.jsp");  	
	} %> <% if(num == 0) { %>
		비밀번호가 바르지 않습니다. <br>
		<a href="./addList2.jsp">메인으로 돌아가기</a>
	<%} %>
</body>
</html>