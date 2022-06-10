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
	<c:set var="dto" value="${Cont }" />
	<div>${dto.acc_name }</div>
	
	<!-- 호스트 비번 같이 넘겨줘야함. -->
	<button type="button"
					onclick="location.href='host_acc_modify.do?no=${dto.acc_code}'">수정</button>
	<button type="button" value="삭제"
					onclick="location.href='host_adelete.do?no=${dto.acc_code}'">삭제</button>
	
</body>
</html>