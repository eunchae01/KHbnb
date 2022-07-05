<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/host-cont.css" />
<style type="text/css">

.wrapper {
		display: flex;
		flex-direction: column;
		height: 100%;
		align-items:center;
		
	}
	
	.container0 {
		width:90%;
		
	}
	
	.lin a{
	color:black;
	text-decoration: none;
	}
#l{
align:center;
margin-left:400px;
}

.cont-table{
padding-top:0px;
}
.cont-table table {
	border-spacing: 0;
	margin-bottom: 0px;
}

.cont-table table th,
.cont-table table td {
	border-top: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
	padding: 10px;
	
}



</style>
</head>
<body>

	<div class="wrapper">
		<div class="container0">	
		<jsp:include page="main_navi.jsp"/>

<div align="center">
		<br>
			<h2> 고객센터 게시판</h2>
			<br>
		
		<div class="lin">
		<div class="cont-table">
		<table border="0" cellspacing="0" width="700">
			<tr>
				<th>게시글 종류</th> <th>글 제목</th>
				<th>작성자</th> <th>처리상태</th>
			</tr>
			
			<c:set var="list" value="${qlist}"/>
			<c:set var="paging" value="${Paging}"/>
			
			<c:if test="${!empty list }">
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>
						
						<a href="<%=request.getContextPath() %>/qa_content.do?no=${dto.qa_num}&page=${paging.getPage()}">
						<c:if test="${dto.qa_type==0}">여행</c:if>
						<c:if test="${dto.qa_type==1}">예약</c:if>
						<c:if test="${dto.qa_type==2}">환불</c:if>
						<c:if test="${dto.qa_type==3}">결제</c:if>
						<c:if test="${dto.qa_type==4}">기타</c:if></a>
						</td>
						<td><c:if test="${dto.qa_num!=dto.qa_index }">
						☞
						</c:if>
						 
						<a href="<%=request.getContextPath() %>/qa_content.do?no=${dto.qa_num}&page=${paging.getPage()}">	${dto.qa_title}</a></td>
						<td>${dto.qa_id}</td>
						<td><c:if test="${dto.qa_state eq'0'}">처리중</c:if>
							<c:if test="${dto.qa_state eq'1'}">답변완료</c:if>
							
						</td>
						
					</tr>
				
				</c:forEach>
			
			</c:if>
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="4" align="center">
						<h3>전체 게시물 목록이 없습니다..</h3>
					</td>
				</tr>
			</c:if>
			
			
			
				
					

		
		</table>
		
		</div>
		<br>
		<input type="button" class="btn btn-primary" id="l" value="글쓰기"
							onclick="location.href='qa_write.do'">
		
		
		<br>
		<br>
		
		<%-- 페이징 처리부분  --%>
		<c:if test="${paging.getPage()>paging.getBlock() }">
			<a href="qa_list.do?page=1">[처음으로]</a>
			<a href="qa_list.do?page=${paging.getStartBlock() - 1 }">◀</a>
		</c:if>
		
		<c:forEach begin="${paging.getStartBlock() }"
						end="${paging.getEndBlock() }" var="i">
			<c:if test="${i==paging.getPage() }">
				<b> <a href="qa_list.do?page=${i }">[${i }]</a></b>
			</c:if>
			
			<c:if test="${i!=paging.getPage() }">
				 <a href="qa_list.do?page=${i }">[${i }]</a>
			</c:if>
		</c:forEach>
		
		
		
		<c:if test="${paging.getEndBlock()<paging.getAllPage() }">
			<a href="qa_list.do?page=${paging.getEndBlock()+1 }">▶</a>
			<a href="qa_list.do?page=${paging.getAllPage() }">[마지막으로]</a>
		</c:if>
		
		<br>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../jdy/include/footer.jsp"></jsp:include>

</body>
</html>