<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
 	function chattM(name, check_in){
 		location.href="msg-cont.do?name=" + name + "&check_in=" + check_in
 	}


</script>
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
</style>
</head>
<body>
	<jsp:include page="../jdy/include/main_top.jsp"/>
	
	<div align="center" class="container1">
		<div class="container2">
			<h5 class="msg">메시지</h5>
			<hr id="line1">
				<c:set var="hostList" value="${hostList }"/>
				<c:set var="picList" value="${picList }"/>
				
				<c:set var="hostORmember" value="${hostORmember }"/>
				<c:if test="${hostORmember == 'host' }">
					<c:if test="${!empty hostList }">
						<c:forEach items="${hostList }" var="dtoH" varStatus="status">
							<div class="host_info" onclick="chattM('${dtoH.getMember_name() }', '${dtoH.getCheck_in() }')">
								<div class="msg_pic">
									<img id="preview" width="50" src="<%=request.getContextPath() %>/resources/member/${picList[status.index] }">
								</div>
							<div class="msg_info">
								<h5>${dtoH.getMember_name() }</h5> 
								<h6>${dtoH.getAcc_name() }</h6>
								<h6>여행날짜 : ${dtoH.getCheck_in() } ~ ${dtoH.getCheck_out() }</h6>
							</div>
						</div>
						</c:forEach>
					</c:if>
									
					<c:if test="${empty hostList }">
						예약 내역이 없습니다.
					</c:if>
				</c:if>
				
				
				<!-- 멤버 로그인 시 -->
				<c:set var="memList" value="${memList }"/>
				<c:set var="picMList" value="${picMList }"/>
				
				<c:if test="${hostORmember == 'member' }">
					<c:if test="${!empty memList }">
						<c:forEach items="${memList }" var="dtoM" varStatus="status">
							<div class="host_info" onclick="chattM('${dtoM.getHost_name() }', '${dtoM.getCheck_in() }')">
								<div class="msg_pic">
										<img id="preview" width="50" src="<%=request.getContextPath() %>/resources/host/${picMList[status.index] }">
									</div>
								<div class="msg_info">
									<h5>${dtoM.getHost_name() } </h5> 
									<h6>${dtoM.getAcc_name() }</h6>
									<h6>여행날짜 : ${dtoM.getCheck_in() } ~ ${dtoM.getCheck_out() }</h6>
								</div>
							</div>
						</c:forEach>
					</c:if>
					
					<c:if test="${empty memList }">
						예약 내역이 없습니다.
					</c:if>
				</c:if>
		</div>
	</div>
</body>
</html>