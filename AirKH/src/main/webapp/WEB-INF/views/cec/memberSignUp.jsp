<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h1>일반사용자로 회원가입 화면</h1>
		<br>
		
		<form method="post" action="<%=request.getContextPath() %>/signup-member-form.do">
			<input name="member_name" placeholder="이름">
			<br>
			<input name="member_id" placeholder="아이디">
			<br>
			<input name="member_pwd" placeholder="비밀번호">
			<br>
			<input name="member_nickname" placeholder="닉네임">
			<br>
			<input name="member_phone" placeholder="핸드폰번호">
			<br>
			<input name="member_addr" placeholder="주소" id="addr">
			<input type="button" onclick="execDaumPostcode()" value="검색">
			<br><br>
			
			<button type="submit">가입하기</button>
		</form>
	</div>
</body>
</html>