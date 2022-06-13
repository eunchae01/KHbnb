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

			<h3>사업주 테이블 검색 페이지</h3>
		<hr width="50%" color="red">
		<br>
		
		<table border="1" cellspacing="0" width="450">
			<tr>
				<th>사업주 번호</th> <th>사업주 아이디</th>
				<th>사업주  주소</th> <th>사업주 가입일</th>
			</tr>
			<c:set var="list" value="${search }"/>
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.getHost_num() }</td>
					<td>
					${dto.getHost_id() }</td>
					<td>${dto.getHost_addr() }</td>
					<td> ${dto.getHost_date().substring(0,10) }</td>
				</tr>
				
				
					
				
				</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="4" align="center">
						<h3>검색된 회원목록이 없습니다.</h3>
					</td>
				</tr>
			</c:if>
			
			<tr>
				<td colspan="4" align="right">
					<input type="button" value="사업주목록" onclick="location.href='host_list.do'">
				</td>
			</tr>
			
		
		</table>
		<br>
		</div>

</body>
</html>