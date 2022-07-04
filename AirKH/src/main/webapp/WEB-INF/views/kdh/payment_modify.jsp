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
	<c:set var="dto" value="${Modi}"/>
	<br>
		<h2> 결제 테이블 ${dto.acc_name}수정 페이지</h2>
	<br>
	
		<form method="post" enctype="multipart/form-data"
	      action="<%=request.getContextPath() %>/payment_modify_ok.do">
			<input type="hidden" name="cart_num" value="${dto.cart_num }">
			<input type="hidden" name="page" value="${Page }">
			<input type="hidden" name="acc_thumbnail" value="${dto.acc_thumbnail }">
		
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
					
					<th>숙소주소</th>
					<td colspan="2"><input name="acc_addr" value="${dto.acc_addr}"></td>
				</tr>
					<tr>
					
					<th>숙소 이미지</th>
					<td colspan="5">${dto.acc_thumbnail }<input type="file" name="file2" value="" ></td>
					
				
				
				
				<tr>
					<th>고객이름</th>
					<td colspan="2"><input name="member_name" value="${dto.member_name }"></td>
					
					<th>고객 전화번호</th>
					<td colspan="2"><input name="member_phone" value="${dto.member_phone }"> </td>
				</tr>
				
				<tr>
					
					<th>결제날짜</th>
					
					
					<td colspan="2">
					<input type="date" name="cart_date" id="datepicker" value="${dto.cart_date}"></td>
					<th>숙박 인원</th>
					<td colspan="2"><input type="number" name="check_person" min="1" max="14" value="${dto.check_person }"></td>
					
				</tr>
				
				<tr>
					<th>체크인</th>
					<td colspan="2"><input type="date" name="check_in" id="datepicker" value="${dto.check_in} "></td>
					<th> 체크아웃 </th>
					<td colspan="2"><input type="date" name="check_out" id="datepicker" value="${dto.check_out} "></td>
					
				</tr>
				
					<tr>
					<th>호스트 이름</th>
					<td colspan="2"><input name="host_name"value="${dto.host_name }"></td>
					<th>호스트 전화번호</th>
					<td colspan="2"><input name="host_phone"value="${dto.host_phone }"></td>
					
					
	    		 
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