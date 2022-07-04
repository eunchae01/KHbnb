<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


</style>

</head>
<body>
<div class="wrapper">
		<div class="container0">	
			<jsp:include page="main_navi.jsp"/>

<div align="center">
<c:set var="dto" value="${re}"/>

		<Br>
			<h2>고객문의 상세내역페이지</h2>
		
		
		<br>
		
		
			<table border="0" cellspacing="0" width="700">
				
				<tr>
					<th>게시글 종류</th>
					<td><c:if test="${dto.qa_type==0}">여행</c:if>
						<c:if test="${dto.qa_type==1}">예약</c:if>
						<c:if test="${dto.qa_type==2}">환불</c:if>
						<c:if test="${dto.qa_type==3}">결제</c:if>
						<c:if test="${dto.qa_type==4}">기타</c:if></td></td>
				
				<tr>
					<th>작성자</th>
					<td>${dto.qa_id }</td>
				</tr>
				
				<tr>
					<th>글제목</th>
					<td>${dto.qa_title }</td>
				</tr>
				
				<tr>
					<th>고객문의내용</th>
					<td><textarea rows="3" cols="40" name="qa_cont" readonly>${dto.qa_cont }
					</textarea>
					</td>
				</tr>
				
				</table>
				
				
				
				 <form method="post" action="<%=request.getContextPath() %>/reply_ok.do">
				 <input type="hidden" name="qa_num" value="${dto.qa_num }">
				 <input type="hidden" name="qa_index" value="${dto.qa_index }">
				 <input type="hidden" name="qa_type" value="${dto.qa_type }">
				 <input type="hidden" name="page" value="${Page}">
				 
				<input type="hidden" name="qa_title"
	                      value="(Re)${dto.qa_title}">
				<table border="0" cellspacing="0" width="700">
				
				
				
				
					
				
				
				<tr>
					<th width="200px">관리자 답변</th>
					<td><textarea rows="3" cols="40" name="qa_cont">
					</textarea>
					</td>
				</tr>
				
				<c:if test="${empty dto }">
			         <tr>
			            <td colspan="2" align="center">
			               <h3>조회된 상세 내역이 없습니다.....</h3>
			            </td>
			         </tr>
			      </c:if>
				
				
				
					
					
					<tr>
					<td colspan="2" align="center">
						<input type="submit" class="btn btn-primary" value="답변글">
						<input type="reset" class="btn btn-primary" value="다시작성">
						
	         </td>
	      </tr>
				
			
			
			
			
			</table>
		
		
		</form>
		
		
		
		
		
		
			</div>
		</div>
	
	</div>


</body>
</html>