<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 숙소 수정</title>
</head>
<body>

	<c:set var="dto" value="${Cont }" />
	<c:set var="list" value="${oList }" />
	<c:set var="off" value="${offer }" />
	
	<form action="<%=request.getContextPath() %>/acc_modify_ok.do" method="post">
		<input type="hidden" name="acc_code" value="${dto.acc_code }" >
		<input type="hidden" name="acc_host" value="${dto.acc_host }" >
		<table>
			<tr>
				<td>숙소 정보 수정 테이블</td>
			</tr>
			
			<tr>
				<td>
					<input name="acc_name" value="${dto.acc_name }" />
				</td>
			</tr>
			
			<tr>
				<td><input type="submit" value="수정"></td>
				<td><input type="button" value="삭제"
					onclick="location.href='host_adelete.do?no=${dto.acc_code}, host=${dto.acc_host}'"></td>
			</tr>
		</table>
	</form>
	
</body>
</html>