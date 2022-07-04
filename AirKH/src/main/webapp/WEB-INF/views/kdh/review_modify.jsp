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
		
		<c:set var="dto" value="${Modify }"/>
		<br>
			<h2>리뷰 테이블 ${dto.member_id}님 리뷰 수정 폼 페이지</h2>
		<br>
		
		<form method="post" enctype="multipart/form-data"
	      action="<%=request.getContextPath() %>/review_modify_ok.do">
			<input type="hidden" name="review_num" value="${dto.review_num }">
			<input type="hidden" name="page" value="${Page }">
			<input type="hidden" name="member_pic" value="${dto.member_pic}">
			<table border="0" cellspacing="0" width="1000">
				<tr>
					<th>숙소코드</th>
					<td><input name="acc_code" value="${dto.acc_code }"></td>
					<th>호스트번호</th>
					<td><input name="host_num" value="${dto.host_num }"></td>
					
					<th>리뷰아이디</th>
					<td><input name="member_id" value="${dto.member_id }" readonly></td>
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
					<td><input type="date" name="review_date" id="datepicker"></td>
					<th>글쓴이사진</th>
					<td>${dto.member_pic }<input type="file" name="file1">
					<th>평점</th>
					<td><input type="number" name="review_sat"min="1" max="5" value="${dto.review_grade }"></td>
				</tr>
				<tr>
					<th>리뷰내용</th>
					<td align="center" colspan="5"><textarea rows="3" cols="50" name="review_content">${dto.review_content }</textarea>
					</td>
				</tr>
				
				
					<td colspan="6" align="center">
						<input type="submit" class="btn btn-primary" value="글수정">&nbsp;&nbsp;&nbsp;
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