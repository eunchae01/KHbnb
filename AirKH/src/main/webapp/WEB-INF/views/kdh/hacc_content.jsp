<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="main_navi.jsp"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/sty.css" />
</head>
<body>

<div align="center">
	<c:set var="dto" value="${Cont}" />
	<c:set var="th" value="${tcont }" />
	<c:set var="olist" value="${Olist }" />
	<c:set var="off" value="${offer}" />
	<br>
		<h2> 숙소 ${dto.acc_name } 내용페이지</h2>
	<br>
	
		<img src="<%=request.getContextPath()%>/resources/upload/2022-06-13/${dto.acc_thumbnail}" width="600px">
		
			<table border="0" cellspacing="0" width="1400">
				<tr>
					<th>숙소코드</th>
					<td>${dto.acc_code}</td>
					
					<th>숙소 호스트</th>
					<td>${dto.acc_host}</td>
					
					<th>숙소 이름</th>
					<td>${dto.acc_name }</td>
				</tr>
				<tr>
				
					<th>숙소나라</th>
					<td>${dto.acc_country }</td>
					
					<th>숙소도시</th>
					<td>${dto.acc_city }</td>
					
					<th>숙소가격</th>
					<td>\<fmt:formatNumber>${dto.acc_price }</fmt:formatNumber>원</td>
					
					
				<tr>
					
					
					
					<th>숙소 건물유형</th>
					<td> ${dto.acc_build }
					</td>
					
					<th>숙소 유형</th>
					<td>
					${dto.acc_type }
					
					</td>
					
					<th>최대 숙박인원</th>
					<td>${dto.acc_maxp }</td>
					
					
				</tr>
				
					<tr>
					
					
					<th>침실 </th>
					<td>${dto.acc_bedroom }</td>
					<th>침대 </th>
					<td>${dto.acc_bed}</td>
					<th>욕실수 </th>
					<td>${dto.acc_bath } </td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>${dto.acc_mail }</td>
					<th>휴대폰번호</th>
					<td>${dto.acc_phone }</td>
				
					<th>도로명주소</th>
					<td>${dto.acc_addr }</td>
					
					
				</tr>
				
				<tr>
				<th>숙소 테마</th>
				<c:set var="list" value="${tList }"/>
				<td> <img src="<%=request.getContextPath() %>/resources/theme/${th.theme_icon }" width="100px"><br>
				${th.theme_name} 
							
				</td>
					<th>숙소에 대한 사항</th>
					<td colspan="3"><textarea name="acc_detail" rows="6" cols="100"  readonly>${dto.acc_detail }</textarea></td>
				
				</tr>
				
				<tr>
					<th>편의 및 안전시설</th>
					<td colspan="5">
					<div class="flex5">
								
									
								<c:forEach items="${off }" var="arr">
								<c:forEach items="${olist }" var="odto">
									
									<c:if test="${arr eq odto.offer_code }">
										<div class="each_item5">
											<img src="<%=request.getContextPath() %>/resources/offer/${odto.offer_icon}" alt="" width="50px" /><br>
											${odto.offer_name }
										</div>
									</c:if>
									
								</c:forEach>
							</c:forEach>
							</div>
							<td>
					</tr>
				
				
			
				
				<tr>
	      	<td colspan="6" align="center">
	      		<input type="button" value="숙소정보수정" onclick="location.href='hacc_modify.do?no=${dto.acc_code}'">
	      		&nbsp;
	      		<input type="button" value="숙소정보삭제" onclick="if(confirm('정말로 글을 삭제하시겟습니까')){
	      			location.href='hacc_delete.do?no=${dto.acc_code}'
	      		}else{return;}">&nbsp;
	      		<input type="button" value="숙소목록" onclick="location.href='hacc_list.do'">
	      		</td>
	      	</tr>
				</table>
				
		
	
	
	
	</div>



</body>
</html>