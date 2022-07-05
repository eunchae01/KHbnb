<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내용</title>
<style type="text/css">


.QA_box{position:relative; top:150px;}

.qa_cont{  border-bottom:1px solid #000;}
.qa_title{width:100px; padding: 5px 0 5px 10px;}
.qa_contLast{padding:10px;}
.qa_btn{border : 5px solid #ff3e5c; margin:10px; background: #ff3e5c; color:#fff;  height:40px; border-radius: 10%;}
</style>
</head>
<body>
	<jsp:include page="../jdy/include/main_top.jsp" />
	<div class="QA_box" align="center">
		<h3>문의 내용</h3>
		<c:set var="l" value="${cont_list }" />
		
		<table border="1" cellspacing="0" width="600">
			<tr class="qa_cont">
				<th class="qa_title">문의 종류 </th>
				
					<c:if test="${l.qa_type eq 0 }">
				           <td> 여행 </td>
		            </c:if>
		            <c:if test="${l.qa_type eq 1 }">
		            	   <td> 예약 </td>
		            </c:if>
		            <c:if test="${l.qa_type eq 2 }">
		            	   <td> 환불 </td>
		            </c:if>
		            <c:if test="${l.qa_type eq 3 }">
		            	   <td> 결제 </td>
		            </c:if>
		            <c:if test="${l.qa_type eq 4 }">
		            	   <td> 기타 </td>
		            </c:if>
			</tr>
			<tr class="qa_cont">
				<th class="qa_title">문의글 제목</th>
				<td>${l.qa_title }</td>
			</tr>
			<tr class="qa_cont">
				<th class="qa_title">문의 내용</th>
				<td >${l.qa_cont }</td>
			</tr>
			<c:if test="${l.qa_id ne 'admin' }">
				<tr >
				<td class="qa_contLast" colspan="3" align="center" >
					<input class="qa_btn" type="button" value="문의 내용 수정" width="140px" onclick="location.href='QA_modify.do?qa_num=${l.qa_num}'">
					&nbsp;
					<input class="qa_btn" type="button" value="문의 내용 삭제" width="140px" onclick="if(confirm('삭제하시겠습니까?')){location.href='QA_delete.do?qa_num=${l.qa_num}'}else {return;}">
					&nbsp;
					<input class="qa_btn" type="button" value="문의 목록" width="140px" onclick="location.href='QA_main.do?qa_num=${l.qa_num}'">
				</td>
			</tr>
			</c:if>
			
			<c:if test="${l.qa_id eq 'admin' }">
			<tr >
				<td class="qa_contLast" colspan="3" align="right" >
					
					<input class="qa_btn" type="button" value="문의 목록" width="140px" onclick="location.href='QA_main.do?qa_num=${l.qa_num}'">
				</td>
			</tr>
			</c:if>
			
		</table>
	</div>
	
</body>
</html>