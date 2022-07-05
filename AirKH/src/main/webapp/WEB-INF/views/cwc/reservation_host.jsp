<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	
</script>
<script type="text/javascript">
	function check_out() {
		$("#check_o").css('display', 'block');
		$("#check_i").css('display', 'none');
		$("#check_p").css('display', 'none');
		$("#approve_list").css('display', 'none');
	}
	function check_in() {
		$("#check_i").css('display', 'block');
		$("#approve_list").css('display', 'none');
		$("#check_p").css('display', 'none');
		$("#check_o").css('display', 'none');
	}
	function check_pre() {
		$("#check_p").css('display', 'block');
		$("#check_i").css('display', 'none');
		$("#approve_list").css('display', 'none');
		$("#check_o").css('display', 'none');
	}
	function approve() {
		$("#approve_list").css('display', 'block');
		$("#check_o").css('display', 'none');
		$("#check_i").css('display', 'none');
		$("#check_p").css('display', 'none');
	}
</script>
<style type="text/css">
.con1 {
	margin-top: 150px;
	margin-left: 5%;
	margin-right: 5%;
}

.con3 {
	margin-bottom: 100px;
}

.con2 {
	float: none;
	margin-left: 3%;
	margin-right: 3%;
	margin-left: 3%;
	margin-bottom: 100px;
}

.btn {
	width: 200px;
	height: 50px;
	background-color: white;
	text-align: center;
	border: solid 2px grey;
	border-radius: 20px;
	text-align: center
}

.con4 {
	margin-left: 3%;
	margin-right: 3%;
}

#approve_list {
	display: none;
}

#check_i {
	display: none;
}

#check_p {
	display: none;
}
</style>

<script type="text/javascript">
	
