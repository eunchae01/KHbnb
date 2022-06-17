<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 숙소 수정</title>
</head>
<body>

	<c:set var="dto" value="${Cont }" />
	<c:set var="list" value="${oList }" />
	<c:set var="off" value="${offer }" />
	
	<form action="<%=request.getContextPath() %>/acc_modify_ok.do" method="post">
		<input type="hidden" name="acc_code" value="${dto.acc_code }" >
		<input type="hidden" name="acc_host" value="${dto.acc_host }" >
			
		<div class="input-box">
			<label for="name">숙소 이름</label>
			<input name="acc_name" id="name" value="${dto.acc_name }" />
		</div>
		
		<div class="input-box">
			<label for="theme">숙소 테마</label>
			<input name="acc_theme" id="theme" value="${dto.acc_theme }" />
		</div>
		
		<div class="input-box">
			<label for="detail">숙소 설명</label>
			<input name="acc_detail" id="detail" value="${dto.acc_detail }" />
		</div>
		
		<div class="input-box">
			<label for="phone">숙소 연락처</label>
			<input name="acc_phone" id="phone" value="${dto.acc_phone }" />
		</div>
		
		<div class="input-box">
			<label for="detail">국가/지역</label>
			<input name="acc_country" id="detail" value="${dto.acc_country }" />
			<label for="detail">시/도</label>
			<input name="acc_city" id="detail" value="${dto.acc_city }" />
			<label for="detail">도로명 주소</label>
			<input name="acc_addr" id="detail" value="${dto.acc_addr }" />
			<label for="mail">우편번호</label>
			<input name="acc_mail" id="mail" value="${dto.acc_mail }" />
		</div>
		
		<div class="input-box">
			<label for="phone">숙소 연락처</label>
			<input name="acc_phone" id="phone" value="${dto.acc_phone }" />
		</div>
		
		<div class="input-box">
			<label for="price">숙소 가격</label>
			<input name="acc_price" id="price" value="${dto.acc_price }" />&nbsp;&bsol;
		</div>
		
		<div class="input-box">
			<label for="build">건물 유형</label>
			<input name="acc_build" id="build" value="${dto.acc_build }" />
		</div>
		
		<div class="input-box">
			<label for="type">숙소 유형</label>
			<input name="acc_type" id="type" value="${dto.acc_type }" />
		</div>
		
		<div class="input-box">
			<label for="maxp">최대 숙박 인원</label>
			<input name="acc_maxp" id="maxp" value="${dto.acc_maxp }" />
		</div>
		
		<div class="input-box">
			<label for="bedroom">침실수</label>
			<input
				type="number"
				id="bedroom"
				name="acc_bedroom"
				min="0"
				required
				value="${dto.acc_bedroom }"
			/>
			<label for="bed">침대수</label>
			<input type="number" id="bed" name="acc_bed" min="0" required value="${dto.acc_bed }"/>
			<label for="bath">욕실수</label>
			<input
				type="number"
				id="bath"
				name="acc_bath"
				min="0"
				required
				value="${dto.acc_bath }"
			/>
		</div>
		
		<div class="check-box">
			<div>편의 시설</div>
			<input type="checkbox" name="acc_offer" value="0" checked/>필수 품목
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
			<input
				type="checkbox"
				name="conv"
				value="dryer"
			/>헤어드라이어
		</div>
		<div>편의 시설</div>
		<div class="check-box">
			<input type="checkbox" name="acc_offer" value="9" />화재 감지기
			<div class="desc">
				잘 작동하는 화재 감지기를 모든 방에 구비해 놓아야 하는지
				현지 법규를 확인해보세요.
			</div>
			<input type="checkbox" name="acc_offer" value="10" />일산화탄소 감지기
			<div class="desc">
				일산화탄소 감지기 구비 요건에 대해 현지 법규를 확인해보세요.
				지역에 따라, 정상적으로 작동하는 일산화탄소 감지기를 모든
				방에 설치해야 할 수 있습니다.
			</div>
			<input type="checkbox" name="acc_offer" value="11" />구급상자
			<input type="checkbox" name="acc_offer" value="12" />소화기
		</div>
		
		<div>숙소 사진</div>
		<div>
			<img width="200px" class="acc-image" src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_thumbnail }" alt="" />
			<img width="200px" class="acc-image" src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_image1 }" alt="" />
			<img width="200px" class="acc-image" src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_image2 }" alt="" />
			<img width="200px" class="acc-image" src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_image3 }" alt="" />
			<img width="200px" class="acc-image" src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_image4 }" alt="" />
			
			<input type="file" name="file" id="acc_thumbnail" multiple/>
		
		</div>
		
		<input type="submit" value="수정">
	</form>
	
</body>
</html>