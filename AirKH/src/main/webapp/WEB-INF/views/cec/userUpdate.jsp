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
	

	<jsp:include page="../jdy/include/main_top.jsp"/>

	<div align="center">
		<h1>회원정보 수정 페이지</h1>
		<br>
		
		<c:set var="dtoHost" value="${updateHost }"/>
		<c:set var="dtoMember" value="${updateMember }"/>
		
		<c:if test="${!empty dtoHost }">
			<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/info-update-form.do">
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
					<th>소개글</th>
					<td><textarea rows="7" cols="25" name="host_int">${dtoHost.getHost_int() }</textarea>
				</tr>
				
				<tr>
					<th>이미지사진</th>
					<td><div class="imgCon"><img id="preview" width="450" height="275" src="<%=request.getContextPath() %>/resources/host/${dtoHost.getHost_pic() }"></div><input name="file" placeholder="프로필사진" type="file" id="input-image" style="display: block"><td>
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
		
		<script type="text/javascript"> 
		function readImage(input) {
		    // 인풋 태그에 파일이 있는 경우
		    if(input.files && input.files[0]) {
		        // 이미지 파일인지 검사 (생략)
		        // FileReader 인스턴스 생성
		        const reader = new FileReader();
		        // 이미지가 로드가 된 경우
		        reader.onload = e => {
		            const previewImage = document.getElementById("preview");
		            previewImage.src = e.target.result;
		        }
		        // reader가 이미지 읽도록 하기
		        reader.readAsDataURL(input.files[0]);
		    }
		}
		// input file에 change 이벤트 부여
		const inputImage = document.getElementById("input-image")
		inputImage.addEventListener("change", e => {
		    readImage(e.target)
		});
	</script>
	
		</c:if>
		
		<c:if test="${!empty dtoMember }">
			<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/info-update-form.do">
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