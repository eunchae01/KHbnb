<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<script type="text/javascript">
$(function () {
    $('#day').daterangepicker({
        "locale": {
            "format": "YYYY-MM-DD",
            "separator": " ~ ",
            "applyLabel": "확인",
            "cancelLabel": "취소",
            "fromLabel": "From",
            "toLabel": "To",
            "customRangeLabel": "Custom",
            "weekLabel": "W",
            "daysOfWeek": ["월", "화", "수", "목", "금", "토", "일"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            "firstDay": 1
        },
        "drops": "down"
    }, function (start, end, label) {
        console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
    });
});
</script>
</head>
<body>
	<div align="center">
		<hr width="50%" color="red">
		<h3>숙소 목록</h3>
		<hr width="50%" color="red">
		<br>

		<table border="1" cellspacing="0" width="400">
			<tr>
				<th>숙소코드</th>
				<th>호스트 코드</th>
				<th>숙소이름</th>
				<th>숙소 위치</th>
			</tr>

			<c:set var="list" value="${List }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.getAcc_code() }</td>
						<td>${dto.getAcc_host() }</td>
						<td>${dto.getAcc_name() }</td>
						<td>${dto.getAcc_addr() }</td>
						<td>
							<form method="post"
								action="<%=request.getContextPath()%>/wish_add.do">
								<input type="hidden" name="acc_code"
									value="${dto.getAcc_code() }"> <input type="hidden"
									name="acc_image1" value="${dto.getAcc_image1() }"> <input
									type="hidden" name="acc_addr" value="${dto.getAcc_addr() }">
								<input type="hidden" name="acc_name"
									value="${dto.getAcc_name() }"> <input type="hidden"
									name="acc_price" value="${dto.getAcc_price() }"> <input
									type="hidden" name="acc_maxp" value="${dto.getAcc_maxp() }">
								<input type="hidden" name="acc_bedroom"
									value="${dto.getAcc_bedroom() }"> <input type="hidden"
									name="acc_bed" value="${dto.getAcc_bed() }"> <input
									type="hidden" name="acc_bath" value="${dto.getAcc_bath() }">
								<input type="hidden" name="acc_star"
									value="${dto.getAcc_star() }"> <input type="submit"
									value="찜">
							</form>
						</td>
					</tr>
				</c:forEach>
				
				
			</c:if>

			<c:if test="${empty list }">
				<tr>
					<td colspan="4" align="center">
						<h3>전체 사원 리스트가 없습니다.....</h3>
					</td>
				</tr>
			</c:if>

		</table>
		<c:forEach items="${list }" var="dto">
		<form method="post" action="<%=request.getContextPath()%>/payment.do?acc_code=${dto.getAcc_code() }">
			날짜 검색: <input type="text" id="day" name="day">
		 	인원: <input type="number" id="guest" name="guest" value="1" placeholder="게스트 최대" min="1" max="${dto.getAcc_maxp() }">
			
			<input type="hidden" name="${dto.getAcc_code() }" value="${dto.getAcc_code() }">
			<input type="hidden" name="${dto.getAcc_name() }" value="${dto.getAcc_name() }">
			<input type="hidden" name="${dto.getAcc_price() }" value="${dto.getAcc_price() }">
			<input type="hidden" name="${dto.getAcc_image1() }" value="${dto.getAcc_image1() }">
			<input type="hidden" name="${dto.getAcc_addr() }" value="${dto.getAcc_addr() }">
			<input type="hidden" name="${dto.getAcc_star() }" value="${dto.getAcc_star() }">
			<input type="submit" value="예약하기">
			
		</form>
		</c:forEach>
	</div>
</body>
</html>