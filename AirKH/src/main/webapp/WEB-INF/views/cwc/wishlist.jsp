<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}

.container {
	margin-top: 15px;
	margin-left: 20px;
	margin-right: 10px;
}

.container2 {
	display: flex;
}

ul {
	list-style: none;
}

li {
	border: 0;
	float: left;
	padding-right: 30px;
	padding-bottom: 50px;
}

font {
	font-weight: 700;
	font-size: 37px
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<%@ include file="sample.jsp"%>
	
	<c:set var="list" value="${wishList }" />
	<div class="container">
		<div>
			<font>위시리스트</font>
		</div>

		<div class="container2">
			<ul>
			<c:if test="${!empty list }">
			<c:forEach items="${list }" var="dto">
				<li><a href="<%=request.getContextPath()%>/wish.content.do">
						<div>${dto.getAcc_image1() }</div>
						<div>찜 이름</div>
				</a></li>

			 </c:forEach>
			 </c:if>	
			</ul>
		</div>
	</div>

</body>
</html>