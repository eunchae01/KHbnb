<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<div align="center">

<hr width="50%" color="marmoon">
	      <h3>테이블 로그인 페이지</h3>
	   <hr width="50%" color="marmoon">
	   <br>
		<form method="post" action="<%=request.getContextPath() %>/admin_login.do">
		<table border="1" cellspacing="0" width="350">
			<tr>
				<th>관리자 아이디</th>
				<td> <input name="admin_id"></td>
			</tr>
			
			<tr>
				<th>관리자 비밀번호</th>
				<td> <input type="password" name="admin_pwd"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="다시작성">
				</td>
			</tr>
				
		
		
		</table>
		
		
		
		</form>
		
		</div>

	
</body>
</html>