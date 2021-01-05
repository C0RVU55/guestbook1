<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.List" %>
<%@ page import = "com.javaex.dao.GuestDao" %>
<%@ page import = "com.javaex.vo.GuestVo" %>

<%--내용(리스트) 출력 --%>

<%--오류 : 방명록을 등록할 때마다 모든 방명록의 출력시간이 갱신됨 --%>

<%
	GuestDao gDao = new GuestDao();
	List<GuestVo> gList = gDao.getList();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestbook1</title>
</head>
<body>
	
	<h3>방명록</h3>
	
	<!-- *****입력창***** -->
	<form action="./add.jsp" method="post">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
				<td>비밀번호</td>
				<td><input type="text" name="password"></td>
			</tr>
			<tr>
				<td colspan="4"><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="4"><button type="submit">확인</button></td>
			</tr>
		</table>
		<br><br>
	</form>
	
	<!-- *****출력 화면***** -->
	<%for (int i = 0; i < gList.size(); i++) {  %>
	<table border="1">
		<tr>
			<td><%=gList.get(i).getNo() %></td>
			<td><%=gList.get(i).getName() %></td>
			<td><%=gList.get(i).getRegDate() %></td>
			<td><a href="./deleteForm.jsp?no=<%=gList.get(i).getNo() %>">삭제</a></td>
		</tr>
		<tr>
			<td colspan="4"><%=gList.get(i).getContent() %></td>
		</tr>
	</table>
	<br>
	<%} %>

</body>
</html>