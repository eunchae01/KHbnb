<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="main_navi.jsp"/>
</head>
<body>
	
	<div align="center">

	<br>
		<h2> 결제 테이블 입력페이지</h2>
	<br>
	
		<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/payment_insert_ok.do">
		
			<table border="0" cellspacing="0" width="1000">
				<tr>
					<th>숙소코드</th>
					<td colspan="2"><input name="acc_code" ></td>
					
					<th>숙소 이름</th>
					<td colspan="2"><input name="acc_name" ></td>
				</tr>
				<tr>
					<th>숙소가격</th>
					<td colspan="2"><input name="acc_price" ></td>
					
					<th>숙소 이미지</th>
					<td colspan="2"><input type="file" name="file2"> </td>
				</tr>
					<tr>
					<th>숙소주소</th>
					<td colspan="2"><input name="acc_addr" ></td>
					
					<th>숙소 평점</th>
					<td colspan="2"><input type="number" min="1" max="5" value="5" name="acc_star"> </td>
				</tr>
					<th>체크인 체크아웃 날짜</th>
					<td colspan="2"><input type="date" name="check_in" id="datepicker"> <input type="date" name="check_out" id="datepicker"></td>
					<th>숙박 인원</th>
					<td colspan="2"><input type="number" name="check_person" min="1" max="14" value="4"></td>
				</tr>
				
				<tr>
					<th>고객이름</th>
					<td colspan="2"><input name="member_name" ></td>
					
					<th>고객 전화번호</th>
					<td colspan="2"><input name="member_phone"> </td>
				</tr>
				
				<tr>
					<th>고객주소</th>
					<td colspan="5"><input name="member_addr" size="100"></td>
					
					
				</tr>
				
					<tr>
					<th>호스트 이름</th>
					<td><input name="host_name"></td>
					<th>호스트 전화번호</th>
					<td><input name="host_phone"></td>
					<th>결제분류</th>
					<td>
					<select name="payment_info">
	        		 <option value="card">카드</option>
	        		 <option value="cash">계좌이체</option>
	    		  </select>
	    		  </td>
					</tr>
				
				
			
				
				<tr>
					<td colspan="6" align="center">
						<input type="submit" value="결제완료">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성">
				</table>
				
		</form>
	
	
	
	</div>

</body>
</html>