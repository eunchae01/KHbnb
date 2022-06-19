<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../jdy/include/main_top.jsp"/>

	<div align="center">
		<div>
			<h3><a href="<%=request.getContextPath() %>/find-host.do">호스트 아이디 / 비밀번호 찾기</a></h3>
		</div>
		
		<div>
			<h3><a href="<%=request.getContextPath() %>/find-member.do">멤버 아이디 / 비밀번호 찾기</a></h3>
		</div>
	</div>
</body>
</html>