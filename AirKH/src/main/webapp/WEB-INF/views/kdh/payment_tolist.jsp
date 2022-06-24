<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#navi-next{
margin-right:300px;
}
</style>


</head>
<body>

<jsp:include page="main_navi.jsp"/>
<c:set var="list" value="${palist }"/>
	
	

	<div align="center">
		
		<br>
			<h3>결제 매출액 목록 페이지</h3>
		
		<br>
		
		<table border="0" cellspacing="0" width="450">
			<tr>
				<th>숙소 이름</th>
				<th>결제 금액</th> <th>숙소 결제일</th>
			</tr>
			
			<c:set var="paging" value="${Paging }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
				<tr>
					
					<td>
					${dto.acc_name }</a></td>
					<td>\<fmt:formatNumber>${dto.acc_price }</fmt:formatNumber>원</td>
					<td> ${dto.cart_date.substring(0,10) }</td>
				</tr>
				
				
					<c:set var="tot" value="${tot+dto.acc_price}"/>
					<c:set var="name" value="${dto.acc_name }"/>
				
				</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="3" align="center">
						<h3>검색된 결제목록이 없습니다.</h3>
					</td>
				</tr>
			</c:if>
			
			<tr>
				<td colspan="3" align="right">
					<input type="button" value="결제목록"
			               onclick="location.href='payment_list.do?page=${paging }'">
				</td>
			</tr>
			
		
		</table>
		<br>
		
		<div align="right" id="navi-next">
		<h2>${name } 숙소별 매출액: ${tot }원</h2>
	
	</div>
		
		
		
	
	</div>

</body>
</html>