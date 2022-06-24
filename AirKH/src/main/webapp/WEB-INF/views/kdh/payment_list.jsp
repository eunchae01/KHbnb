<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="main_navi.jsp"/>

	<div align="center">
		
		<br>
			<h3>결제 테이블 전체 목록 페이지</h3>
		
		<br>
		
		<table border="0" cellspacing="0" width="450">
			<tr>
				<th>숙소 이름</th>
				<th>결제 금액</th> <th>숙소 결제일</th>
			</tr>
			<c:set var="list" value="${palist }"/>
			<c:set var="paging" value="${Paging }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
				<tr>
					
					<td><a href="<%=request.getContextPath() %>/payment_content.do?num=${dto.cart_num}&page=${paging.page }">
					${dto.acc_name }</a></td>
					<td>\<fmt:formatNumber>${dto.acc_price }</fmt:formatNumber>원</td>
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
			
			<tr>
				<td colspan="3" align="right">
					<input type="button" value="결제등록" onclick="location.href='payment_insert.do'">
				</td>
			</tr>
			
		
		</table>
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
		
		
		<form method="post" action="<%=request.getContextPath() %>/payment_search.do">
		<input type="hidden" name="page" value="${paging.page}">
			<select name="field">
	        
	         <option value="namem">이름별</option>
	         <option value="paym">월별</option>
	      </select>
	      
	      <input name="keyword">&nbsp;&nbsp;&nbsp;
	      <input type="submit" value="검색">
		
		</form>
		
	
	</div>

</body>
</html>