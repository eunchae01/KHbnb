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
	<c:set var="dto" value="${Modi}"/>
	<br>
		<h2> 결제 테이블 ${dto.acc_name}수정 페이지</h2>
	<br>
	
		<form method="post" enctype="multipart/form-data"
	      action="<%=request.getContextPath() %>/payment_modify_ok.do">
			<input type="hidden" name="cart_num" value="${dto.cart_num }">
			<input type="hidden" name="page" value="${Page }">
		
			<table border="0" cellspacing="0" width="1000">
				<tr>
					
					<th>숙소코드</th>
					<td colspan="2"><input name="acc_code" value="${dto.acc_code}"> </td>
					
					<th>숙소 이름</th>
					<td colspan="2"><input name="acc_name" value="${dto.acc_name }"></td>
				</tr>
				<tr>
					<th>숙소가격</th>
					<td colspan="2"><input name="acc_price" value="${dto.acc_price}"></td>
					
					<th>숙소 이미지</th>
					<td colspan="2">${dto.acc_thumbnail }<input type="file" name="file2" value="" ></td>
				</tr>
					<tr>
					<th>숙소주소</th>
					<td colspan="5"><input name="acc_addr" value="${dto.acc_addr}"></td>
				
				
				
				<tr>
					<th>고객이름</th>
					<td colspan="2"><input name="member_name" value="${dto.member_name }"></td>
					
					<th>고객 전화번호</th>
					<td colspan="2"><input name="member_phone" value="${dto.member_phone }"> </td>
				</tr>
				
				<tr>
					<th>고객주소</th>
					<td colspan="2"><input name="member_addr" value="${dto.member_addr }"></td>
					<th>결제날짜</th>
					
					
					<td colspan="2">
					<input type="date" name="cart_date" id="datepicker" value="${dto.cart_date}"></td>
					
					
				</tr>
				
				<tr>
					<th>체크인</th>
					<td><input type="date" name="check_in" id="datepicker" value="${dto.check_in} "></td>
					<th> 체크아웃 </th>
					<td><input type="date" name="check_out" id="datepicker" value="${dto.check_out} "></td>
					<th>숙박 인원</th>
					<td><input type="number" name="check_person" min="1" max="14" value="${dto.check_person }"></td>
				</tr>
				
					<tr>
					<th>호스트 이름</th>
					<td><input name="host_name"value="${dto.host_name }"></td>
					<th>호스트 전화번호</th>
					<td><input name="host_phone"value="${dto.host_phone }"></td>
					<th>예약 정보</th>
					<td><input name="reserve_info"value="${dto.reserve_info }">
					
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