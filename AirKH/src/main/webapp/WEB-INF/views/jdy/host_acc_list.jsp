<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 숙소 조회</title>
</head>
<body>

	<c:set var="list" value="${List }" />
		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="adto">
				<a href="<%=request.getContextPath()%>/host_acc_cont.do?no=${adto.acc_code}">
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
		
		<a href="<%=request.getContextPath()%>/acc_insert.do?no=1">숙소 등록(사진등록!!!!)</a>
		
		
		

</body>
</html>