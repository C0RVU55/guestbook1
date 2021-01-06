<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ page import= "java.util.List" %>
<%@ page import= "com.javaex.sec.GuestVo2" %>
<%@ page import= "com.javaex.sec.GuestDao2" %>
    
<%--
	***삭제 방식2 : no를 받은 후 해당 no값인 데이터를 전부 불러와서 비번값 비교하는 게(쿼리문 2개 필요) 아닌 쿼리문 하나에서 no와 pw를 비교함. 
	1. DB에서 where no = ? and password = ? 로 조건 2개 걸어둔 쿼리문으로 contentDelete()를 만듦 
	2. delete.jsp에서 no, password값을 받아서 조건문으로 no에 맞는 pw일 때만 contentDelete()가 실행되게 함.
	3. 조건 충족이 안 될 때 안내문구를 띄우고 deleteForm.jsp로 redirect 시킴.
--%>

<%
	request.setCharacterEncoding("UTF-8");

	GuestDao2 gDao = new GuestDao2();
	List<GuestVo2> gList = gDao.getList();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestbook1 삭제 다른 방식</title>
</head>
<body>

	<!-- *****입력창***** -->
	<form action="./add2.jsp" method="post">
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
			<td><a href="./deleteForm2.jsp?no=<%=gList.get(i).getNo() %>">삭제</a></td>
		</tr>
		<tr>
			<td colspan="4"><%=gList.get(i).getContent()%></td>
		</tr>
	</table>
	<br>
	<%} %>

</body>
</html>