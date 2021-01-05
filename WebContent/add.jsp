<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.List" %>
<%@ page import= "com.javaex.dao.GuestDao" %>
<%@ page import= "com.javaex.vo.GuestVo" %>
    
<%--내용 추가 --%>

<%--받은 값(request) 꺼내오기 --%>
<%	
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	
	GuestVo gVo = new GuestVo(name, password, content);
	
	GuestDao gDao = new GuestDao();
	
	//저장
	gDao.contentAdd(gVo);
	
	//리스트
	List<GuestVo> gList = gDao.getList();
	
	//리다이렉트
	response.sendRedirect("./addList.jsp"); 
%>