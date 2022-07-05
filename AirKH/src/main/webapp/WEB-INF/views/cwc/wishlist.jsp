<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.con1 {
	margin-top: 150px;
	margin-left: 12%;
	margin-right: 12%;
}

.con2 {
	margin:10px;
	margin-top: 50px;
	display: block;
}

.img2{
width: 300px;
height: 170px;
}

ul {
	list-style: none;
}

li {
	border: 0;
	float: left;
	padding-right: 40px;
	padding-bottom: 80px;
}

a{
text-decoration: none;
}
</style>
</head>
<body>
	<jsp:include page="../jdy/include/main_top.jsp"></jsp:include>
	<c:set var="list" value="${cateList }" />
	
	<div class="con1">
	
		<div>
			<font style="font-weight: bold; font-size: 40px;">위시 리스트</font>
		</div>

		<div class="con2">
			<ul>
			<c:if test="${!empty list }">
			<c:forEach items="${list }" var="dto" varStatus="index">
				<li><a href="<%=request.getContextPath()%>/wish.content.do?wish_category=${dto.getWish_category() }">
					<img style="width: 350px; height: 200px; border-radius: 5%;"
						src="<%=request.getContextPath() %>
						/resources/upload/2022-06-13/${index.index }.png"
						alt="" class="thumbnail" /><br>
						<font style="font-weight: bold;">${dto.getWish_category() }</font>
				</a></li>
			 </c:forEach>
			 </c:if>	
			</ul>
		</div>
		
	</div>
</body>
</html>
