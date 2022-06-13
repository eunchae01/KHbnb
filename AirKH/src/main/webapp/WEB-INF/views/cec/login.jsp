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
		}
	}
	
	function forHostLogin(){
	    if($("#host").css('display') == 'none'){
	    	$('#host').show();
	    	$("#member").hide();
		}
	}
</script>
</head>
<body>
	<div align="center">
		<h1>로그인 페이지</h1>
		<br>
		
		<button onclick="forUserLogin()">사용자로 로그인하기</button>
		<button onclick="forHostLogin()">호스트로 로그인하기</button>
		<br><br>
		
		<form method="post" action="<%=request.getContextPath() %>/member-login-ok.do">
			<div id="member">
				<input name="member_id" placeholder="사용자아이디">
				<br>
				<input name="member_pwd" placeholder="비밀번호">
				<br><br>
				
				<input type="submit" value="로그인">
			</div>
		</form>

		<form method="post" action="<%=request.getContextPath() %>/host-login-ok.do">
			<div id="host" style="display:none">
				<input name="host_id" placeholder="호스트아이디">
				<br>
				<input name="host_pwd" placeholder="비밀번호">
				<br><br>
				
				<input type="submit" value="로그인">
			</div>
		</form>
		<br>
		
		<a href="<%=request.getContextPath() %>/find-info.do">아이디나 비밀번호를 잊으셨나요?</a>
		<p>계정이 없으신가요? <a href="<%=request.getContextPath() %>/signup.do">가입하기</a></p>
	</div>
</body>
</html>