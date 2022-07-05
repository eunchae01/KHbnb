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
	margin-left: 5%;
	margin-right: 5%;
}

.con2 {
	margin-left: 3%;
	margin-right: 3%;

}

button {
	background-color: white;
}
</style>
</head>
<body>
	<c:set var="list" value="${List }" />
	<jsp:include page="../jdy/include/main_top.jsp"></jsp:include>

	<div class="con1">
		<h2>여행</h2>
		<hr>

		<div class="con2" align="center">
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<table width="80%" height="400px" style="border-top:2px solid gray;">

						<tr>
							<td colspan="3" height="30%" style="vertical-align : bottom; padding-left: 50px;"><h2>${dto.getAcc_name() }</h2></td>
							<td width="30%" rowspan="5"><a
								href="<%=request.getContextPath()%>/acc_content.do?no=${dto.getAcc_code() }">
									<img
									src="<%=request.getContextPath() %>/resources/upload/2022-06-13/${dto.getAcc_thumbnail() }"
									alt="" class="thumbnail" width="100%" height="100%" />
							</a></td>
						</tr>

						<tr>
							<td style="vertical-align : top; padding-left: 70px;" colspan="3">${dto.getAcc_addr() }*
								게스트 ${dto.getCheck_person() }명</td>
						</tr>
						
						<tr>
							<td align="left" style="vertical-align : bottom;padding-left: 50px;">${dto.getCheck_in() }</td>
							<td align="left" style="vertical-align : bottom;">${dto.getCheck_out() }</td>
							<td></td>

						</tr>

						<tr>
							<td align="left" style="vertical-align : top;padding-left: 50px;">체크인 시간: 15:00</td>
							<td align="left" style="vertical-align : top;">체크아웃 시간: 12:00</td>
							<td>예약자 성함 : ${dto.getMember_name() }</td>
						</tr>

						<tr>
							<td style="height: 20px;padding-left: 50px;"><button style="width: 100%; height: 100%;" type="button" class="btn btn-outline-success"
									data-bs-toggle="modal" data-bs-target="#exampleModal1">
									${dto.getReserve_info() }</button>
									<div class="modal fade" id="exampleModal1" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">
												예약 정보</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
											<p>호스트가 요청한 예약을 승인해야 예약이 완료됩니다...</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>

											</div>
										</div>
									</div>
								</div>
									</td>
							<td><button style="width: 100%; height: 100%;"type="button" class="btn btn-outline-success"
									data-bs-toggle="modal" data-bs-target="#exampleModal2">
									변경 혹은 취소</button>
							
							<div class="modal fade" id="exampleModal2" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">
												여행관리</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
											<p>변경을 원하시면 클릭해주세요: <button onclick="if(confirm('숙소 예약을 변경하시겠습니까?')) {
											location.href='cart_update.do?cart_num=${dto.getCart_num() }'}else {  return; }">변경하기</button> </p>
											<p>취소를 원하시면 클릭해주세요: <button onclick="if(confirm('숙소 예약을 취소하시겠습니까?')) {
	               							location.href='cart_delete.do?cart_num=${dto.getCart_num() }'}else {  return; }">취소하기</button> </p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>

											</div>
										</div>
									</div>
								</div>
								</td>
							<td><button style="width: 100%; height: 100%;"type="button" class="btn btn-outline-success"
									data-bs-toggle="modal" data-bs-target="#exampleModal3">
									호스트 정보 보기</button> <!-- Modal -->
								<div class="modal fade" id="exampleModal3" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">
												호스트 정보</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
											<p>호스트 이름: ${dto.getHost_name() }</p>
											<p>호스트 연락처: ${dto.getHost_phone() }</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>

											</div>
										</div>
									</div>
								</div></td>
						</tr>

					</table>
					<br>
				</c:forEach>
			</c:if>


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
	</div>
</body>
</html>