</script>
</head>
<body>
	<c:set var="list" value="${List }" />
	<c:set var="list1" value="${out }" />
	<c:set var="list2" value="${in }" />
	<c:set var="list3" value="${pre }" />
	<c:set var="list4" value="${approve }" />
	
	<jsp:include page="../jdy/include/host_top.jsp"></jsp:include>


	<div class="con1">
		<div class="con3">
			<table width="100%">
				<tr>
					<td><h2>예약</h2></td>
					<td align="right"> 예약 (<font
						style="color: blue; font-weight: bold;">${fn:length(list)}</font>)개
					</td>
				</tr>
			</table>
		</div>


		<div class="con2">
			<button class="btn" onclick="check_out()" id="one">체크아웃
				예정(${fn:length(list1)}건)</button>
			<button onclick="check_in()" class="btn" id="two">체크인
				예정(${fn:length(list2)}건)</button>
			<button onclick="check_pre()" class="btn" id="three">예정(${fn:length(list3)}건)</button>
			<button onclick="approve()" class="btn" id="five">예약 승인(${fn:length(list4)}건)</button>
		</div>


		<div class="con4">
		
			<div id="check_o">
				<h2>체크아웃 예정:</h2>
				<hr>
				<br> <br>
				<div align="center">
					<c:if test="${!empty list1 }">
						<c:forEach items="${list1 }" var="dto1">
							<table width="80%" height="400px"
								style="border-top: 2px solid gray;">

								<tr>
									<td colspan="3" height="30%"
										style="vertical-align: bottom; padding-left: 50px;"><h2>${dto1.getAcc_name() }</h2></td>
									<td width="30%" rowspan="5"><a
										href="<%=request.getContextPath()%>/acc_content.do?no=${dto1.getAcc_code() }">
											<img
											src="<%=request.getContextPath() %>/resources/upload/2022-06-13/${dto1.getAcc_thumbnail() }"
											alt="" class="thumbnail" width="100%" height="100%" />
									</a></td>
								</tr>

								<tr>
									<td style="vertical-align: top; padding-left: 70px;"
										colspan="3">${dto1.getAcc_addr() }*게스트
										${dto1.getCheck_person() }명</td>
								</tr>

								<tr>
									<td align="left"
										style="vertical-align: bottom; padding-left: 50px;">체크인
										날짜</td>
									<td align="left" style="vertical-align: bottom;">체크아웃 날짜</td>
									<td></td>

								</tr>

								<tr>
									<td align="left"
										style="vertical-align: top; padding-left: 50px;">${dto1.getCheck_in() }</td>
									<td align="left" style="color: red; vertical-align: top;">${dto1.getCheck_out() } /12:00  퇴실 예정</td>
									<td></td>
								</tr>

								<tr>
									<td style="height: 20px; padding-left: 50px;">예약자 성함:
										${dto1.getMember_name() }</td>
									<td>예약자 번호: ${dto1.getMember_phone() }</td>
									<td>결재 금액: ₩<fmt:formatNumber
											value="${dto1.getAcc_price() }" />원</td>
								</tr>

							</table>
							<br>
							<hr>
							<br>
						</c:forEach>
					</c:if>
					<c:if test="${empty list1 }">
						<br>
						<br>
						<br>
						<div align="center">
							오늘과 내일은 체크아웃하는 <br> 게스트가 없습니다.
						</div>
					</c:if>
				</div>
			</div>

			<div id="check_i">
				<h2>체크인 예정:</h2>
				<hr>
				<br> <br>
				<div align="center">
					<c:if test="${!empty list2 }">
						<c:forEach items="${list2 }" var="dto2">
							<table width="80%" height="400px"
								style="border-top: 2px solid gray;">

								<tr>
									<td colspan="3" height="30%"
										style="vertical-align: bottom; padding-left: 50px;"><h2>${dto2.getAcc_name() }</h2></td>
									<td width="30%" rowspan="5"><a
										href="<%=request.getContextPath()%>/acc_content.do?no=${dto2.getAcc_code() }">
											<img
											src="<%=request.getContextPath() %>/resources/upload/2022-06-13/${dto2.getAcc_thumbnail() }"
											alt="" class="thumbnail" width="100%" height="100%" />
									</a></td>
								</tr>

								<tr>
									<td style="vertical-align: top; padding-left: 70px;"
										colspan="3">${dto2.getAcc_addr() }*게스트
										${dto2.getCheck_person() }명</td>
								</tr>

								<tr>
									<td align="left"
										style="vertical-align: bottom; padding-left: 50px;">체크인
										날짜 </td>
									<td align="left" style="vertical-align: bottom;">체크아웃 날짜</td>
									<td></td>

								</tr>

								<tr>
									<td align="left"
										style="color: red; vertical-align: top; padding-left: 50px;">${dto2.getCheck_in() } /15:00 입실 예정</td>
									<td align="left" style="vertical-align: top;">${dto2.getCheck_out() }</td>
									<td></td>
								</tr>

								<tr>
									<td style="height: 20px; padding-left: 50px;">예약자 성함:
										${dto2.getMember_name() }</td>
									<td>예약자 번호: ${dto2.getMember_phone() }</td>
									<td>결재 금액: ₩<fmt:formatNumber
											value="${dto2.getAcc_price() }" />원</td>
								</tr>

							</table>
							<br>
							<hr>
							<br>
						</c:forEach>
					</c:if>
					<c:if test="${empty list2 }">
						<br>
						<br>
						<br>
						<div align="center">
							오늘과 내일은 체크인하는 <br> 게스트가 없습니다.
						</div>
					</c:if>
				</div>
			</div>


			<div id="check_p">
				<h2>예정:</h2>
				<hr>
				<br> <br>
				<div align="center">
					<c:if test="${!empty list3 }">
						<c:forEach items="${list3 }" var="dto3">
							<table width="80%" height="400px"
								style="border-top: 2px solid gray;">

								<tr>
									<td colspan="3" height="30%"
										style="vertical-align: bottom; padding-left: 50px;"><h2>${dto3.getAcc_name() }</h2></td>
									<td width="30%" rowspan="5"><a
										href="<%=request.getContextPath()%>/acc_content.do?no=${dto3.getAcc_code() }">
											<img
											src="<%=request.getContextPath() %>/resources/upload/2022-06-13/${dto3.getAcc_thumbnail() }"
											alt="" class="thumbnail" width="100%" height="100%" />
									</a></td>
								</tr>

								<tr>
									<td style="vertical-align: top; padding-left: 70px;"
										colspan="3">${dto3.getAcc_addr() }*게스트
										${dto3.getCheck_person() }명</td>
								</tr>

								<tr>
									<td align="left"
										style="vertical-align: bottom; padding-left: 50px;">체크인
										날짜</td>
									<td align="left" style="vertical-align: bottom;">체크아웃 날짜</td>
									<td></td>

								</tr>

								<tr>
									<td align="left"
										style="vertical-align: top; padding-left: 50px;">${dto3.getCheck_in() }</td>
									<td align="left" style="vertical-align: top;">${dto3.getCheck_out() }</td>
									<td><a style="text-decoration: underline;"
										href="javascript:void(0);"
										onclick="if(confirm('게스트의 예약을 취소하시겠습니까?')) {
											location.href='cart_cancel.do?cart_num=${dto3.getCart_num() }'}else {return; }">예약 취소</a></td>
								</tr>

								<tr>
									<td style="height: 20px; padding-left: 50px;">예약자 성함:
										${dto3.getMember_name() }</td>
									<td>예약자 번호: ${dto3.getMember_phone() }</td>
									<td>결재 금액: ₩<fmt:formatNumber
											value="${dto3.getAcc_price() }" />원</td>
								</tr>

							</table>
							<br>
							<hr>
							<br>
						</c:forEach>
					</c:if>
					<c:if test="${empty list3 }">
						<br>
						<br>
						<br>
						<div align="center">현재 예정된 게스트가 없습니다.</div>
					</c:if>
				</div>
			</div>

			<div id="approve_list">
				<h2>예약 승인:</h2>
				<hr>
				<br><br>
				<div align="center">
					<c:if test="${!empty list4 }">
						<c:forEach items="${list4 }" var="dto4">
							<table width="80%" height="400px"
								style="border-top: 2px solid gray;">

								<tr>
									<td colspan="3" height="30%"
										style="vertical-align: bottom; padding-left: 50px;"><h2>${dto4.getAcc_name() }</h2></td>
									<td width="30%" rowspan="5"><a
										href="<%=request.getContextPath()%>/acc_content.do?no=${dto4.getAcc_code() }">
											<img
											src="<%=request.getContextPath() %>/resources/upload/2022-06-13/${dto4.getAcc_thumbnail() }"
											alt="" class="thumbnail" width="100%" height="100%" />
									</a></td>
								</tr>

								<tr>
									<td style="vertical-align: top; padding-left: 70px;"
										colspan="3">${dto4.getAcc_addr() }*게스트
										${dto4.getCheck_person() }명</td>
								</tr>

								<tr>
									<td align="left"
										style="vertical-align: bottom; padding-left: 50px;">체크인
										날짜</td>
									<td align="left" style="vertical-align: bottom;">체크아웃 날짜</td>
									<td></td>

								</tr>

								<tr>
									<td align="left"
										style="vertical-align: top; padding-left: 50px;">${dto4.getCheck_in() }</td>
									<td align="left" style="vertical-align: top;">${dto4.getCheck_out() }</td>
									<td><a style="text-decoration: underline;"
										href="javascript:void(0);"
										onclick="if(confirm('게스트의 숙소 예약을 승인하시겠습니까?')) {
											location.href='cart_approve.do?cart_num=${dto4.getCart_num() }'}else {return; }">
											<c:choose>
												<c:when test="${dto4.getReserve_info()=='0'}">예약 승인 대기 중</c:when>
											</c:choose>
									</a></td>
								</tr>
								
								<tr>
									<td style="height: 20px; padding-left: 50px;">예약자 성함:
										${dto4.getMember_name() }</td>
									<td>예약자 번호: ${dto4.getMember_phone() }</td>
									<td>결재 금액: ₩<fmt:formatNumber
											value="${dto4.getAcc_price() }" />원</td>
								</tr>
							</table>
							<br>
							<hr>
							<br>
						</c:forEach>
					</c:if>

					<c:if test="${empty list4 }">
						<br>
						<br>
						<br>
						<div align="center">
							예약을 요청한 <br> 게스트가 없습니다.
						</div>
					</c:if>
				</div>
				
			</div>
		</div>
	</div>

</body>
</html>
