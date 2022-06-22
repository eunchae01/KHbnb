<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="main_navi.jsp"/>

	<div align="center">
		<hr width="50%" color="red">

			<h3>호스트 테이블 검색 페이지</h3>
		<hr width="50%" color="red">
		<br>
		
		<table border="1" cellspacing="0" width="450">
			<tr>
				<th>호스트 번호</th> <th>호스트 아이디</th>
				<th>호스트  사진</th> <th>호스트 가입일</th>
			</tr>
			<c:set var="list" value="${search }"/>
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.getHost_num() }</td>
					<td>
					${dto.getHost_id() }</td>
					<td>${dto.getHost_pic() }</td>
					<td> ${dto.getHost_date().substring(0,10) }</td>
				</tr>
				
				
					
				
				</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="4" align="center">
						<h3>검색된 호스트목록이 없습니다.</h3>
					</td>
				</tr>
			</c:if>
			
			<tr>
				<td colspan="4" align="right">
					<input type="button" value="호스트목록" onclick="location.href='host_list.do'">
				</td>
			</tr>
			
		
		</table>
		<br>
		<c:if test="${paging.getPage() > paging.getBlock() }">
			<a href="host_search.do?page=1">[처음으로]</a>
			<a href="host_search.do?page=${paging.getStartBlock() - 1 }">◀</a>
		</c:if>
		
		<c:forEach begin="${paging.getStartBlock() }"
					end="${paging.getEndBlock() }" var="i">
			<c:if test="${i ==paging.getPage() }">
				<b> <a href="host_search.do?page=${i }">[${i }]</a></b>
			</c:if>
			<c:if test="${i != paging.getPage() }">
				<a href="host_search.do?page=${i }">[${i }]</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${paging.getEndBlock() < paging.getAllPage() }">
			<a href="host_search.do?page=${paging.getEndBlock() + 1 }">▶</a>
			<a href="host_search.do?page=${paging.getAllPage() }">[마지막으로]</a>
		</c:if>
		
		</div>

</body>
</html>