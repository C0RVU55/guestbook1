<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.javaex.vo.GuestVo" %>
<%@ page import="com.javaex.dao.GuestDao" %>

<%--내용 삭제 --%>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	String password = request.getParameter("password");
	
	GuestDao gDao = new GuestDao();
	
	//등록된 방명록의 데이터 불러옴
	GuestVo gVo = gDao.getData(no);
	
	//입력받은 비밀번호와 실제 비밀번호가 같으면 삭제하고 다르면 아무것도 안 함.
	if(password.equals(gVo.getPassword())){
		gDao.contentDelete(no);	
		response.sendRedirect("./addList.jsp"); 
	} else {
		
	}
%>