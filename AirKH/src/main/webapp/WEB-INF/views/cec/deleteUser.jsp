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
	.container1{
		margin: 200px auto;
		height: 500px;
	}
	
	.delete1{
		float:left;
		margin-left: 20%;
		margin-top: 10%;
	}
	
	.delete2{
		float:right;
		margin-right: 15%;
	}
	
	button {
		background-color: white;
	}
	
</style>
</head>
<body>
	<jsp:include page="../jdy/include/main_top.jsp"/>

	<div class="container1">
		<div class="delete1">
			<h2>회원탈퇴 안내</h2>
			<br>
			<h5>지금까지 저희 사이트를 이용해주셔서 감사합니다.</h5>
			<h5>회원을 탈퇴하면 나의 계정 정보 및</h5>
			<h5>모든 내역이 삭제되고 복구 할 수 없습니다.</h5>
			<br>
			
			<input type="button" value="탈퇴하기" class="btn btn-danger" onclick="if(confirm('그래도 탈퇴하시겠습니까?')){location.href='delete-user-ok.do'}else {return;}">
			
		</div>
		
		<div class="delete2">
			<img src="<%=request.getContextPath() %>/resources/assets/architecture-and-city.png">
		</div>
	</div>
</body>
</html>