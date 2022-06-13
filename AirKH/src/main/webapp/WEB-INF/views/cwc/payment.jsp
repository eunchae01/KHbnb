<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

body{
width: 100%;
height: 100%;
}

.right{
float: right;
width:30%;
margin-right:40px;
border: 1px solid gray;
}
.left{
width:50%;
float: left;
}
</style>
</head>
<body>
	<%@ include file="sample.jsp"%>

<c:set var="dto" value="${pCont }"/>
	
	<div class="left">
		<div>
			<a>←</a> <span style="font-size: 30px">확인 및 결재</span>
		</div>

		<div>
			<h3>예약정보</h3>
			<div>
				<div>
					<label> 날짜 </label><br>
					<label>${day }</label>
				</div>
				<div>
					<label><a href="#">수정</a></label>
				</div>
			</div>
			<br>
			
			
			<div>
				<div>
					<label> 게스트 </label><br>
					<label>게스트 ${guest } 명</label>
				</div>
				<div>
					<label><a href="#">수정</a></label>
				</div>
			</div>
			
		</div>
		
		<br>
		
		<div>
			<div>
			<h3>결재 수단</h3>
			</div>
			
			<div>
			<input type="text">
			<input type="text">
			<div>
			<input type="text"> <input type="">
			</div>
			<input type="text">
			<input type="text">
			</div>
		
		
		</div>

		<div>
			<div>환불정책</div>
			<div>6월 8일 오후 3:00 전에 예약을 취소하면 첫 1박 요금 및 서비스 수수료를 제외한 요금의 50%가 환불됩니다. <a href="#">자세히 알아보기</a></div>
		</div>
		
		<div>
			<button>결재</button>
		</div>
		</div>
		
		<div class="right">
		<div>
			<div>${dto.getAcc_image1() }</div>
			<div>${dto.getAcc_name() }</div>
			<div>${dto.getAcc_star() }</div>
		</div>
		
		<div>
			<div>요금 세부 정보</div>
			<label>가격</label> <label>₩<fmt:formatNumber value="${dto.getAcc_price() }"/>/박</label><br>
			<label>특별가 제안</label> <label>0</label>
			<hr>
			<div>
			<label>총합 계</label> <label>${dto.getAcc_price()} </label>
			</div>
		</div>
		</div>
</body>
</html>