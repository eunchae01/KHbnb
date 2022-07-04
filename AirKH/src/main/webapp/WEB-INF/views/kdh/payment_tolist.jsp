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
#lis{
	margin-left:500px;
}
.wrapper {
		display: flex;
		flex-direction: column;
		height: 100%;
		align-items:center;
		
	}
	
	.container0 {
		width:90%;
	}


.cont-table table th,
td {
	border-bottom: 1px solid lightgray;
}

.cont-table table td {
	padding: 20px 0;
}

.cont-table table th {
	width: 200px;
}

.cont-table table td img {
	width: 160px;
}


</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


</head>
<body>
	<div class="wrapper">
		<div class="container0">	
		<jsp:include page="main_navi.jsp"/>
<c:set var="list" value="${palist }"/>
	
	

	<div align="center">
		
		<br>
			<h3>결제 매출액 목록 페이지</h3>
		
		<br>
		<div class="cont-hotel">
		<table border="0" cellspacing="0" width="850">
		
			
			<c:set var="paging" value="${Paging }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
				<tr>
					
					<td align ="center">
					${dto.acc_name }</a></td>
					<td align ="center">\<fmt:formatNumber>${dto.acc_price }</fmt:formatNumber>원</td>
					<td align ="center"> ${dto.cart_date.substring(0,10) }</td>
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
			
			
			
		
		</table>
		
		</div>
		<br>
		
		<input type="button" class="btn btn-primary" id="lis" value="결제목록"
			               onclick="location.href='payment_list.do?page=${paging }'">
		
	<br>	
		<div align="center" id="navi-next">
		<h2>총숙소의 매출액: \<fmt:formatNumber>${tot}</fmt:formatNumber>원</h2>
	
	</div>
		
		
			</div>
		</div>
	</div>

</body>
</html>