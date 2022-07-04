<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/sty.css" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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
	
	.dohyeong {
	
	    flex-direction: column;
    align-items: center;
    display: flex;
	
	}
	
	.dohyeong a {
	text-decoration:none;
	color:black;
	}


</style>
</head>
<body>
	<div class="wrapper">
		<div class="container0">
			<jsp:include page="main_navi.jsp"/>




<div class="dohyeong">
	<div align="center">
		<br>

			<h3>회원 테이블 검색 페이지</h3>
		
		<br>
			
		<div class="flex">
		
			<c:set var="list" value="${Search }"/>
			<c:set var="paging" value="${spage }"/>
			
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<div class="each_item">
					
						<img src="<%=request.getContextPath()%>/resources/member/${dto.member_pic}"  width="200px">
					<br>
					
					
						
						${dto.member_id}
					 <%-- ${dto.member_pic } --%>
					 <br>
					 ${dto.member_date.substring(0,10) }
				
					</div>
				
				</c:forEach>
			</c:if>
		
		<br>
		
			
				<div class="each_items">
					<input type="button" class="btn btn-primary" value="회원목록" onclick="location.href='member_list.do'">
				</div>
				
					
		</div>
			
			
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="4" align="center">
						<h3>검색된 회원목록이 없습니다.</h3>
					</td>
				</tr>
			</c:if>
			
		
			
			
			
		
	
		
		
		
		<br>
		
		
		<c:if test="${paging.getPage() > paging.getBlock() }">
			<a href="member_search.do?page=1">[처음으로]</a>
			<a href="member_search.do?page=${paging.getStartBlock() - 1 }">◀</a>
		</c:if>
		
		<c:forEach begin="${paging.getStartBlock() }"
					end="${paging.getEndBlock() }" var="i">
			<c:if test="${i ==paging.getPage() }">
				<b> <a href="member_search.do?page=${i }">[${i }]</a></b>
			</c:if>
			<c:if test="${i != paging.getPage() }">
				<a href="member_search.do?page=${i }">[${i }]</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${paging.getEndBlock() < paging.getAllPage() }">
			<a href="member_search.do?page=${paging.getEndBlock() + 1 }">▶</a>
			<a href="member_search.do?page=${paging.getAllPage() }">[마지막으로]</a>
		</c:if>
		</div>
	 		</div>
		</div>
	</div>

</body>
</html>