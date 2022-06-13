<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="sample.jsp"%>

<div>
 <div>예약</div>
 <hr>
 
 if(예약 있나 없나) no
 여행 가방에 쌓인 먼지를 털어내고 다음 여행 계획을 세워보세요.
 
 (숙소검색하기)
 yes
 리스트 뿌려주고 
 날짜 변경 요청 가능 => 승인 대기  change1
 예약 취소 가능 => 승인 대기 change2
 인원 변경 => => change3
=> 디폴트 0 1이되면 요청을 한 것 

변경을 했을 경우 yes에서  change값이 1인 경우
=> 호스트의 승인을 대기중입니다.
 </div>
</body>
</html>