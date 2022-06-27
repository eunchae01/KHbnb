<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.con1 {
	margin-top: 400px;
}
.con2{
margin-bottom: 300px;}
</style>
</head>
<body>
	<jsp:include page="../jdy/include/main_top.jsp"></jsp:include>

	<div class="con1" align="center">

		<div class="con2">
			<h2>예약이 완료되었습니다!</h2>
		</div>
		
		<div>
			<h3><a href="reservation_guest.do">예약 내역 확인하기>></a></h3>
		</div>
	</div>
</body>
</html>