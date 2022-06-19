<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../jdy/include/main_top.jsp"/>

	<div align="center">
		<h1>일반사용자로 회원가입 화면</h1>
		<br>
		
		<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/signup-member-form.do">
			<input name="member_name" placeholder="이름">
			<br>
			<input name="member_id" placeholder="아이디">
			<br>
			<input name="member_pwd" placeholder="비밀번호">
			<br>
			<input name="member_nickname" placeholder="닉네임">
			<br>
			<div class="imgCon"><img id="preview" width="450" height="275"></div>
			<input name="file" placeholder="프로필사진" type="file" id="input-image" style="display: block">
			
			<br>
			<input name="member_phone" placeholder="핸드폰번호">
			<br><br>
			
			<button type="submit">가입하기</button>
		</form>
	</div>
	
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
</body>
</html>