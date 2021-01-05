<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.javaex.dao.GuestDao" %>
<%@ page import="com.javaex.vo.GuestVo" %>

<%--내용 삭제 폼 --%>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	GuestDao gDao = new GuestDao();
	GuestVo gVo = gDao.getData(no);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestbook1</title>
</head>
<body>

	<form action="./delete.jsp" method="post">
		비밀번호 <input type="text" name="password"> 
		<button type="submit">확인</button>
		<!--코드 no--> <input type="hidden" name="no" value="<%=gVo.getNo() %>">
	<!-- 숨긴 no 없으면 delete.jsp에서 java.lang.NumberFormatException 오류 남.
		delete.jsp에서 파라미터를 no, password 받게 돼 있는데 addList에서 받은 no값이 계속 유지되는 게 아니라서
		비번 입력하고 확인 눌러서 delete.jsp로 넘어갈 때 비번값만 가게 됨. 
		그래서 no의 value값 정해서 가려놓고 입력받은 password값과 같이 delete.jsp로 submit 함.-->
	</form>
	
	<a href="./addList.jsp">메인으로 돌아가기</a>
</body>
</html>