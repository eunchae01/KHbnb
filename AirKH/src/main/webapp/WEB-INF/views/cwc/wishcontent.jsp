<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

.container {
	margin-top: 20px;
	margin-left: 20px;
	margin-right: 20px;
}

.container3 {
	margin-left: 15px;
	margin-right: 10px;
}
</style>
</head>
<body>
	<%@ include file="sample.jsp"%>
	<c:set var="list" value="${wishList }" />
	<div><a>←</a></div>
	
	<div class="container3">
		<div>찜</div>


		<div height="300px">
			<c:if test="${!empty list }">
			<c:forEach items="${list }" var="dto">
			<table width="100%" border="1" cellspacing="0">
				<tr>
					<td rowspan="4" width="300px" height="200px">
					${dto.getAcc_image1() }</td>
					<td>${dto.getAcc_name() }</td>
					<td><font color="red">
					<input type="button" value="♥" style="color: red;"
	               	onclick="if(confirm('삭제하시겠습니까?')) {
                       location.href='wish_delete.do?acc_code=${dto.getAcc_code() }'
                       }else { return; }"></font></td>
				</tr>

				<tr>
					<td colspan="2">${dto.getAcc_addr() }</td>
				</tr>

				<tr>
					<td colspan="2">
					최대 인원 ${dto.getAcc_maxp() } ·
					침실 ${dto.getAcc_bedroom() } ·
					침대 ${dto.getAcc_bed() } ·
					욕실 ${dto.getAcc_bath() } 
					</td>
				</tr>

				<tr>
					<td><font color="red">★</font>${dto.getAcc_star() }</td>
					<td>₩<fmt:formatNumber value="${dto.getAcc_price() }"/>/박</td>
				</tr>
				</table>
				</c:forEach>
				</c:if>
		</div>
	</div>
</body>
</html>