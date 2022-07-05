<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/host-cont.css" />
<style type="text/css">

.wrapper {
		display: flex;
		flex-direction: column;
		height: 100%;
		align-items:center;
		
	}
	
	.container0 {
		width:90%;
	}

.lin a{
color:black;
	text-decoration: none;
}

#li{
	margin-left:700px;
}


.cont-table{
padding-top:0px;
}
.cont-table table {
	border-spacing: 0;
	margin-bottom: 0px;
}

.cont-table table th,
.cont-table table td {
	border-top: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
	padding: 10px;
	
}

</style>

</head>
<body>
<div class="wrapper">
<div class="container0">
<jsp:include page="main_navi.jsp"/>

	<div align="center">
		
		<br>
			<h3>결제 테이블 전체 목록 페이지</h3>
		
		<br>
		<div class="lin">
		<div class="cont-table">
		<table border="0" cellspacing="0" width="850">
			
			<c:set var="list" value="${palist }"/>
			<c:set var="paging" value="${Paging }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
				<tr>
					
					<td><a href="<%=request.getContextPath() %>/payment_content.do?num=${dto.cart_num}&page=${paging.page }">
					${dto.acc_name }</a></td>
					<td><a href="<%=request.getContextPath() %>/payment_content.do?num=${dto.cart_num}&page=${paging.page }">
					&#65510;<fmt:formatNumber>${dto.acc_price }</fmt:formatNumber>원 </a></td>
					<td> ${dto.cart_date.substring(0,10) }</td>
				</tr>
				
				
					
				
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
		
		
		
		<br>
		
		<c:if test="${paging.getPage() > paging.getBlock() }">
	      <a href="payment_list.do?page=1">[처음으로]</a>
	      <a href="payment_list.do?page=${paging.getStartBlock() - 1 }">◀</a>
	   </c:if>
	   
	   <c:forEach begin="${paging.getStartBlock() }"
	          				end="${paging.getEndBlock() }" var="i">
	      <c:if test="${i == paging.getPage() }">
	         <b> <a href="payment_list.do?page=${i }">[${i }]</a></b>
	      </c:if>
	   
	   	  <c:if test="${i != paging.getPage() }">
	         <a href="payment_list.do?page=${i }">[${i }]</a>
	      </c:if>
	   </c:forEach>

	   <c:if test="${paging.getEndBlock() < paging.getAllPage() }">
	      <a href="payment_list.do?page=${paging.getEndBlock() + 1 }">▶</a>
	      <a href="payment_list.do?page=${paging.getAllPage() }">[마지막으로]</a>
	   </c:if>
	   
	   <br> <br>
		
		
		
		
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../jdy/include/footer.jsp"></jsp:include>
</body>
</html>