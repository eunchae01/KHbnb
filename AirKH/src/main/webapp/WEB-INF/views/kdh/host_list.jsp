<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

			<h3>사업주 테이블 전체 목록 페이지</h3>
		<hr width="50%" color="red">
		<br>
		
		<table border="1" cellspacing="0" width="450">
			<tr>
				<th>사업주 번호</th> <th>사업주 아이디</th>
				<th>사업주  사진</th> <th>사업주 가입일</th>
			</tr>
			<c:set var="list" value="${hlist }"/>
			<c:set var="paging" value="${Paging }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.getHost_num() }</td>
					<td><a href="<%=request.getContextPath() %>/host_content.do?num=${dto.getHost_num()}&page=${paging.page }">
					${dto.getHost_id() }</a></td>
					<td>${dto.getHost_pic() }</td>
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
					<input type="button" value="사업주등록" onclick="location.href='host_insert.do'">
				</td>
			</tr>
			
		
		</table>
		<br>
		
		<c:if test="${paging.getPage() > paging.getBlock() }">
	      <a href="host_list.do?page=1">[처음으로]</a>
	      <a href="host_list.do?page=${paging.getStartBlock() - 1 }">◀</a>
	   </c:if>
	   
	   <c:forEach begin="${paging.getStartBlock() }"
	          				end="${paging.getEndBlock() }" var="i">
	      <c:if test="${i == paging.getPage() }">
	         <b> <a href="host_list.do?page=${i }">[${i }]</a></b>
	      </c:if>
	   
	   	  <c:if test="${i != paging.getPage() }">
	         <a href="host_list.do?page=${i }">[${i }]</a>
	      </c:if>
	   </c:forEach>

	   <c:if test="${paging.getEndBlock() < paging.getAllPage() }">
	      <a href="host_list.do?page=${paging.getEndBlock() + 1 }">▶</a>
	      <a href="host_list.do?page=${paging.getAllPage() }">[마지막으로]</a>
	   </c:if>
	   
	   <br> <br>
		
		
		<form method="post" action="<%=request.getContextPath() %>/host_search.do">
		<input type="hidden" name="page" value="${paging.page}">
			<select name="field">
	         <option value="ido">아이디</option>
	         <option value="nameo">사업주명</option>
	      </select>
	      
	      <input name="keyword">&nbsp;&nbsp;&nbsp;
	      <input type="submit" value="검색">
		
		</form>
		
	
	</div>

</body>
</html>