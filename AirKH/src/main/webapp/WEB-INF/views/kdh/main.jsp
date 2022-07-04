<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.flex-ser{
	display:grid;
	grid-template-columns: repeat(3,1fr);
	flex-wrap:wrap;
	
	grid-gap:1rem;
	
	justify-content:space-around;
	
	


}

.flex_r1{
	display:grid;
	grid-template-columns: repeat(2,1fr);
	flex-wrap:wrap;
	
	grid-gap:1rem;
	
	justify-content:space-around;
	margin-left:



}
.each_short{
	width: 230px;
	heght: 150px;
	text-decoration: none;

}

.serve_title{
grid-column:1/4;


}
.serve_title1{
grid-column:1/3;


}

.flex a{
 text-decoration:none;
 color:black;
}

.matitle{
margin-left:50px;
}

.mabottom{
float:right;
margin-right:50px;


}

.flex5 img{
float:center;
}

.se a {
text-decoration:none;
color:black;
}

.upper{
text-transform:uppercase;
}


body{
margin:0;
}

</style>

</head>
<body>




<div class="wrapper">
	<div class="container0">
<jsp:include page="main_navi.jsp"/>

<div class="se">

<c:set var="list2" value="${halist}"/>

<a href="<%=request.getContextPath()%>/hacc_list.do"><h2 class="matitle">[숙소관리]</h2></a>

<div class="flex5" align="center">
<c:if test="${!empty list2 }">
		<c:forEach items="${list2 }" begin="0" end="5" var="dta">
			<div class="each_item6">
				<a href="<%=request.getContextPath() %>/hacc_content.do?no=${dta.acc_code}">
					<img src="<%=request.getContextPath()%>/resources/upload/2022-06-13/${dta.acc_thumbnail}" width="310px">
				<br>
				
				${dta.acc_city }<br>
				<fmt:formatNumber>${dta.acc_price }</fmt:formatNumber>원/박
				
				</a>
			
			</div>
		
		
		</c:forEach>
	
	
	</c:if>
	</div>
<a href="<%=request.getContextPath()%>/hacc_list.do">	<h3 class="mabottom">[더 보기]</h3></a>
	<br>
	<br>
	<br>
	<br>
	<div class="upper">
	
<a href="<%=request.getContextPath()%>/host_list.do"><h2 class="matitle">[호스트관리]</h2></a>
	
		<c:set var="list" value="${hlist }"/>
			<c:set var="paging" value="${Paging }"/>
			
			<div class="flex5" align="center">
			
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<div class="each_item6" align="center">
					<a href="<%=request.getContextPath() %>/host_content.do?no=${dto.host_num}&page=${paging.page}">
					
						<img src="<%=request.getContextPath()%>/resources/host/${dto.host_pic}"  width="250px" >
					<br>
					
		
						
						${dto.host_id}</a>
					 <%-- ${dto.member_pic } --%>
					 <br>
					 ${dto.host_date.substring(0,10) }
					<Br>
					
				</div>
				</c:forEach>
			</c:if>
			</div>
			
			<a href="<%=request.getContextPath()%>/host_list.do"><h3 class="mabottom">[더 보기]</h3></a>
	<br>
	<br>
	<br>
	<br>
	<a href="<%=request.getContextPath()%>/review_list.do"><h2 class="matitle">[리뷰 관리]</h2></a>
	
		<div class="flex5" align="center">
		<c:set var="list1" value="${Rlist }"/>
		<c:set var="paging1" value="${Page }"/>
		
			
			
			<c:if test="${!empty list1 }">
				<c:forEach items="${list1 }" var="i">
					<div class="each_item6">
					
					
					
					<a href="<%=request.getContextPath() %>/review_content.do?no=${i.review_num }&page=${paging1.page }">
					<img src="<%=request.getContextPath()%>/resources/member/${i.member_pic}"  width="150px" >
					<br>
					${i.member_id }
					
					${i.review_date.substring(0,7) }
					<br>
					 
					<textarea rows="4" cols="35" readonly>${i.review_content }</textarea>
					</a>
					</div>
						
				
				</c:forEach>
			</c:if>
			
			
	         </div>
	         
	         		<a href="<%=request.getContextPath()%>/review_list.do"><h3 class="mabottom">[더 보기]</h3></a>
	<br>
	<br>
	<br>
	<br>		
			
			<a href="<%=request.getContextPath()%>/member_list.do"><h2 class="matitle">[멤버 관리]</h2></a>
			
			<div class="flex5" align="center">
			
			<c:set var="lists" value="${mlist }"/>
			<c:set var="pagings" value="${mpage }"/>
			
			<c:if test="${!empty lists }">
				<c:forEach items="${lists }" var="dtr">
					<div class="each_item6" align="center">
					<a href="<%=request.getContextPath() %>/member_content.do?no=${dtr.member_num}&page=${pagings.page}">
					
						<img src="<%=request.getContextPath()%>/resources/member/${dtr.member_pic}"  width="250px" >
					<br>
					
		
						
						${dtr.member_id}</a>
					 <%-- ${dto.member_pic } --%>
					 <br>
					 ${dtr.member_date.substring(0,10) }
					<Br>
					
				</div>
				</c:forEach>
			</c:if>
			</div>
			
			<a href="<%=request.getContextPath()%>/member_list.do"><h3 class="mabottom">[더 보기]</h3></a>
		
			
			
		 
	         


	</div>
	</div>

	</div>
</div>


</body>
</html>