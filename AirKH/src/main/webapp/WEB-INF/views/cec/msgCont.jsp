<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
	.container1{
		margin: 0 auto;
	}
	
	.chatt{
		height: 80vh;
	}
	
	.container2{
		padding-top: 110px;
		padding-bottom: 20px;
		border-style: solid;
		border-width: 1px;
		border-color: black;
		height:100vh;
	}

	.msg{
		text-align: left;
		padding-left: 12%;
		font-weight: bold;
		margin-bottom: 25px;
	}

	#line1{
		color: black;
		opacity: 1;
	}

	.container3{
		background-color: blue;
		margin: 0 auto;
	}
	
	#line2{
		color: black;
		opacity: 1;
	}
	
	.host_info{
		width:75%;
		height:17%;
		margin: 0 auto;
		border-radius: 20px;
	}
	
	.host_info:hover{
		background-color: #F0F0F0;
		cursor: pointer;
	}
	
	.msg_pic{
		float:left;
		margin-left: 40%;
		margin-top: 3%;
	}

	.msg_info{
		float:left;
		margin-left: 2%;
		margin-top: 2%;
	}
	
	.info-msg{
		background-color: #F0F0F0;
		width: 50%;
		height: 5%;
		border-radius: 20px;
		margin-top: px;
		padding-top: 10px;
	}
	
	.sendCon{
		position: absolute;
		height: 13%;
		bottom: 0;
		width: 99%;
		padding-top: 2%;
		background-color: white;
	}
	
	.sendMsg{
		border: 2px solid #F0F0F0;
		width: 45%;
		border-radius: 20px;
		height: 62% !important; 
		padding-left: 1%;
	}
	
	.sendMsg:focus{
		border-color: black;
	}
	
	.sender_info{
		display: flex;
		margin-left: 30%;
	}
	
	.sender{
		display: left;
	}
	
	.cont{
		text-align: left;
		margin-left: 30%;
		margin-top: -12px;
	}
</style>
</head>
<body>
	<jsp:include page="../jdy/include/main_top.jsp"/>
	
	<c:set var="hostORmember" value="${hostORmember }"/>
	
	<c:set var="host_name" value="${host_name }"/>
	<c:set var="check_in" value="${check_in }"/>
	<div align="center" class="container1">
		<div class="container2">
			<c:if test="${hostORmember == 'member'}">
				<h5 class="msg">${host_name }</h5>
			</c:if>
			
			<c:if test="${hostORmember == 'host'}">
				<h5 class="msg">${member_name }</h5>
			</c:if>
			<hr id="line1">
			
			<p class="info-msg">안전한 결제를 위해 에어비앤비 웹사이트나 앱을 통해 대화를 나누고 결제하세요.</p>
			<p class="info-msg">호스트는 예약이 확정된 후에만 프로필 사진을 볼 수 있습니다.</p>
			<p class="info-msg">체크인 날짜가 ${check_in }인 예약이 확정되었습니다.</p>
			<c:set var="info" value="${info }"/>
			<c:if test="${!empty info }">
				<c:forEach items="${info }" var="dto">
					<div class="sender_info"><h5 class="sender">${dto.getMsg_sender() }</h5> &nbsp; <p class="time">${dto.getMsg_date().substring(11, 16) }</p></div>
					<p class="cont">${dto.getMsg_cont() }</p>
				</c:forEach>
			</c:if>
			
			
			<c:if test="${hostORmember == 'member'}">
				<div class="sendCon">
					<form method="post" action="<%=request.getContextPath() %>/msg-send.do">
						<input type="hidden" name="msg_host" value="${host_name }">
						<input type="hidden" name="msg_check" value="${check_in }">
						<input class="sendMsg" name="msg_cont" placeholder="메시지를 입력하세요.">
						<button class="btn btn-light" type="submit">전송</button>
					</form>
				</div>
			</c:if>
			
			<c:if test="${hostORmember == 'host'}">
				<div class="sendCon">
					<form method="post" action="<%=request.getContextPath() %>/msg-sendH.do">
						<input type="hidden" name="msg_member" value="${member_name }">
						<input type="hidden" name="msg_check" value="${check_in }">
						<input class="sendMsg" name="msg_cont" placeholder="메시지를 입력하세요.">
						<button class="btn btn-light" type="submit">전송</button>
					</form>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>