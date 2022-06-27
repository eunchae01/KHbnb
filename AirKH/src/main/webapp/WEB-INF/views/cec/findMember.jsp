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
	    	$("#pwd-tab").removeClass("active");
	    	$("#id-tab").addClass("active");
		}
	}
	
	function findPwd(){
	    if($("#pwd").css('display') == 'none'){
	    	$('#pwd').show();
	    	$("#id").hide();
	    	$("#id-tab").removeClass("active");
	    	$("#pwd-tab").addClass("active");
		}
	}
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
	.container1{
		margin: 225px auto;
	}

	.nav{
		width: 30%;
		padding-left: 8% !important;
	}
</style>
</head>
<body>
	<jsp:include page="../jdy/include/main_top.jsp"/>

	<div align="center" class="container1">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<button class="nav-link active" id="id-tab" data-toggle="tab" onclick="findId()">아이디 찾기</button>
			</li>
			
			<li class="nav-item">
				<button class="nav-link" id="pwd-tab" data-toggle="tab" onclick="findPwd()">비밀번호 찾기</button>
			</li>
		</ul>	
		<br><br>
	
		<div id="id">
			<form method="post" action="<%=request.getContextPath() %>/find-member-id.do">
				<table>
					<tr>
						<th >이름</th>
						<td><input name="member_name" class="form-control"></td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td><input name="member_phone" class="form-control"></td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
							<br><br>
							<input type="submit" class="btn btn-primary" value="아이디 찾기">
						</td>
					</tr>
				</table>
			</form>
		</div>
			
		<div id="pwd" style="display:none">
			<form method="post" action="<%=request.getContextPath() %>/find-member-pwd.do">
				<table>
					<tr>
						<th>아이디</th>
						<td><input name="member_id" class="form-control"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input name="member_name" class="form-control"></td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td><input name="member_phone" class="form-control"></td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
							<br><br>
							<input type="submit" class="btn btn-primary" value="비밀번호 찾기">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>