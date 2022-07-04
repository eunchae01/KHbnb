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
		<c:set var="dto" value="${modify }"/>
		<br>
			<h3>호스트 테이블 ${dto.getHost_name() } 회원 정보 수정폼 페이지</h3>
	
		<br>
		
		<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/host_modify_ok.do">
		<input type="hidden" name="host_num" value="${dto.getHost_num() }">
		<input type="hidden" name="host_pic" value="${dto.host_pic}">
		<input type="hidden" name="page" value="${Page }"> 
		<table border="0" cellspacing="0" width="650">
			<tr>
				<th>호스트 아이디</th>
				<td><input name="host_id" value="${dto.getHost_id() }" readonly></td>
			</tr>
			
			<tr>
				<th>호스트 닉네임</th>
				<td><input name="host_nickname" value="${dto.getHost_nickname() }" ></td>
			</tr>
			
			<tr>
				<th>호스트 이름</th>
				<td><input name="host_name" value="${dto.getHost_name() }" readonly></td>
			</tr>
			
			<tr>
				<th>호스트 비밀번호</th>
				<td><input type="password" name="host_pwd" value="${dto.getHost_pwd()}" readonly></td>
			</tr>
			<tr>
				<th>호스트 소개</th>
				<td><input name="host_int" value="${dto.getHost_int() }" size="30" ></td>
			</tr>
		
	        
	        <tr>
	        	<th>호스트 사진</th>
	        	<td>${dto.host_pic}<input type="file"  name="file2" value="${dto.getHost_pic() }">
	        	</td>
	        </tr>
	        
	        <tr>
	        	<th>호스트 휴대폰</th>
	        	<td><input name="host_phone" value="${dto.getHost_phone() }"></td>
	        </tr>
	        
	      	<tr>
	      		<td colspan="2" align="center">
	      		<input type="submit" class="btn btn-primary" value="호스트수정">&nbsp;&nbsp;
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