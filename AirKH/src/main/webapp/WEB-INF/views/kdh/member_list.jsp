<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="main_navi.jsp"/>
</head>
<body>

	<div align="center">
		<hr width="50%" color="red">
			<h3>회원 전체리스트 페이지</h3>
		<hr width="50%" color="red">
		<br>
		
		<table border="1" cellspacing="0" width="500">
			<tr>
				<th>회원 번호</th> <th>회원 아이디</th>
				<th>회원  주소</th> <th>회원 가입일</th>
			</tr>
			<c:set var="list" value="${mlist }"/>
			<c:set var="paging" value="${mpage }"/>
			
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.member_num}</td>
					<td>
						<a href="<%=request.getContextPath() %>/member_content.do?no=${dto.member_num}&page=${paging.page}">
						${dto.member_id}</a></td>
					<td> ${dto.member_addr }</td>
					<td> ${dto.member_date.substring(0,10) }</td>
				</tr>
				
				
				</c:forEach>
			</c:if>
			
			  <c:if test="${empty list }">
	         <tr>
	            <td colspan="5" align="center">
	               <h3>전체 게시물 목록이 없습니다.....</h3>
	            </td>
	         </tr>
	      </c:if>
	      
	      <tr>
	         <td colspan="5" align="right">
	            <input type="button" value="회원등록"
	                 onclick="location.href='member_insert.do'">
	         </td>
	      </tr>
		
		</table>
		<br>
		
		<c:if test="${paging.getPage() > paging.getBlock() }">
			<a href="member_list.do?page=1">[처음으로]</a>
			<a href="member_list.do?page=${paging.getStartBlock() - 1 }">◀</a>
		</c:if>
		
		<c:forEach begin="${paging.getStartBlock() }"
					end="${paging.getEndBlock() }" var="i">
			<c:if test="${i ==paging.getPage() }">
				<b> <a href="member_list.do?page=${i }">[${i }]</a></b>
			</c:if>
			<c:if test="${i != paging.getPage() }">
				<a href="member_list.do?page=${i }">[${i }]</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${paging.getEndBlock() < paging.getAllPage() }">
			<a href="member_list.do?page=${paging.getEndBlock() + 1 }">▶</a>
			<a href="member_list.do?page=${paging.getAllPage() }">[마지막으로]</a>
		</c:if>
		<br><br>
		
		<form method="post" action="<%=request.getContextPath() %>/member_search.do">
			<input type="hidden" name="page" value="${paging.page}">
			<select name="field">
	         <option value="id">아이디</option>
	         <option value="name">회원명</option>
	         <option value="addr">주소</option>
	      </select>
	      
	      <input name="keyword">&nbsp;&nbsp;&nbsp;
	      <input type="submit" value="검색">
		
		</form>
					
	</div>

</body>
</html>