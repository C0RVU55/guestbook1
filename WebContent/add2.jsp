<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import= "java.util.List" %>
<%@ page import= "com.javaex.sec.GuestDao2" %>
<%@ page import= "com.javaex.sec.GuestVo2" %>

<%--받은 값(request) 꺼내오기 --%>

<%	
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	
	GuestVo2 gVo = new GuestVo2(name, password, content);
	
	GuestDao2 gDao = new GuestDao2();
	
	//저장
	gDao.contentAdd(gVo);
	
	//리스트
	List<GuestVo2> gList = gDao.getList();
	
	//리다이렉트
	response.sendRedirect("./addList2.jsp"); 
%>