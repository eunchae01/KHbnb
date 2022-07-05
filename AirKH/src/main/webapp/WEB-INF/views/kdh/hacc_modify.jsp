<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/sty.css" />
</head>
<body>
	<div class="wrapper">
		<div class="container0">		
			<jsp:include page="main_navi.jsp"/>

<div align="center">
	<c:set var="dto" value="${Modi}" />
	<c:set var="th" value="${tcont }" />
	<c:set var="olist" value="${Olist }" />
	<c:set var="tlist" value="${tList}" />
	


	<br>
		<h2> 숙소테이블  수정페이지</h2>
	<br>
	
		<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/hacc_modify_ok.do">
			<input type="hidden" name="acc_thumbnail" value="${dto.acc_thumbnail}">
			<input type="hidden" name="acc_image1" value="${dto.acc_image1}">
			<input type="hidden" name="acc_image2" value="${dto.acc_image2}">
			<input type="hidden" name="acc_image3" value="${dto.acc_image3}">
			<input type="hidden" name="acc_image4" value="${dto.acc_image4}">
			<table border="0" cellspacing="0" width="1500">
				<tr>
					<th>숙소코드</th>
					<td><input name="acc_code" value="${dto.acc_code }"></td>
					
					<th>숙소 호스트</th>
					<td><input name="acc_host" value="${dto.acc_host }" ></td>
					
					<th>숙소 이름</th>
					<td colspan="3"><input name="acc_name" size="60" value="${dto.acc_name }"></td>
				</tr>
				<tr>
				<th>숙소 테마</th>
				<c:set var="list" value="${tList }"/>
				<td>
							<select name="acc_theme" required>
								
								<option value="${th.theme_code }"selected>${th.theme_name }</option>
								<c:if test="${!empty list }">
									<c:forEach items="${list }" var="dt">
										<c:if test="${th.theme_name ne dt.theme_name }">
										<option value="${dt.theme_code }">${dt.theme_name }</option>
										</c:if>
									</c:forEach>
								</c:if>
							</select>
				</td>
					<th>숙소나라</th>
					<td><input name="acc_country" value="${dto.acc_country }"></td>
					
					<th>숙소도시</th>
					<td><input name="acc_city" value="${dto.acc_city }"></td>
					
					<th>숙소가격</th>
					<td><input name="acc_price" value="${dto.acc_price }"></td>
					
					
				<tr>
					
					
					<th>숙소 이미지</th>
					<td>${dto.acc_thumbnail }<input type="file" name="file" multiple> </td>
					<th>숙소 건물유형</th>
					<td><select name="acc_build" required>
								<option value="" selected>건물 유형 선택</option>
								<option value="전원주택">주택</option>
								<option value="아파트">아파트</option>
								<option value="게스트하우스">게스트하우스</option>
								<option value="호텔">호텔</option>
								<option value="빌라">빌라</option>
							</select>
					</td>
					
					<th>숙소 유형</th>
					<td colspan="3">
					<input
									type="radio"
									id="acc_type1"
									name="acc_type"
									value="whole"
									required
								/>
								<label for="acc_type1">집 전체</label>
					<input
									type="radio"
									id="acc_type2"
									name="acc_type"
									value="private"
								/>
								<label for="acc_type2">개인실</label>
					<input
									type="radio"
									id="acc_type3"
									name="acc_type"
									value="multi"
								/>
								<label for="acc_type3">다인실</label>
					
					
					</td>
					
					
				</tr>
				
					<tr>
					<th>최대 숙박인원</th>
					<td><input type="number" min="1" max="16" value="${dto.acc_maxp}" name="acc_maxp"> </td>
					
					<th>침실 </th>
					<td><input type="number" min="1" max="10" value="${dto.acc_bedroom}" name="acc_bedroom"> </td>
					<th>침대 </th>
					<td><input type="number" min="1" max="15" value="${dto.acc_bed}" name="acc_bed"> </td>
					<th>욕실수 </th>
					<td><input type="number" min="1" max="10" value="${dto.acc_bath}" name="acc_bath"> </td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input name="acc_mail" value="${dto.acc_mail}"></td>
					<th>휴대폰번호</th>
					<td><input name="acc_phone" value="${dto.acc_phone}"></td>
				
					<th>도로명주소</th>
					<td colspan="3"><input type="text" name="acc_addr" value="${dto.acc_addr}" size="60"> </td>
					
					
				</tr>
				
				<tr>
					<th>숙소에 대한 사항</th>
					<td align="center" colspan="7"><textarea name="acc_detail" rows="6" cols="100">${dto.acc_detail }</textarea></td>
				
				</tr>
				
				<tr>
					<th>편의시설</th>
					<td colspan="4">
					<div class="check-box">
								필수 품목
								<div class="desc">
									수건, 침대 시트, 비누, 화장지, 베개
								</div>
								<input type="checkbox" name="acc_offer" value="1" />무선인터넷
								<input type="checkbox" name="acc_offer" value="2" />샴푸
								<input type="checkbox" name="acc_offer" value="3" />TV
								<input type="checkbox" name="acc_offer" value="4" />난방
								<input type="checkbox" name="acc_offer" value="5" />에어컨
								<input type="checkbox" name="acc_offer" value="6" />조식, 커피, 차 
								<input type="checkbox" name="acc_offer" value="7" />업무 가능 공간/책상
								<input type="checkbox" name="acc_offer" value="8" />다리미
								
							</div></td>
							
						
					<th>안전 시설</th>
					<td colspan="2">
							<div class="check-box">
								<input type="checkbox" name="acc_offer" value="9" />화재 감지기
								
								<input type="checkbox" name="acc_offer" value="10" />일산화탄소 감지기<br>
								
								<input type="checkbox" name="acc_offer" value="11" />구급상자
								<input type="checkbox" name="acc_offer" value="12" />소화기
							</div>
					</td>
					</tr>
				
				
			
				
				<tr>
					<td colspan="8" align="center">
						<input type="submit" value="숙소수정">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성">
				</table>
				
		</form>
	
			</div>
		</div>
	</div>



</body>
</html>