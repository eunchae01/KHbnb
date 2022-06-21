<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="main_navi.jsp"/>

	<div align="center">
		<c:set var="dto" value="${modify }"/>
	
			<h3>호스트 테이블 ${dto.getHost_name() } 회원 정보 수정폼 페이지</h3>
	
		<br>
		
		<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/host_modify_ok.do">
		<input type="hidden" name="host_num" value="${dto.getHost_num() }">
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
	        	<td><input type="file" name="file2" value="${dto.getHost_pic() }">
	        	</td>
	        </tr>
	        
	        <tr>
	        	<th>호스트 휴대폰</th>
	        	<td><input name="host_phone" value="${dto.getHost_phone() }"></td>
	        </tr>
	        
	      	<tr>
	      		<td colspan="2" align="center">
	      		<input type="submit" value="호스트수정">&nbsp;&nbsp;
	      		<input type="reset" value="다시작성">
	      		</td>
	      	</tr>
	        
	        	        	
	        
		
		</table>
	</form>
	
	</div>

</body>
</html>