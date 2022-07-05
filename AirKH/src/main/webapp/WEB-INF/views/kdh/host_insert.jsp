<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h3>호스트 입력 페이지</h3>

	<br>
	
	<form method="post" enctype="multipart/form-data"  action="<%=request.getContextPath() %>/host_insert_ok.do">
		<table border="0" cellspacing="0" width="600">
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
					<input type="submit" class="btn btn-primary" value="호스트등록">&nbsp;&nbsp;
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