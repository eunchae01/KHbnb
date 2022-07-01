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
function approve() {
	alert("클릭");
	$("#check_o").css('display','none');
	$("#approve_list").css('display','block');
}

function check_out() {
	alert("클릭");
	$("#check_o").css('display','block');
	$("#approve_list").css('display','none');
}


</script>
<style type="text/css">
.con1 {
	margin-top: 150px;
	margin-left: 10%;
	margin-right: 10%;
}

.con3 {
	margin-bottom: 100px;
}

.con2 {
	float: none;
	margin-left: 3%;
	margin-right: 3%;
	margin-left: 3%;
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

#btn1 {
	
}

#approve_list {
	
}

.con4 {
	margin-top: 50px;
	width: 100%;
	height: 200px;
	background-color: #eeeeee;
	width: 100%;
}

button {
	background-color: white;
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
	<c:set var="list4" value="${update }" />
	<c:set var="list5" value="${approve }" />
	<jsp:include page="../jdy/include/host_top.jsp"></jsp:include>


	<div class="con1">
		<div class="con3">
			<table width="100%">
				<tr>
					<td><h2>예약</h2></td>
					<td align="right">모든 예약 (${fn:length(list)})개</td>
				</tr>
			</table>
		</div>


		<div class="con2">
			<div>
				<button class="btn" onclick="check_out()" id="one">체크아웃
					예정(건)</button>
				<button onclick="check_in()" class="btn" id="two">체크인 예정(건)</button>
				<button class="btn" id="three">예정(건)</button>
				<button class="btn" id="four">변경 요청된 예약(건)</button>
				<button onclick="approve()" class="btn" id="five">예약 승인(${fn:length(list5)}건)</button>
			</div>

			<div class="con4">

				<div id="check_o">
					<table>
						<tr>
							<td>숙소 이름</td>
							<td>예약자 성함</td>
							<td>예약자 번호</td>
							<td>체크인 날짜</td>
							<td>체크아웃 날짜</td>
							<td>결재 금액</td>
						</tr>
						<c:if test="${!empty list1 }">
							<c:forEach items="${list1 }" var="dto1">
								<tr>
									<td>${dto1.getAcc_name() }</td>
									<td>${dto1.getMember_name() }</td>
									<td>${dto1.getMember_phone() }</td>
									<td>${dto1.getCheck_in() }</td>
									<td>${dto1.getCheck_out() }</td>
									<td>₩<fmt:formatNumber value="${dto1.getAcc_price() }" /></td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
				<div id="approve_list">
					<table>
						<tr>
							<td>숙소 이름</td>
							<td>예약자 성함</td>
							<td>예약자 번호</td>
							<td>체크인 날짜</td>
							<td>체크아웃 날짜</td>
							<td>결재 금액</td>
							<td>예약 상태</td>
						</tr>

						<c:if test="${!empty list5 }">
							<c:forEach items="${list5 }" var="dto5">
								<tr>
									<td>${dto5.getAcc_name() }</td>
									<td>${dto5.getMember_name() }</td>
									<td>${dto5.getMember_phone() }</td>
									<td>${dto5.getCheck_in() }</td>
									<td>${dto5.getCheck_out() }</td>
									<td>₩<fmt:formatNumber value="${dto5.getAcc_price() }" /></td>
									<td>${dto5.getReserve_info() }</td>
								</tr>

							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</div>


</body>
</html>