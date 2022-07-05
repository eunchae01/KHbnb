<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 글 수정</title>
<style type="text/css">

	.QA_box{position:relative; top:150px; text-align: center;}

.qa_table{margin: 0 auto;}
.qa_cont{  border-bottom:1px solid #000;}
.qa_title{width:140px; padding: 5px 0 5px 10px; border-right:1px solid #000;}
.qa_contLast{padding:10px;}
.qa_left{text-align: left;  padding:5px; width:460px;}

.qa_btn{border : 5px solid #ff3e5c; margin:10px; background: #ff3e5c; color:#fff;  height:40px; border-radius: 10%;}
	.qa_hidden{display:none;}
	
</style>
</head>
<body>
	<jsp:include page="../jdy/include/main_top.jsp" />
	<c:set var="l" value="${cont_list }" />
	<div class="QA_box" align="center">
		<h3>문의 내용 수정하기</h3>
		<form method="post" action="<%=request.getContextPath() %>/QA_modifyOk.do">
		
		
		<table class="qa_table" border="1" cellspacing="0" width="600">
				<tr class="qa_cont">
					<th class="qa_title">문의 종류 </th>
					
						<c:if test="${l.qa_type eq 0 }">
					           <td class="qa_left"> 여행 </td>
			            </c:if>
			            <c:if test="${l.qa_type eq 1 }">
			            	   <td class="qa_left"> 예약 </td>
			            </c:if>
			            <c:if test="${l.qa_type eq 2 }">
			            	   <td class="qa_left"> 환불 </td>
			            </c:if>
			            <c:if test="${l.qa_type eq 3 }">
			            	   <td class="qa_left"> 결제 </td>
			            </c:if>
			            <c:if test="${l.qa_type eq 4 }">
			            	   <td class="qa_left"> 기타 </td>
			            </c:if>
		            
			</tr>
			<tr class="qa_cont">
				<th class="qa_title">문의글 제목</th>
				<td class="qa_left">
				<input class="qa_hidden" type="number" name="qa_num" value="${l.qa_num }">
		            <input class="qa_hidden" type="number" name="qa_index" value="${l.qa_index }">
		            <input class="qa_hidden" type="number" name="qa_type" value="${l.qa_type }">
		            <input class="qa_hidden" type="text" name="qa_id" value="${l.qa_id }">
		            <input class="qa_hidden" type="number" name="qa_state" value="${l.qa_state}">
		            <input type="text" name="qa_title" value="${l.qa_title }">
		         </td>
				
			</tr>
			<tr class="qa_cont">
				<th class="qa_title">문의 내용</th>
				<td><textarea class="qa_left" name="qa_cont" rows="4" cols="60" >${l.qa_cont }</textarea></td>
			</tr>
			<tr>
				<td colspan="3" align="right">
					<input class="qa_btn" type="submit" value="수정하기" ">
					<input class="qa_btn" type="reset" value="취소" onclick="location.href='QA_content.do?qa_num=${l.qa_num}'">
				</td>
				
			</tr>
			
			
			
			</table>
			
			</form>
			</div>
</body>
</html>