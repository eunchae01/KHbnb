<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/styl.css" />


<jsp:include page="main_navi.jsp"/>
</head>
<body>

	<div align="center">
		<br>
			<h3>회원 전체리스트 페이지</h3>
		
		<br>
		<div class="flex">
		
			<c:set var="list" value="${mlist }"/>
			<c:set var="paging" value="${mpage }"/>
			
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<div class="each_item">
					<a href="<%=request.getContextPath() %>/member_content.do?no=${dto.member_num}&page=${paging.page}">
					
						<img src="<%=request.getContextPath()%>/resources/member/${dto.member_pic}"  width="70px" height="70px">
					<br>
					
					
						
						${dto.member_id}</a>
					 <%-- ${dto.member_pic } --%>
					 <br>
					 ${dto.member_date.substring(0,10) }
				
					</div>
				
				</c:forEach>
			</c:if>
			
			 <div class="each_items">
	            <input type="button" value="회원등록"
	                 onclick="location.href='member_insert.do'">
	      </div>
	         </div>
			
			
			  <c:if test="${empty list }">
	        
	               <h3>전체 게시물 목록이 없습니다.....</h3>
	          
	      </c:if>
	      
	     
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
	         
	      </select>
	      
	      <input name="keyword">&nbsp;&nbsp;&nbsp;
	      <input type="submit" value="검색">
		
		</form>
					
	</div>

</body>
</html>