<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 숙소 상세</title>
</head>
<body>
	<jsp:include page="./include/host_top.jsp" />
	
	<c:set var="dto" value="${Cont }" />
	<c:set var="list" value="${oList }" />
	<c:set var="off" value="${offer }" />
	
	<table border="1" cellspacing="0" width="900">
		<tr>
			<th>숙소 이름</th>
			<td>${dto.acc_name }</td>
		</tr>
		
		<tr>
			<th>숙소 테마</th>
			<td>${dto.acc_theme }</td>
		</tr>
		
		<tr>
			<th>숙소 설명</th>
			<td>${dto.acc_detail }</td>
		</tr>
		
		<tr>
			<th>숙소 연락처</th>
			<td>${dto.acc_phone }</td>
		</tr>
		
		<tr>
			<th>숙소 위치</th>
			<td>
				주소 : ${dto.acc_addr}, ${dto.acc_city }, ${dto.acc_country }<br>
				우편번호 : ${dto.acc_mail }
			</td>
		</tr>
		
		<tr>
			<th>숙소 가격</th>
			<td>
				<fmt:formatNumber value="${dto.acc_price }" />&nbsp;&bsol;
			</td>
		</tr>
		
		<tr>
			<th>건물 유형</th>
			<td>${dto.acc_build }</td>
		</tr>
		
		<tr>
			<th>숙소 유형</th>
			<td>${dto.acc_type }</td>
		</tr>
		
		<tr>
			<th>최대 숙박 인원</th>
			<td>${dto.acc_maxp }</td>
		</tr>
		
		<tr>
			<th>침실, 욕실</th>
			<td>
				침실수 : ${dto.acc_bedroom }&nbsp;
				침대수 : ${dto.acc_bed }&nbsp;
				욕실수 : ${dto.acc_bath }
			</td>
		</tr>
		
		<tr>
			<th>편의 시설</th>
			<td>
				<c:forEach items="${off }" var="arr">
					<c:forEach items="${list }" var="odto">
						<c:if test="${arr eq odto.offer_code }">
								<span class="offer-name">${odto.offer_name }&nbsp;| </span>
						</c:if>
					</c:forEach>
				</c:forEach>
			</td>
		</tr>
		
		<tr>
			<th>숙소 사진</th>
			<td>
				<img width="200px" class="acc-image" src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_thumbnail }" alt="" />
				<img width="200px" class="acc-image" src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_image1 }" alt="" />
				<img width="200px" class="acc-image" src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_image2 }" alt="" />
				<img width="200px" class="acc-image" src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_image3 }" alt="" />
				<img width="200px" class="acc-image" src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_image4 }" alt="" />
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<button type="button"
					onclick="location.href='host_acc_modify.do?no=${dto.acc_code}'">수정</button>
				<button type="button" value="삭제"
					onclick="location.href='host_adelete.do?no=${dto.acc_code}&num=${host_num }'">삭제</button>
			</td>
		</tr>
	</table>
						
</body>
</html>