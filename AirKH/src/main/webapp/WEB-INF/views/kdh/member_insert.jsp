<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="main_navi.jsp"/>
</head>
<body>
	
	<div align="center">

	<hr width="50%" color="red">
		<h2> 회원테이블 입력페이지</h2>
	<hr width="50%" color="red">
	
		<form method="post" action="<%=request.getContextPath() %>/member_insert_ok.do">
			<table border="1" cellspacing="0" width="450">
				<tr>
					<th>회원아이디</th>
					<td><input name="member_id">
					</td>
				</tr>
				
				<tr>
					<th>회원닉네임</th>
					<td><input name="member_nickname">
					</td>
				</tr>
				
				<tr>
					<th>회원 이름</th>
					<td><input name="member_name">
					</td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="member_pwd">
					</td>
				</tr>
				
				<tr>
					<th>회원 주소</th>
					<td><input name="member_addr">
					</td>
				</tr>
				
				<tr>
					<th>회원 휴대폰번호</th>
					<td><input name="member_phone">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="회원 등록">&nbsp;&nbsp;
					<input type="reset" value="다시작성">
					</td>
				</tr>
				
				
			
			
			</table>
		
		
		</form>
	
	
</div>
	

</body>
</html>