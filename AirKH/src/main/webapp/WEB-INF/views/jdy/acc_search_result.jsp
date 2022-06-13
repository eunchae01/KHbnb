<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
</head>
<body>
	
	<h1>main 페이지랑 똑같음. 완성하면 복붙</h1>
	
	<c:set var="list" value="${List }" />
		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="adto">
				<a href="<%=request.getContextPath()%>/acc_content.do?no=${adto.acc_code}">
					<span>
						<span>
							<img alt="" src="<%=request.getContextPath() %>/resources/hotel_images/${adto.acc_thumbnail }"
								width="100px">
						</span>
						
						<span>
							<span>
								${adto.acc_name }
							</span>
							<span>
								${adto.acc_country }, ${adto.acc_city }
							</span>
							<span>
								<span>&bsol;<fmt:formatNumber value="${adto.acc_price }" /> /박</span>
								<span>
									${adto.acc_star }
									<i class="fa-solid fa-star"></i>
								</span>
							</span>
						</span>
					</span>
				</a>
			
			</c:forEach>
		</c:if>
		
		<c:if test="${empty list }">
			<h3>숙소 정보 없음!</h3>
		</c:if>

</body>
</html>