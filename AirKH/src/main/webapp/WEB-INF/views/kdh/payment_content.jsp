<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="main_navi.jsp"/>
</head>
<body>
	
	<div align="center">
	<c:set var="dto" value="${Cont }"/>
	<br>
		<h2> 결제 테이블 ${dto.acc_name}상세내역 페이지</h2>
		
		
	<br>
	
	<br>
	<img src="<%=request.getContextPath()%>/resources/upload/2022-06-13/${dto.acc_thumbnail}"  width="500px" height="350px">
	<br>
	<br>
	<br>
	
		
		
			<table border="0" cellspacing="0" width="1000">
				<tr>
					<th>결제번호</th>
					<td>${dto.cart_num }</td>
					<th>숙소코드</th>
					<td>${dto.acc_code} </td>
					
					<th>숙소 이름</th>
					<td>${dto.acc_name }</td>
				</tr>
				<tr>
					<th>결제 금액</th>
					<td colspan="5">\<fmt:formatNumber>${dto.acc_price}</fmt:formatNumber>원</td>
					
					
				</tr>
					<tr>
					<th>숙소주소</th>
					<td colspan="5">${dto.acc_addr}</td>
					
					
				
				
				<tr>
					<th>고객이름</th>
					<td colspan="2">${dto.member_name }</td>
					
					<th>고객 전화번호</th>
					<td colspan="2">${dto.member_phone } </td>
				</tr>
				
				<tr>
					<th>고객주소</th>
					<td colspan="2">${dto.member_addr }</td>
					<th>결제날짜</th>
					<td colspan="2">${dto.cart_date.substring(0,10) }</td>
					
					
				</tr>
				
				<tr>
					<th>체크인 </th>
					<td>${dto.check_in} </td>
					<th> 체크아웃</th>
					<td>${dto.check_out}</td>
					<th>숙박 인원</th>
					<td>${dto.check_person }</td>
				</tr>
					<tr>
					<th>호스트 이름</th>
					<td>${dto.host_name }</td>
					<th>호스트 연락처</th>
					<td>${dto.host_phone }</td>
					<th>결제분류</th>
					<td>
					${dto.reserve_info }
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
				<td colspan="6"><br>
				</td>
				</tr>
			
				
				<tr>
					<td colspan="6" align="center">
					<input type="button" value="숙소별 매출액"
			               onclick="location.href='payment_tolist.do?no=${dto.cart_num}&page=${Page }'">
			               &nbsp;
						<input type="button" value="결제내역수정"
			               onclick="location.href='payment_modify.do?no=${dto.cart_num}&page=${Page }'">
			               &nbsp;
			            <input type="button" value="결제내역삭제"
			               onclick="if(confirm('정말로 결제내역을 삭제하겠습니까?')) {
			               				location.href='payment_delete.do?no=${dto.cart_num}&page=${Page }'
			               		    }else {  return; }">
			               &nbsp;
			            <input type="button" value="결제목록"
			               onclick="location.href='payment_list.do?page=${Page }'">
				</table>
				
		
	
	
	
	</div>

</body>
</html>