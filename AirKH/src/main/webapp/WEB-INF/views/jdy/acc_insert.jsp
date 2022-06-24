<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 등록</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/grid.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/insert.css" />
</head>
<body>
	<jsp:include page="./include/host_top.jsp" />
	<div class="progress-container">
    	<div class="progress-bar" id="myBar"></div>
	</div>
	<section class="insert" id="scroller">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<form action="<%=request.getContextPath() %>/acc_insert_ok.do" 
					method="post"  enctype="multipart/form-data">
					
					<input type="hidden" name="acc_host" value="${host_num }">
						<div class="acc-info">
							<h2>등록하실 숙소 종류는 무엇인가요?</h2>
							<h3>건물 유형을 선택하세요</h3>
							<select name="acc_build" required>
								<option value="" selected>건물 유형 선택</option>
								<option value="house">주택</option>
								<option value="apt">아파트</option>
								<option value="guestHouse">게스트하우스</option>
								<option value="hotel">호텔</option>
								<option value="villa">빌라</option>
							</select>
							<h2>게스트가 묵게 될 숙소 유형을 골라주세요.</h2>
							<div class="acc_type">
								<input
									type="radio"
									id="acc_type1"
									name="acc_type"
									value="whole"
									required
								/>
								<label for="acc_type1">집 전체</label>
								<div class="desc">
									게스트가 숙소 전체를 다른 사람과 공유하지 않고 단독으로
									이용합니다. 일반적으로 침실, 욕실, 부엌이 포함됩니다.
								</div>
								<input
									type="radio"
									id="acc_type2"
									name="acc_type"
									value="private"
								/>
								<label for="acc_type2">개인실</label>
								<div class="desc">
									게스트에게 개인 침실이 제공됩니다. 침실 이외의 공간은 공용일
									수 있습니다.
								</div>
								<input
									type="radio"
									id="acc_type3"
									name="acc_type"
									value="multi"
								/>
								<label for="acc_type3">다인실</label>
								<div class="desc">
									게스트는 개인 공간 없이, 다른 사람과 함께 쓰는 침실이나 공용
									공간에서 숙박합니다.
								</div>
							</div>
							<h2>숙소에 얼마나 많은 인원이 숙박할 수 있나요?</h2>
							<div class="desc">
								모든 게스트가 편안하게 숙박할 수 있도록 침대가 충분히 구비되어
								있는지 확인하세요.
							</div>
							<label class="margin-label" for="maxp">최대 숙박 인원</label>
							<input
								type="number"
								id="maxp"
								name="acc_maxp"
								min="1"
								required
							/>
							<h3>게스트가 사용할 수 있는 침실은 몇 개인가요?</h3>
							<label class="margin-label" for="bedroom">침실</label>
							<input
								type="number"
								id="bedroom"
								name="acc_bedroom"
								min="0"
								required
							/>
							<label for="bed">침대</label>
							<input type="number" id="bed" name="acc_bed" min="0" required />
							<h3>욕실 수</h3>
							<div class="desc">
								샤워실 또는 욕조가 없는 경우 0.5개로 간주합니다.
							</div>
							<label class="margin-label" for="bath">욕실</label>
							<input
								type="number"
								id="bath"
								name="acc_bath"
								min="0"
								required
							/>
							<h3>숙소의 위치를 알려주세요.</h3>
							<div class="desc">
								정확한 숙소 주소는 게스트가 예약을 완료한 후에만 공개됩니다.
							</div>
							<table>
								<tr>
									<td>
										<label for="acc_country">&nbsp;&nbsp;국가/지역&nbsp;</label>
										<input type="text" id="acc_country" name="acc_country" required />
									</td>
									<td>
										<label for="acc_city">&nbsp;&nbsp;시 / 도</label>
										<input type="text" id="acc_city" name="acc_city" required />
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<label for="acc_addr">도로명 주소</label>
										<input type="text" id="acc_addr" name="acc_addr" required />
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<label class="margin-label" for="mail">&nbsp;&nbsp;우편번호&nbsp;&nbsp;</label>
										<input type="text" id="mail" name="acc_mail" required />
									</td>
								</tr>
							</table>
							
							<h2>어떤 편의시설을 제공하시나요?</h2>
							<div class="desc">
								일반적으로 게스특가 기대하는 편의시설 목록입니다. 숙소를
								등록한 후 언제든 편의시설을 추가할 수 있어요.
							</div>
							<div class="check-box">
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
							<h2>안전 시설</h2>
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
							<h2>숙소 사진 업로드하기</h2>
							<div class="desc">
								게스트가 사진을 보고 숙소의 느낌을 생생히 떠올려볼 수 있도록
								해주세요.
							</div>
							<input type="file" name="file" id="acc_thumbnail" multiple/>
							<h2>게스트에게 숙소에 대해 설명해주세요.</h2>
							<div class="desc">
								숙소에 대해 간략히 설명해주세요. 숙소와 주변 지역에 대한
								정보에서 시작해 게스트와 어떻게 소통하고 싶은지 등의 내용을
								적어주세요.
							</div>
							<textarea
								name="acc_detail"
								id="acc_detail"
								cols="100"
								rows="10"
							></textarea>
							<h2>이름 지정</h2>
							<div class="desc">
								숙소의 특징과 장점을 강조하는 제목을 정해 게스트의 관심을
								끌어보세요.
							</div>
							<input type="text" name="acc_name" id="acc_name" />
							<h2>숙소에 어울리는 테마는 무엇인가요?</h2>
							<c:set var="list" value="${tList }"/>
							<select name="acc_theme" required>
								<option value="" selected>테마 선택</option>
								<c:if test="${!empty list }">
									<c:forEach items="${list }" var="dto">
										<option value="${dto.theme_code }">${dto.theme_name }</option>
									</c:forEach>
								</c:if>
							</select>
							<h2>휴대폰 번호 추가하기</h2>
							<input type="text" name="acc_phone" />
							<h2>숙소 요금 설정하기</h2>
							<input type="text" name="acc_price" />&nbsp;&bsol;
							<h2>첫 게스트를 위한 특별가 제안</h2>
							<div class="event">
								<input
									type="radio"
									id="event_y"
									name="acc_spec"
									value="3"
									required
								/>
								<label for="event_y"
									>첫 게스트에게 20% 할인을 제공해보세요<strong class="rec">추천</strong>
								</label>
								<div class="desc">
									숙소를 예약하는 게스트 선착순 3명은 20% 할인이 적용됩니다.
									이 특별가 제안으로 새로운 게스트를 유인하고 평점을 받는데
									필요한 후기 3개를 채울 수 있을 거예요.
								</div>
								<input
									type="radio"
									id="event_n"
									name="acc_spec"
									value="0"
									required
								/>
								<label for="event_n">특별 할인가 제공하지 않음</label>
								<div class="desc">
									숙소를 등록한 후에는 특별 할인가를 추가할 수 없습니다.
								</div>
							</div>
						</div>
						<input class="submit-btn" type="submit" value="숙소등록하기"/>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
<script>

//When the user scrolls the page, execute myFunction
window.onscroll = function() {myFunction()};

function myFunction() {
  var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
  var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
  var scrolled = (winScroll / height) * 100;
  document.getElementById("myBar").style.width = scrolled + "%";
}
</script>
</html>
								