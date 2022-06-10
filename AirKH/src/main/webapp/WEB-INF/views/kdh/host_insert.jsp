<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="main_navi.jsp"/>

	<div align="center">
		<hr width="50%" color="gray">
		<h3>사업주 회원가입 폼 페이지</h3>
		<hr width="50%" color="gray">
	<br>
	
	<form method="post" action="<%=request.getContextPath() %>/host_insert_ok.do">
		<table border="1" cellspacing="0" width="350">
			<tr>
				<th>사업주 아이디</th>
				<td><input name="host_id">
				</td>
			</tr>
			
			<tr>
				<th>사업주 닉네임</th>
				<td><input name="host_nickname">
				</td>
			</tr>
			
			<tr>
				<th>사업주 이름</th>
				<td><input name="host_name">
				</td>
			</tr>
			
			<tr>
				<th>사업주 비밀번호</th>
				<td><input type="password" name="host_pwd">
			</td>
			
			<tr>
				<th>사업주 주소</th>
				<td><input name="host_addr">
				</td>
			</tr>
			
			<tr>
				<th>사업주 휴대폰번호</th>
				<td><input name="host_phone">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="사업주등록">&nbsp;&nbsp;
					<input type="reset" value="다시작성">
				</td>
			</tr>
			
				
		
		</table>
	
	
	
	</form>
		
	
	
	</div>

</body>
</html>