<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function findId(){
	    if($("#id").css('display') == 'none'){
	    	$('#id').show();
	    	$("#pwd").hide();
		}
	}
	
	function findPwd(){
	    if($("#pwd").css('display') == 'none'){
	    	$('#pwd').show();
	    	$("#id").hide();
		}
	}
</script>
</head>
<body>
	<jsp:include page="../jdy/include/main_top.jsp"/>

	<div align="center">
		<h1>아이디/비번 찾는 페이지</h1>
		<br>
		
		<button onclick="findId()">아이디 찾기</button>
		<button onclick="findPwd()">비밀번호 찾기</button>
		<div id="id">
			<h2>아이디찾기</h2>
			<form method="post" action="<%=request.getContextPath() %>/find-host-id.do">
				<table>
					<tr>
						<th>이름</th>
						<td><input name="host_name"></td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td><input name="host_phone"></td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="아이디 찾기">
						</td>
					</tr>
				</table>
			</form>
		</div>
			
		<div id="pwd" style="display:none">
			<h2>비밀번호찾기</h2>
			<form method="post" action="<%=request.getContextPath() %>/find-host-pwd.do">
				<table>
					<tr>
						<th>아이디</th>
						<td><input name="host_id"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input name="host_name"></td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td><input name="host_phone"></td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="비밀번호 찾기">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>