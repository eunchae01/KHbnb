<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=692e1f73c3a0256f966eeb53fcd5a257&libraries=services"></script>
<script>
	function execDaumPostcode() {
    	new daum.Postcode({
        	oncomplete: function(data) {
	                document.getElementById('addr').value = data.address;
	            }
        }).open();
	}
</script>
</head>
<body>
	<div align="center">
		<h1>회원정보 수정 페이지</h1>
		<br>
		
		<c:set var="dtoHost" value="${updateHost }"/>
		<c:set var="dtoMember" value="${updateMember }"/>
		
		<c:if test="${!empty dtoHost }">
			<form method="post" action="<%=request.getContextPath() %>/info-update-form.do">
			<input type="hidden" name="host_num" value="${dtoHost.getHost_num() }">
			<table>
				<tr>
					<th>아이디</th>
					<td><input name="host_id" value="${dtoHost.getHost_id() }" readonly></td>
				</tr>
				
				<tr>
					<th>닉네임</th>
					<td><input name="host_nickname" value="${dtoHost.getHost_nickname() }"></td>
				</tr>
				
				<tr>
					<th>이름</th>
					<td><input name="host_name" value="${dtoHost.getHost_name() }" readonly></td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input name="host_pwd" value="${dtoHost.getHost_pwd() }"></td>
				</tr>
				
				<tr>
					<th>주소</th>
					<td><input name="host_addr" value="${dtoHost.getHost_addr() }" id="addr"><input type="button" onclick="execDaumPostcode()" value="검색"></td>
				</tr>
				
				<tr>
					<th>핸드폰 번호</th>
					<td><input name="host_phone" value="${dtoHost.getHost_phone() }"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정하기">
					</td>
				</tr>
			</table>
		</form>
		</c:if>
		
		<c:if test="${!empty dtoMember }">
			<form method="post" action="<%=request.getContextPath() %>/info-update-form.do">
			<input type="hidden" name="member_num" value="${dtoMember.getMember_num() }">
			<table>
				<tr>
					<th>아이디</th>
					<td><input name="member_id" value="${dtoMember.getMember_id() }" readonly></td>
				</tr>
				
				<tr>
					<th>닉네임</th>
					<td><input name="member_nickname" value="${dtoMember.getMember_nickname() }"></td>
				</tr>
				
				<tr>
					<th>이름</th>
					<td><input name="member_name" value="${dtoMember.getMember_name() }" readonly></td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input name="member_pwd" value="${dtoMember.getMember_pwd() }"></td>
				</tr>
				
				<tr>
					<th>주소</th>
					<td><input name="member_addr" value="${dtoMember.getMember_addr() }" id="addr"><input type="button" onclick="execDaumPostcode()" value="검색"></td>
				</tr>
				
				<tr>
					<th>핸드폰 번호</th>
					<td><input name="member_phone" value="${dtoMember.getMember_phone() }"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정하기">
					</td>
				</tr>
			</table>
		</form>
		</c:if>
		
	</div>
</body>
</html>