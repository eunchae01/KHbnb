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
		<hr width="50%" color="gray">
		<c:set var="dto" value="${Modify }"/>
			<h2>리뷰 테이블 ${dto.member_id}님 리뷰 수정 폼 페이지</h2>
		<hr width="50%" color="gray">
		
		<form method="post"
	      action="<%=request.getContextPath() %>/review_modify_ok.do">
			<input type="hidden" name="review_num" value="${dto.review_num }">
			<input type="hidden" name="page" value="${Page }">
			<table border="1" cellspacing="0" width="750">
				<tr>
					<th>숙소코드</th>
					<td colspan="2"><input name="acc_code" value="${dto.acc_code }"></td>
					
					
					<th>리뷰아이디</th>
					<td colspan="2"><input name="member_id" value="${dto.member_id }" readonly></td>
				</tr>
				
				<tr>
					<th>청결도</th>
					<td><input type="number" name="review_cl"min="1" max="5" value="${dto.review_cl}"></td>
					<th>의사소통</th>
					<td><input type="number" name="review_comm"min="1" max="5" value="${dto.review_comm }"></td>
					<th>체크인</th>
					<td><input type="number" name="review_check"min="1" max="5" value="${dto.review_check }"></td>
					</tr>
				<tr>
					<th>정확성</th>
					<td><input type="number" name="review_acc"min="1" max="5" value="${dto.review_acc }"></td>
					<th>위치</th>
					<td><input type="number" name="review_loc"min="1" max="5" value="${dto.review_loc }"></td>
					<th>가격대비만족도</th>
					<td><input type="number" name="review_sat"min="1" max="5" value="${dto.review_sat }"></td>
					</tr>
				<tr>
					<th>예약날짜</th>
					<td colspan="3"><input type="date" name="review_date" id="datepicker"></td>
					<th>평점</th>
					<td><input type="number" name="review_sat"min="1" max="5" value="${dto.review_grade }"></td>
				</tr>
				<tr>
					<th>리뷰내용</th>
					<td align="center" colspan="5"><textarea rows="3" cols="50" name="review_content">${dto.review_content }</textarea>
					</td>
				</tr>
				
				
					<td colspan="6" align="center">
						<input type="submit" value="글수정">&nbsp;&nbsp;&nbsp;
	               			<input type="reset" value="다시작성">
	         </td>
	      </tr>
				
				
			
				</table>
			</form>
				
			
	</div>

</body>
</html>