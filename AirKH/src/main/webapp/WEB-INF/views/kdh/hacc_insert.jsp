<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h2> 숙소테이블  입력페이지</h2>
	<br>
	
		<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/hacc_insert_ok.do">
		
			<table border="0" cellspacing="0" width="1500">
				<tr>
					<th>숙소코드</th>
					<td><input name="acc_code" ></td>
					
					<th>숙소 호스트</th>
					<td><input name="acc_host" ></td>
					
					<th>숙소 이름</th>
					<td colspan="3"><input name="acc_name" size="60" ></td>
				</tr>
				<tr>
				<th>숙소 테마</th>
				<c:set var="list" value="${tList }"/>
				<td>
							<select name="acc_theme" required>
								<option value="" selected>테마 선택</option>
								<c:if test="${!empty list }">
									<c:forEach items="${list }" var="dto">
										<option value="${dto.theme_code }">${dto.theme_name }</option>
									</c:forEach>
								</c:if>
							</select>
				</td>
					<th>숙소나라</th>
					<td><input name="acc_country"></td>
					
					<th>숙소도시</th>
					<td><input name="acc_city"></td>
					
					<th>숙소가격</th>
					<td><input name="acc_price"></td>
					
					
				<tr>
					
					
					<th>숙소 썸네일</th>
					<td><input type="file" name="file"> </td>
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
					<td><input type="number" min="1" max="16" value="4" name="acc_maxp"> </td>
					
					<th>침실 </th>
					<td><input type="number" min="1" max="10" value="2" name="acc_bedroom"> </td>
					<th>침대 </th>
					<td><input type="number" min="1" max="15" value="2" name="acc_bed"> </td>
					<th>욕실수 </th>
					<td><input type="number" min="1" max="10" value="1" name="acc_bath"> </td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input name="acc_mail" ></td>
					<th>휴대폰번호</th>
					<td><input name="acc_phone"></td>
				
					<th>도로명주소</th>
					<td colspan="3"><input type="text" name="acc_addr" size="60"> </td>
					
					
				</tr>
				
				<tr>
					<th>숙소에 대한 사항</th>
					<td align="center" colspan="7"><textarea name="acc_detail" rows="6" cols="100"></textarea></td>
				
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



</body>
</html>