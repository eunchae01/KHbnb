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
		<h3>호스트 입력 페이지</h3>
		<hr width="50%" color="gray">
	<br>
	
	<form method="post" enctype="multipart/form-data"  action="<%=request.getContextPath() %>/host_insert_ok.do">
		<table border="1" cellspacing="0" width="450">
			<tr>
				<th>호스트 아이디</th>
				<td><input name="host_id">
				</td>
			</tr>
			
			<tr>
				<th>호스트 닉네임</th>
				<td><input name="host_nickname">
				</td>
			</tr>
			
			<tr>
				<th>호스트 이름</th>
				<td><input name="host_name">
				</td>
			</tr>
			
			<tr>
				<th>호스트 비밀번호</th>
				<td><input type="password" name="host_pwd">
			</td>
			
			<tr>
				<th>호스트 소개</th>
				<td><input name="host_int">
				</td>
			</tr>
			
			<tr>
				<th>호스트 사진</th>
				<td><input type="file" name="file1"> 
				</td>
			</tr>
			
			<tr>
				<th>호스트 휴대폰번호</th>
				<td><input name="host_phone">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="호스트등록">&nbsp;&nbsp;
					<input type="reset" value="다시작성">
				</td>
			</tr>
			
				
		
		</table>
	
	
	
	</form>
		
	
	
	</div>

</body>
</html>