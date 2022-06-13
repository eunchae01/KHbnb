<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>회원 탈퇴페이지</h1>
		<br>
		
		<h3>회원탈퇴 안내</h3>
		<h5>지금까지 저희 사이트를 이용해주셔서 감사합니다.</h5>
		<h5>회원을 탈퇴하면 나의 계정 정보 및 모든 내역이 삭제되고 복구 할 수 없습니다.</h5>
		
		
		<form method="post" action="<%=request.getContextPath() %>/delete-user-ok.do">
			<input type="checkbox" name="confirm" value="delete">위 내용에 동의합니다.
			<br><br>
			<input type="submit" value="탈퇴하기">
		</form>
	</div>
</body>
</html>