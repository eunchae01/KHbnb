<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
	.container{
		margin: 200px auto;
		height: 500px;
	}

	.sign-up1{
		float:left;
		margin-left: 30%;
	}
	
	.sign-up2{
		float:right;
		margin-right: 30%;
	}
	
</style>
</head>
<body>
	<jsp:include page="../jdy/include/main_top.jsp"/>

	<div align="center" class="container">
		<div class="sign-up1">
			<img width="200" src="<%=request.getContextPath() %>/resources/assets/avatar.png">
			<br><br>
			<button class="btn btn-outline-secondary" onclick="location.href='find-member.do'">멤버 아이디 / 비밀번호 찾기</button>
		</div>
	
		<div class="sign-up2">
			<img width="200" src="<%=request.getContextPath() %>/resources/assets/house.png">
			<br><br>
			<button class="btn btn-outline-secondary" onclick="location.href='find-host.do'">호스트 아이디 / 비밀번호 찾기</button>
		</div>
		
	</div>
</body>
</html>