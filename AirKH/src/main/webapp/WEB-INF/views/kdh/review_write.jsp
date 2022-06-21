<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="main_navi.jsp"/>
</head>
<body>

	<div align="center">
		
			<h2>리뷰 테이블 글쓰기 폼페이지</h2>
		
		
		<form method="post" action="<%=request.getContextPath() %>/review_write_ok.do">
		
			<table border="0" cellspacing="0" width="750">
				<tr>
					<th>숙소코드</th>
					<td colspan="2"><input name="acc_code" ></td>
					
					<th>리뷰아이디</th>
					<td colspan="2"><input name="member_id" ></td>
				</tr>
				<tr>
					<th>청결도</th>
					<td><input type="number" name="review_cl"min="1" max="5" value="5"></td>
					<th>의사소통</th>
					<td><input type="number" name="review_comm"min="1" max="5" value="5"></td>
					<th>체크인</th>
					<td><input type="number" name="review_check"min="1" max="5" value="5"></td>
					</tr>
				<tr>
					<th>정확성</th>
					<td><input type="number" name="review_acc"min="1" max="5" value="5"></td>
					<th>위치</th>
					<td><input type="number" name="review_loc"min="1" max="5" value="5"></td>
					<th>가격대비만족도</th>
					<td><input type="number" name="review_sat"min="1" max="5" value="5"></td>
					</tr>
				<tr>
					<th>예약날짜</th>
					<td colspan="3"><input type="date" name="review_date" id="datepicker"></td>
					<th>평점</th>
					<td><input type="number" name="review_grade"min="1" max="5" value="5"></td>
				</tr>
				<tr>
					<th>리뷰내용</th>
					<td align="center" colspan="5"><textarea rows="3" cols="50" name="review_content">${i.review_content }</textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="6" align="center">
						<input type="submit" value="리뷰작성">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성">
				</table>
				
		</form>
	
	
	
	</div>

</body>
</html>