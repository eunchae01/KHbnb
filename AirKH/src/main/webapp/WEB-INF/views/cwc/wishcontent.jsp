<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}

table {
	width: 100%
}

img {
	max-width: 100%;
	max-height: 100%;
	padding: 0px
}

.wcontainer {
	width: 100%;
	margin:10px;
}
.tcontainer {
	margin:10px;
	margin-top: 100px;
}

.back a {
	font-size: 50px;
	text-decoration: none;
	color: black;
}
.wl{
	margin-bottom: 20px;
}
table {
	width: 90%;
}
td{
padding: 10px;}
</style>
</head>
<body>
	<jsp:include page="../jdy/include/main_top.jsp"></jsp:include>
	<c:set var="list" value="${wishList }" />

	<div class="wcontainer">

		<div class="tcontainer">
		<div class="wl">
			<h1>위시 리스트</h1>
		</div>
		
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<table>
						<tr>
							<td rowspan="4" width="400px" height="250px"><a href="<%=request.getContextPath()%>/acc_content.do?no=${dto.getAcc_code() }"><img
								src="<%=request.getContextPath() %>/resources/upload/2022-06-13/${dto.getAcc_thumbnail() }"
								alt="" class="thumbnail" width="400px" height="250px" /></a></td>
							<td>${dto.getAcc_name() }</td>
							<td align="right">
							
							<font color="red"> <input
									type="button" value="♥" style="color: red;"
									onclick="if(confirm('삭제하시겠습니까?')) {
                       location.href='wish_delete.do?acc_code=${dto.getAcc_code() }'
                       }else { return; }"></font></td>
						</tr>

						<tr>
							<td colspan="2">${dto.getAcc_addr() }</td>
						</tr>

						<tr>
							<td colspan="2">최대 인원 ${dto.getAcc_maxp() } · 침실
								${dto.getAcc_bedroom() } · 침대 ${dto.getAcc_bed() } · 욕실
								${dto.getAcc_bath() }</td>
						</tr>

						<tr>
							<td><font color="red">★</font>${dto.getAcc_star() }</td>
							<td align="right">₩<fmt:formatNumber value="${dto.getAcc_price() }" />/박
							</td>
						</tr>
					</table>
					
					<hr color="#f1f1f1">
				</c:forEach>
			</c:if>
		</div>
	</div>
</body>
</html>