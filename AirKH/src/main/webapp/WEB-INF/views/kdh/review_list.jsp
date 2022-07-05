<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.review_list_search {
		display: flex;
    	justify-content: end;
    	margin-top:10px;
    	height:33px;
	}

.flex_r{
text-transform: uppercase;

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

 	<div class="review_list_search">
 	<c:set var="list" value="${Rlist }"/>
		<c:set var="paging" value="${Page }"/>
	   <form method="post"	
	      action="<%=request.getContextPath()%>/review_search.do?page=${paging.page}">
	   <input type="hidden" name="page" value="${paging.page}">
	      <select name="field">
	         <option value="cont">내용</option>
	         <option value="writer">작성자</option>
	      </select>
	      
	      <input name="keyword">&nbsp;&nbsp;
	      <input class="btn btn-primary" type="submit" value="검색">
	   </form>
	</div>			

		<div class="dohyeong" align="center">
	<br>		
		<h2>리뷰 리스트</h2>
	<br>
	

		<!-- <tr>
			<th>리뷰번호</th> <th>회원 아이디</th>
			<th>작성날짜</th> <th>	후기</th>
			<th>리뷰번호</th> <th>회원 아이디</th>
			<th>작성날짜</th> <th>	후기</th>
		</tr>
		 -->
		
		
		
		<div class="flex_r">
		
			
			
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="i">
					<div class="each_item_r">
					
					
					
					<a href="<%=request.getContextPath() %>/review_content.do?no=${i.review_num }&page=${paging.page }">
					<img src="<%=request.getContextPath()%>/resources/member/${i.member_pic}"  width="100px" >
					<br>
					${i.acc_name }
					${i.member_id }
					
					${i.review_date.substring(0,7) }
					<br>
					 
					<textarea rows="3" cols="50" readonly>${i.review_content }</textarea>
					</a>
					</div>
						
				
				</c:forEach>
			</c:if>
			
			 <div class="each_items_r">
	            <input type="button" class="btn btn-primary" value="리뷰작성"
	                 onclick="location.href='review_write.do'">
	      </div>
	         </div>
		
		
				
				
				
				<c:if test="${empty list }">
	         
	           
	               <h3>전체 게시물 목록이 없습니다.....</h3>
	           
	      </c:if>
	      
			<br>
			
			 <%-- 페이징 처리 부분 --%>
	   <c:if test="${paging.getPage() > paging.getBlock() }">
	      <a href="review_list.do?page=1">[처음으로]</a>
	      <a href="review_list.do?page=${paging.getStartBlock() - 1 }">◀</a>
	   </c:if>
	   
	   <c:forEach begin="${paging.getStartBlock() }"
	          				end="${paging.getEndBlock() }" var="i">
	      <c:if test="${i == paging.getPage() }">
	         <b> <a href="review_list.do?page=${i }">[${i }]</a></b>
	      </c:if>
	   
	   	  <c:if test="${i != paging.getPage() }">
	         <a href="review_list.do?page=${i }">[${i }]</a>
	      </c:if>
	   </c:forEach>

	   <c:if test="${paging.getEndBlock() < paging.getAllPage() }">
	      <a href="review_list.do?page=${paging.getEndBlock() + 1 }">▶</a>
	      <a href="review_list.do?page=${paging.getAllPage() }">[마지막으로]</a>
	   </c:if>
	   
	   <br> <br>
	  
			
			
						
			
		
		
		
		
		</div>
	</div>
</div>
	
		
		
		
		
	
	
	<jsp:include page="../jdy/include/footer.jsp"></jsp:include>

</body>
</html>