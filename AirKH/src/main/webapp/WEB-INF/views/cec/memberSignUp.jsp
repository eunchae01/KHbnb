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
	.containerMaster{
		margin: 125px auto;
	}
	
	.contaniner1{
		float: left;
		width: 50%;
		margin-left: 10%;
	}
	
	.contaniner2{
		display: inline-block;
		width: 50%;
		height: 380px;
		margin-left: -40%;
		margin-top: 1%;
	}

	.form-control{
		width: 40% !important;
		margin-left: 13%;
	}
	
	label{
		margin-left: -10%;
		text-align: left;
	}
	
	.imgCon img{
		border-radius: 50%;
		width: 200px;
		height: 200px;
		margin-left: 15%;
	}
	
	button {
		background-color: white;
	}
	
</style>
</head>
<body>
 	<jsp:include page="../jdy/include/main_top.jsp"/> 

	<div align="center" class="containerMaster">
		<h1>일반사용자로 회원가입</h1>
		<br><br>
		
		<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/signup-member-form.do">
			<div class="contaniner1">	
				<label for="input1" class="col-sm-2 col-form-label">이름</label>
				<input name="member_name" class="form-control" id="input1">
				<label for="input2" class="col-sm-2 col-form-label">아이디</label>
				<input name="member_id" class="form-control" id="input2">
				<label for="input3" class="col-sm-2 col-form-label">비밀번호</label>
				<input name="member_pwd" class="form-control" type="password" id="input3">
				<label for="input4" class="col-sm-2 col-form-label">닉네임</label>
				<input name="member_nickname" class="form-control" id="input4">
				<label for="input5" class="col-sm-2 col-form-label">핸드폰 번호</label>
				<input name="member_phone" class="form-control" id="input5">
			</div>
			
			<div class="contaniner2">
				<div class="imgCon">
					<img id="preview">
				</div>
				<br>
				<label for="input-image" class="col-sm-2 col-form-label">프로필 사진</label>
				<input name="file" type="file" class="form-control" id="input-image" style="display: block">
			</div>
			<br><br><br><br><br>
			
			<div>
				<button type="submit" class="btn btn-primary">가입하기</button>
			</div>
			<br>
		</form>
	</div>
	
	<jsp:include page="../jdy/include/footer.jsp"/>
	
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