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
		
			<h3>회원 테이블 ${dto.getMember_id() } 회원 정보 수정폼 페이지</h3>
		
		<br>
		
		
		<form method="post" enctype="multipart/form-data"
	      action="<%=request.getContextPath() %>/member_modify_ok.do">
		<input type="hidden" name="member_num" value="${dto.getMember_num() }">
		<input type="hidden" name="page" value="${Page }"> 
		<table border="0" cellspacing="0" width="450">
			<tr>
				<th>회원 아이디</th>
				<td><input name="member_id" value="${dto.getMember_id() }" readonly></td>
			</tr>
			
			<tr>
				<th>회원 닉네임</th>
				<td><input name="member_nickname" value="${dto.getMember_nickname() }" ></td>
			</tr>
			
			<tr>
				<th>회원 이름</th>
				<td><input name="member_name" value="${dto.getMember_name() }" readonly></td>
			</tr>
			
			<tr>
				<th>회원 비밀번호</th>
				<td><input type="password" name="member_pwd" value="${dto.getMember_pwd()}" readonly></td>
			</tr>
			
		
	        
	        <tr>
	        	<th>회원 사진</th>
	        	<td><input type="file" name="file2" value="${dto.getMember_pic() }">
	        	</td>
	        </tr>
	        
	        <tr>
	        	<th>회원 휴대폰</th>
	        	<td><input name="member_phone" value="${dto.getMember_phone() }"></td>
	        </tr>
	        
	      	<tr>
	      		<td colspan="2" align="center">
	      		<input type="submit" value="회원수정">&nbsp;&nbsp;
	      		<input type="reset" value="다시작성">
	      		</td>
	      	</tr>
	        
	        	        	
	        
		
		</table>
	</form>
	
	</div>

</body>
</html>