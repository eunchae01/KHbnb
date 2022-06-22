<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.con1 {
	margin-top: 150px;
}
</style>
</head>
<body>
	<c:set var="list" value="${List }" />
	<jsp:include page="../jdy/include/main_top.jsp"></jsp:include>

	<div class="con1">
		여행
		<hr>
	</div>

	<div class="con2">
		<table>
			<tr>
				<th>썸네일</th>
				<th>숙소 이름</th>
				<th>숙소 주소</th>
				<th>인원</th>
				<th>체크 인 날짜</th>
				<th>체크 아웃 날짜</th>
				<th>결재 금액</th>
				<th>예약 자 이름</th>
				<th>호스트 이름</th>
				<th>호스트 번호</th>
				<th>예약 상태</th>
			</tr>
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td><a
							href="<%=request.getContextPath()%>/acc_content.do?no=${dto.getAcc_code() }">
								<img
								src="<%=request.getContextPath() %>/resources/upload/2022-06-13/${dto.getAcc_thumbnail() }"
								alt="" class="thumbnail" width="200px" height="200px" />
						</a></td>

						<td>${dto.getAcc_name() }</td>
						<td>${dto.getAcc_addr() }</td>
						<td>${dto.getCheck_person() }</td>
						<td>${dto.getCheck_in() }</td>
						<td>${dto.getCheck_out() }</td>
						<td>${dto.getAcc_price() }</td>
						<td>${dto.getMember_name() }</td>
						<td>${dto.getHost_name() }</td>
						<td>${dto.getHost_phone() }</td>
						<td>${dto.getReserve_info() }</td>
				</c:forEach>
			</c:if>

		</table>

		<c:if test="${empty list }">
			<h2>아직 예약된 여행이 없습니다!</h2>
			<h3>여행 가방에 쌓인 먼지를 털어내고 다음 여행 계획을 세워보세요.</h3>
			<button
				onclick="location.href='<%=request.getContextPath()%>/acc_content.do'">숙소
				검색하기</button>
		</c:if>
		<hr>
		(숙소검색하기) yes 리스트 뿌려주고 날짜 변경 요청 가능 => 승인 대기 change1 예약 취소 가능 => 승인 대기
		change2 인원 변경 => => change3 => 디폴트 0 1이되면 요청을 한 것 변경을 했을 경우 yes에서
		change값이 1인 경우 => 호스트의 승인을 대기중입니다.
	</div>
</body>
</html>

