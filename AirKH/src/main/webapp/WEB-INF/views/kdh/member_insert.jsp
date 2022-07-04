<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style type="text/css">

.wrapper {
		display: flex;
		flex-direction: column;
		height: 100%;
		align-items:center;
		
	}
	
	.container0 {
		width:90%;
	}


</style>


</head>
<body>
	<div class="wrapper">
		<div class="container0">
		<jsp:include page="main_navi.jsp"/>
			<div align="center">

	<br>
		<h2> 회원테이블 입력페이지</h2>
	<br>
	
		<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/member_insert_ok.do">
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
				
					<th>회원사진</th>
		   	        <td> <input type="file" name="file1"> </td>
					
				</tr>
				
				<tr>
					<th>회원 휴대폰번호</th>
					<td><input name="member_phone">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
					<input type="submit" class="btn btn-primary" value="회원 등록">&nbsp;&nbsp;
					<input type="reset" class="btn btn-primary" value="다시작성">
					</td>
				</tr>
				
				
			
			
			</table>
		
		
		</form>
		</div>
	</div>
</div>
	

</body>
</html>