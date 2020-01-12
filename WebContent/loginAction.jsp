<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
	%>
	<script type="text/javascript">
		var result =
	<%=result%>
		;
		if (result == 1) {
			location.href = 'main.jsp';
		} else if (result == 0) {
			alert('비밀번호가 틀립니다.');
			history.back();
		} else if (result == -1) {
			alert('존재하지 않는 아이디입니다.');
			history.back();
		} else if (result == -2) {
			alert('DB 오류가 발생했습니다.');
			history.back();
		}
	</script>
</body>
</html>