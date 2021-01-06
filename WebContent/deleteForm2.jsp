<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ page import= "com.javaex.sec.GuestVo2"%>
<%@ page import= "com.javaex.sec.GuestDao2"%>

<%
	request.setCharacterEncoding("UTF-8");

	int no = Integer.parseInt(request.getParameter("no"));
	
	//GuestDao2 gDao = new GuestDao2();
	//GuestVo2 gVo = gDao.getData(no);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestbook1 삭제 다른 방식</title>
</head>
<body>

	<form action="./delete2.jsp" method="post">
		비밀번호 <input type="text" name="password"> 
		<button type="submit">확인</button>
		<!--코드 no--> <input type="hidden" name="no" value="<%=no%>"> <!-- no에 맞는 방명록 데이터를 불러올 필요없이 addList2에서 받은 no 그대로 쓰면 됨. -->

	</form>
	
	<a href="./addList2.jsp">메인으로 돌아가기</a>
	
</body>
</html>