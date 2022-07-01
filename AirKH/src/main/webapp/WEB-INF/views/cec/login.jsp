<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function forUserLogin(){
	    if($("#member").css('display') == 'none'){
	    	$('#member').show();
	    	$("#host").hide();
	    	$("#host-tab").removeClass("active");
	    	$("#member-tab").addClass("active");
		}
	}
	
	function forHostLogin(){
	    if($("#host").css('display') == 'none'){
	    	$('#host').show();
	    	$("#member").hide();
	    	$("#member-tab").removeClass("active");
	    	$("#host-tab").addClass("active");
		}
	}
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
	.nav{
		width: 40%;
		padding-left: 9% !important;
		margin-top: 10%;
	}

	#floatingInput {
		width: 30%;
	}
	
	#floatingPassword{
		width: 30%;
	}
	
	.labelForInput{
		margin-left: 35%;
	}
	
	.tab-content{
		margin-top: 1%;
	}
	
	button {
		background-color: white;
	}

</style>
</head>
<body>
	<jsp:include page="../jdy/include/main_top.jsp"/>
	<br>
	
	<div align="center" class="container1">

		<ul class="nav nav-tabs">
			<li class="nav-item">
				<button class="nav-link active" id="member-tab" data-toggle="tab" onclick="forUserLogin()">사용자로 로그인하기</button>
			</li>
			
			<li class="nav-item">
				<button class="nav-link" id="host-tab" data-toggle="tab" onclick="forHostLogin()">호스트로 로그인하기</button>
			</li>
		</ul>	
		<br><br>
		
		<div class="tab-content">	
			<div id="member" class="tab-pane fade show active">
				<form method="post" action="<%=request.getContextPath() %>/member-login-ok.do">
					<div  class="form-floating">
						<input name="member_id" class="form-control" id="floatingInput" placeholder="사용자아이디">
						<label class="labelForInput" for="floatingInput">Id</label>
					</div>
						<br>
						
					<div class="form-floating">	
						<input name="member_pwd" type="password" class="form-control" id="floatingPassword" placeholder="Password">
						<label class="labelForInput" for="floatingPassword">Password</label>
						<br><br>
					</div>	
						<input type="submit" value="로그인" class="btn btn-primary">
				</form>
			</div>
			
			<div id="host" class="tab-pane fade show active" style="display:none">
				<form method="post" action="<%=request.getContextPath() %>/host-login-ok.do">
					<div class="form-floating">
						<input name="host_id" class="form-control" id="floatingInput" placeholder="호스트아이디">
						<label class="labelForInput" for="floatingInput">Id</label>
					</div>
						<br>
						
					<div class="form-floating">
						<input name="host_pwd" type="password" class="form-control" id="floatingPassword" placeholder="비밀번호">
						<label class="labelForInput" for="floatingPassword">Password</label>
						<br><br>
					</div>
						<input type="submit" value="로그인"  class="btn btn-primary">
				</form>
			</div>
		</div>
		<br>
		
		<a href="<%=request.getContextPath() %>/find-user.do">아이디나 비밀번호를 잊으셨나요?</a>
		<p>계정이 없으신가요? <a href="<%=request.getContextPath() %>/signup.do">가입하기</a></p>
	</div>
</body>
</html>