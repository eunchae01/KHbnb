<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/sty.css" />

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

	.member_list_search {
		display: flex;
    	justify-content: end;
    	margin-top:10px;
    	height:33px;
	}
	.keyword{
	height:27px;
	}
	
	.search_bar {
	    font-size: 1.2em;
    background-color: black;
    color: white;
    cursor: pointer;
	}
	
	.serach{
	
	}
	
	.member_list_search select {
	    font-size: 1.2em;
    background-color: black;
    color: white;
    cursor: pointer;
    height:100%;
	}
	
	.dohyeong {
	
	    flex-direction: column;
    align-items: center;
    display: flex;
	
	}
	
	.bottom{
	
	}
</style>


</head>
<body>

<div class="wrapper">
<div class="container0">
<jsp:include page="main_navi.jsp"/>

	<div align="center">
	<div class="dohyeong">
		<br>
			<h3>호스트 전체리스트 페이지</h3>
		
		<br>
		<div class="flex">
		
			<c:set var="list" value="${hlist }"/>
			<c:set var="paging" value="${Paging }"/>
			
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<div class="each_item">
					<a href="<%=request.getContextPath() %>/host_content.do?no=${dto.host_num}&page=${paging.page}">
					
						<img src="<%=request.getContextPath()%>/resources/host/${dto.host_pic}"  width="200px" >
					<br>
					
		
						
						${dto.host_id}</a>
					 <%-- ${dto.member_pic } --%>
					 <br>
					 ${dto.host_date.substring(0,10) }
				
					</div>
				
				</c:forEach>
			</c:if>
			
			 <div class="each_items">
	            <input type="button" value="호스트등록"
	                 onclick="location.href='host_insert.do'">
	      </div>
	         </div>
			
			
		<br>
		<div class="bottom">
		
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
	         <option value="nameo">호스트명</option>
	      </select>
	      
	      <input name="keyword">&nbsp;&nbsp;&nbsp;
	      <input type="submit" value="검색">
		
		</form>
		</div>
		</div>
			</div>
		</div>
	</div>

</body>
</html>