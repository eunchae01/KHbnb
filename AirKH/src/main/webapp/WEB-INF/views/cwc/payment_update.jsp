<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.con1 {
	margin-top: 100px;
}
</style>

</head>
<body>

	<jsp:include page="../jdy/include/main_top.jsp"></jsp:include>
	<c:set var="dto" value="${dto }" />
	<div class="con1">

		<form method="post"
			action="<%=request.getContextPath() %>/cart_update_ok.do">

			<input type="submit" value="수정하기">
		</form>
	</div>
</body>
</html>