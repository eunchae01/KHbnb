<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/sty.css" />
<jsp:include page="main_navi.jsp"/>
</head>



<body>

<div align="center">
	<br>
		<h2>전체 숙소 리스트</h2>
<br>
		<div class="flex2">

	<c:set var="list" value="${halist}"/>
	
	<c:if test="${!empty list }">
		<c:forEach items="${list }" var="dto">
			<div class="each_item2">
				<a href="<%=request.getContextPath() %>/hacc_content.do?no=${dto.acc_code}">
					<img src="<%=request.getContextPath()%>/resources/upload/2022-06-13/${dto.acc_thumbnail}" width="450px">
				<br>
				
				${dto.acc_city }<br>
				\<fmt:formatNumber>${dto.acc_price }</fmt:formatNumber>원/박
				
				</a>
			
			</div>
		
		
		</c:forEach>
	
	
	</c:if>
	
	


</div>
<div class="each_items2">
		 <input type="button" value="숙소등록"
	                 onclick="location.href='hacc_insert.do'">
	</div>
</div>

</body>
</html>