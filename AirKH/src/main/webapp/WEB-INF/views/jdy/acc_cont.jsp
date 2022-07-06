<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 상세</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/grid.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main_style.css" />
<script type="text/javascript">
$(function() {
	let today = new Date();   
	let year = today.getFullYear(); // 년도
	let month = today.getMonth() + 1;  // 월
	let date = today.getDate();  // 날짜
	$("#ck_in").text( year + '-' + month + '-' + date);
	$("#ck_out").text(year + '-' + month + '-' + date);
	});
	</script>

<script type="text/javascript">
$(function () {
    $('#day').daterangepicker({
        "locale": {
            "format": "YYYY-MM-DD",
            "separator": " ~ ",
            "applyLabel": "확인",
            "cancelLabel": "취소",
            "fromLabel": "From",
            "toLabel": "To",
            "customRangeLabel": "Custom",
            "weekLabel": "W",
            "daysOfWeek": ["월", "화", "수", "목", "금", "토", "일"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            "firstDay": 1
        },
        "drops": "down"
    }, function (start, end, label) {
        console.log(start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
    	let ck_in=start.format('YYYY-MM-DD');
    	let ck_out=end.format('YYYY-MM-DD');
    	
    	let date1=new Date(ck_in);
    	let date2=new Date(ck_out);
    	let difDate= date1.getTime() - date2.getTime();
    	let total=Math.abs(difDate / (1000 * 60 * 60 * 24));
    	$("#ck_in").text( ck_in);
    	$("#ck_out").text(ck_out);
    	$("#ck_day").text(total);
    	$("#ck_day2").text(total);
    	let pri=$("#totalp").val();
    	let total_price=pri*total;
    	let service=total_price*0.1;
    	let tomoney=service+total_price;
    	$("#totalp2").text("₩"+(total_price.toLocaleString(undefined, { maximumFractionDigits: 0 }))+"원")
    	$("#totals2").text("₩"+(service.toLocaleString(undefined, { maximumFractionDigits: 0 }))+"원")
    	$("#totalm2").text("₩"+(tomoney.toLocaleString(undefined, { maximumFractionDigits: 0 }))+"원")
    });
    
   
});

</script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/grid.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cont.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/modal.css" />
</head>
<body>
	
	<jsp:include page="./include/main_top.jsp" />
	<c:set var="dto" value="${Cont }" />
	<c:set var="list" value="${oList }" />
	<c:set var="off" value="${offer }" />
	<c:set var="like" value="${like }" />
	<c:set var="cwish" value="${cwish }" />
	<c:set var="host" value="${Host }" />
	<c:set var="id_check" value="${id_check }" />
	<c:set var="avg" value="${re_avg }"/>
	
	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h1 class="cont-title">
						${dto.acc_name }
					</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="head-box">
						<ul>
							<li class="rate">
								<c:if test="${avg eq '0' }">
									<strong>&nbsp;NEW&nbsp;&middot;&nbsp;</strong>
								</c:if>
								<c:if test="${avg ne '0' }">
									<img class="icons" src="<%=request.getContextPath() %>/resources/assets/star.png" alt="" />
									<strong>&nbsp;<fmt:formatNumber value="${dto.acc_star }" pattern=".0"/>&nbsp;&middot;&nbsp;</strong>
								</c:if>
							</li>
							<li><a href="#">후기 ${count }개</a>&nbsp;&middot;&nbsp;</li>
							<li><a href="#">${dto.acc_city }, ${dto.acc_country }</a></li>
						</ul>
					<div class="rate">
							<c:if test="${!empty like }">
								<img class="icons"
									src="<%=request.getContextPath()%>/resources/assets/red-heart.png"
									alt="" />
								<a
									href="<%=request.getContextPath() %>/wish_delete.do?acc_code=${dto.acc_code}"><strong>&nbsp;찜하기</strong></a>
							</c:if>

							<c:if test="${empty like }">
								<img class="icons"
									src="<%=request.getContextPath()%>/resources/assets/blank-heart.png"
									alt="" />
								<a data-bs-toggle="modal" data-bs-target="#staticBackdrop"
									href="#"><strong>&nbsp;찜하기</strong></a>

								<div class="modal fade" id="staticBackdrop"
									data-bs-backdrop="static" data-bs-keyboard="false"
									tabindex="-1" aria-labelledby="staticBackdropLabel"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content"
											style="width: 600px; height: 600px;">
											<div class="modal-header" align="center">
												<h3 align="center" class="modal-title"
													id="staticBackdropLabel">
													<strong>위시 리스트</strong>
												</h3>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">

												<table>
													<tr>
														<td style="padding: 10px;"><a href="#"><img
																style="width: 80px; height: 80px;"
																src="<%=request.getContextPath()%>/resources/assets/wishbutton.png"
																alt="" /></a></td>
														<td style="padding: 10px;"><strong><a
																href="#" data-bs-toggle="modal"
																data-bs-target="#staticBackdrop4">새로운 위시리스트 만들기</a></strong></td>
													</tr>

													<c:if test="${!empty cwish }">
														<c:forEach items="${cwish }" var="cate" varStatus="index">
															<tr>
																<td style="padding-top: 10px; padding-left: 5px;"><a
																	href="<%=request.getContextPath() %>/wish_add.do?wish_category=${cate.getWish_category()}&&acc_code=${dto.acc_code}"><img
																		style="width: 80px; height: 80px; border-radius: 20%;"
																		src="<%=request.getContextPath() %>
											/resources/upload/${dto.acc_date.substring(0, 10) }/${index.index }.png"
																		alt="" class="thumbnail" /></a></td>
																<td style="font-size:20px; padding: 10px; padding-left: 5px;"><a style="text-decoration:none;"
																	href="<%=request.getContextPath() %>/wish_add.do?wish_category=${cate.getWish_category()}&&acc_code=${dto.acc_code}"><strong>${cate.getWish_category() }</strong></a></td>
															</tr>
														</c:forEach>
													</c:if>

												</table>
											</div>
										</div>
									</div>
								</div>

								<div class="modal fade" id="staticBackdrop4"
									data-bs-backdrop="static" data-bs-keyboard="false"
									tabindex="-1" aria-labelledby="staticBackdropLabel"
									aria-hidden="true">
									<div class="modal-dialog">
										<div style="width: 600px;" class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="staticBackdropLabel">
													위시리스트 이름 정하기</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
											<form action="<%=request.getContextPath() %>/wish_category_add.do">
											<br>
											<input name="wish_category" id="wish_category" style="background-color:white; font-size:20px; color:green; border:0px; width: 100%" type="text" placeholder="이름(최대  50자)">
											<input type="hidden" name="member_id" value="${member_id }">
											<input type="hidden" name="acc_code" value="${dto.getAcc_code() }">
											<input type="hidden" name="acc_thumbnail" value="${dto.getAcc_thumbnail() }">
											<input type="hidden" name="acc_addr" value="${dto.getAcc_addr() }">
											<input type="hidden" name="acc_name" value="${dto.getAcc_name() }">
											<input type="hidden" name="acc_price" value="${dto.getAcc_price() }">
											<input type="hidden" name="acc_maxp" value="${dto.getAcc_maxp() }">
											<input type="hidden" name="acc_bedroom" value="${dto.getAcc_bedroom() }">
											<input type="hidden" name="acc_bed" value="${dto.getAcc_bed() }">
											<input type="hidden" name="acc_bath" value="${dto.getAcc_bath() }">
											<input type="hidden" name="acc_star" value="${dto.getAcc_star() }">
											<br><br>
											<input class="btn btn-outline-success" style="width: 100%" type="submit" value="새로만들기">
											</form>
											</div>	
										</div>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<section class="cont-images">
		<div class="container">
			<div class="row">
				<div class="col-6">
					<div class="thumbnail-frame">
						<img src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_thumbnail }" alt="" class="thumbnail" />
					</div>
				</div>
				<div class="col-3">
					<img src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_image1 }" alt="" class="aoc-img up-img" />
					<img src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_image2 }" alt="" class="aoc-img" />
				</div>
				<div class="col-3">
					<div class="top-image-frame">
						<img src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_image3 }" alt="" class="aoc-img up-img" />
					</div>
					<div class="bottom-image-frame">
						<img src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_image4 }" alt="" class="aoc-img" />
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="cont-desc-section">
		<div class="container">
			<div class="row">
				<div class="col-8 desc-h2">
					<div class="desc-head com-box">
						<div class="desc-title-box">
							<h2>${host.host_name}님이 호스팅하는 <br> ${dto.acc_name }</h2>
							<ul>
								<li>최대 인원 ${dto.acc_maxp }명&nbsp;</li>
								<li>&middot; 침실 ${dto.acc_bedroom }개&nbsp;</li>
								<li>&middot; 침대 ${dto.acc_bed }개&nbsp;</li>
								<li>&middot; 욕실 ${dto.acc_bath }개</li>
							</ul>
						</div>
						<a href="#host-top">
							<img src="<%=request.getContextPath() %>/resources/host/${host.host_pic}" alt="" class="host-profile" />
						</a>
					</div>
					<div class="com-box">
						<h2><span class="pink-color">KH</span>커버</h2>
						<p>
							모든 예약에는 호스트가 예약을 취소하거나 숙소 정보가 정확하지
							않은 경우 또는 체크인에 문제가 있는 상황에 대비한 무료 보호
							프로그램이 포함됩니다.
						</p>
						<a href="#" class="fake-a">더 알아보기</a>
					</div>
					<div class="com-box">
						<h2>숙소 설명</h2>
						<p>
							${dto.acc_detail }
						</p>
					</div>
					<div class="com-box">
						<h2>숙박 장소</h2>
						<div class="room-frame">
							<div class="room-box">
								<img src="<%=request.getContextPath() %>/resources/assets/room.png" alt="" class="bedroom-img" />
								<div class="room-h">침실 ${dto.acc_bedroom }</div>
							</div>
							<div class="room-box">
								<img src="<%=request.getContextPath() %>/resources/assets/bed.png" alt="" class="bedroom-img" />
								<div class="room-h">침대 ${dto.acc_bed }</div>
							</div>
							<div class="room-box">
								<img src="<%=request.getContextPath() %>/resources/assets/bathtub.png" alt="" class="bedroom-img" />
								<div class="room-h">욕실 ${dto.acc_bath }</div>
							</div>
						</div>
					</div>
					<div class="com-box">
						<h2>숙소 편의 및 안전 시설</h2>
						<div class="offer-frame">
							<c:forEach items="${off }" var="arr">
								<c:forEach items="${list }" var="odto">
									<c:if test="${arr eq odto.offer_code }">
										<div class="offer-box">
											<img class="offer-img" src="<%=request.getContextPath() %>/resources/offer/${odto.offer_icon}" alt="" />
											<p class="offer-name">${odto.offer_name }</p>
										</div>
									</c:if>
								</c:forEach>
							</c:forEach>
						</div>
					</div>
					<div class="com-box">
						<h2>${dto.acc_country }에서
							<span id="ck_day">1</span>박
						</h2>
						<br>
						<h3>
							예약 날짜: <span id="ck_in"></span> - <span id="ck_out"></span>
						</h3>
						<br> <a href="#day" class="fake-a">날짜 변경 하기</a>
					</div>
				</div>
				<div class="col-4">
					<div class="bill-container">
						<div class="bill-top">					
							<h3 class="bill-price">&#65510;<fmt:formatNumber value="${dto.acc_price  }" />&nbsp;<span>/박</span></h3>
							<div class="bill-review">
								<c:if test="${dto.acc_star eq '0' }">
									<strong>&nbsp;NEW</strong>
								</c:if>
								<c:if test="${dto.acc_star ne '0' }">
									<img class="icons" id="bill-star" src="<%=request.getContextPath() %>/resources/assets/star.png" alt="" />
									<strong>&nbsp;&middot;&nbsp;&nbsp;<fmt:formatNumber value="${dto.acc_star }" pattern=".0"/>&nbsp;&middot;&nbsp;</strong>
									<a href="#" id="review-count">후기 ${count }개</a>
								</c:if>
							</div>
						</div>
						<form method="post"
							action="<%=request.getContextPath()%>/payment.do?acc_code=${dto.getAcc_code() }">
							<strong class="bill-label">날짜 검색</strong>
							<input class="btn btn-outline-danger"
								min="${minDate }" type="text" id="day" name="day">
							<strong class="bill-label">인원</strong>
							<input class="btn btn-outline-danger"
								type="number" id="guest" name="guest" value="1" min="1"
								max="${dto.acc_maxp }">
							<button type="submit" class="btn btn-danger" id="purchase-btn" >예약하기</button>
							<p class="bill-info">예약 확정 전에는 요금이 청구 되지 않습니다.</p>
						</form>
						<div class="bill-dldd">
							<dl class="bill-dl">
								<dt>
									<input id="totalp" type="hidden" value="${dto.acc_price  }" /> 
											&#65510;<fmt:formatNumber value="${dto.acc_price  }" />
									 X <span id="ck_day2"></span>박
								</dt>
								<dd>
									<span id="totalp2"></span>
								</dd>
							</dl>
							<dl class="bill-dl">
								<dt>
									서비스 수수료
								</dt>
								<dd>
									<span id="totals2"></span>
								</dd>
							</dl>
							<hr>
							<dl class="bill-dl bill-total">
								<dt>
									총 합계
								</dt>
								<dd>
									<span id="totalm2"></span>
								</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<c:set var="re_list" value="${review_list}"/>
	<c:set var="count" value="${count}"/>
	<c:set var="vi" value="${re_avg }"/>
	
	<section class="review-section">
		<div class="container">
			<div class="row">
				<div class="col-12 review-hr">
					<ul class="review-head">
						<li class="rate">
							<c:if test="${dto.acc_star eq '0' }">
								<img class="icons" src="<%=request.getContextPath() %>/resources/assets/blank-star.png" alt="" />
								<h2>&nbsp;NEW&nbsp;&middot;&nbsp;</h2>
							</c:if>
							<c:if test="${dto.acc_star ne '0' }">
								<img class="icons" src="<%=request.getContextPath() %>/resources/assets/star.png" alt="" />
								<h2>&nbsp;${dto.acc_star }&nbsp;&middot;&nbsp;</h2>
							</c:if>
						</li>
						<li><h2>&nbsp;후기 ${count }개</h2></li>
					</ul>
					<div class="score-box">
						<div class="score-rbox">
							<dl class="score-dtdd">
								<dt class="score-dt">청결도</dt>
								<dd class="score-dd"><fmt:formatNumber value="${vi.cl_avg }" pattern=".0"/></dd>
							</dl>
							<dl class="score-dtdd">
								<dt class="score-dt">의사소통</dt>
								<dd class="score-dd"><fmt:formatNumber value="${vi.comm_avg }" pattern=".0"/></dd>
							</dl>
							<dl class="score-dtdd">
								<dt class="score-dt">체크인</dt>
								<dd class="score-dd"><fmt:formatNumber value="${vi.check_avg }" pattern=".0"/></dd>
							</dl>
						</div>
						<div class="score-rbox">
							<dl class="score-dtdd">
								<dt class="score-dt">정확성</dt>
								<dd class="score-dd"><fmt:formatNumber value="${vi.acc_avg}" pattern=".0"/></dd>
							</dl>
							<dl class="score-dtdd">
								<dt class="score-dt">위치</dt>
								<dd class="score-dd"><fmt:formatNumber value="${vi.loc_avg }" pattern=".0"/></dd>
							</dl>
							<dl class="score-dtdd">
								<dt class="score-dt">가격 대비 만족도</dt>
								<dd class="score-dd"><fmt:formatNumber value="${vi.sat_avg }" pattern=".0"/></dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
			<div class="row review-bottom">
			<c:forEach items="${re_list }" var="mo">
				<div class="col-6">
					<div class="review-list">
						<div class="rlist-top">
							<img src="<%=request.getContextPath()%>/resources/member/${mo.member_pic }" alt="" />
							<div class="rlist-title">
								<div class="rlist-name">${mo.member_id }</div>
								<div class="rlist-date">
									${mo.review_date.substring(0,10) }
								</div>
							</div>
						</div>
						<div class="rlist-cont">${mo.review_content }</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</section>
	
	<section class="host-section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div id="host-top">
						<img src="<%=request.getContextPath() %>/resources/host/${host.host_pic}" alt="" class="host-profile" />
						<div class="host-title">
							<h4>호스트: ${host.host_name }</h4>
							<p>회원 가입일: ${host.host_date.substring(0, 4) }년 ${host.host_date.substring(5, 7) }월&nbsp;&middot;&nbsp;사업자 정보</p>
						</div>
					</div>	
					<div class="host-spec">
						<img src="<%=request.getContextPath() %>/resources/assets/star.png" alt="" class="icons" />
						<p>후기 ${count }개</p>
						<img src="<%=request.getContextPath() %>/resources/assets/secure.png" alt="" class="icons" />
						<p>본인 인증 완료</p>
					</div>
					<div class="host-intro">${host.host_int }</div>
				</div>
			</div>
		</div>		
	</section>
	
	<section class="need-to-know">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2>알아두어야 할 사항</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-4 know-col">
					<strong>숙소 이용규칙</strong>
					<div class="know-row">
						<img src="<%=request.getContextPath() %>/resources/assets/clock.png" alt="" class="icons" />
						<p>체크인: 오후 3:00 - 오후 10:00</p>
					</div>
					<div class="know-row">
						<img src="<%=request.getContextPath() %>/resources/assets/clock.png" alt="" class="icons" />
						<p>체크아웃 시간: 오전 11:00</p>
					</div>
					<div class="know-row">
						<img src="<%=request.getContextPath() %>/resources/assets/no-smoking.png" alt="" class="icons" />
						<p>흡연 금지</p>
					</div>
					<div class="know-row">
						<img src="<%=request.getContextPath() %>/resources/assets/no-pets-allowed.png" alt="" class="icons" />
						<p>반려동물 동반 불가</p>
					</div>
				</div>
				<div class="col-4 know-col">
					<strong>건강과 안전</strong>
					<div class="know-row">
						<img src="<%=request.getContextPath() %>/resources/assets/shines.png" alt="" class="icons" />
						<p>에어비앤비 코로나19 방역 수칙을 준수하셔야 합니다.</p>
					</div>
					<div class="know-row">
						<img src="<%=request.getContextPath() %>/resources/assets/exclamation-mark.png" alt="" class="icons" />
						<p>근처에 호수, 강, 바다 등이 있음</p>
					</div>
					<div class="know-row">
						<img src="<%=request.getContextPath() %>/resources/assets/cctv.png" alt="" class="icons" />
						<p>보안 카메라/녹화 장치</p>
					</div>
				</div>
				<div class="col-4 know-col">
					<strong>환불 정책</strong>
					<div class="know-row">
						<p>체크인 날짜 전에 취소하면 부분 환불을 받으실 수 있습니다.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<jsp:include page="./include/footer.jsp"></jsp:include>
	
</body>
</html>
							