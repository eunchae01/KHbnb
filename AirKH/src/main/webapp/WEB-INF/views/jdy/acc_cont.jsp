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
        console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
    });
});

</script>


<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/grid.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cont.css" />
</head>
<body>

	<jsp:include page="./include/main_top.jsp" />
	<c:set var="dto" value="${Cont }" />
	<c:set var="list" value="${oList }" />
	<c:set var="off" value="${offer }" />
	<c:set var="like" value="${like }" />
	<c:set var="host" value="${Host }" />
	
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
								<c:if test="${dto.acc_star eq '0' }">
									<strong>&nbsp;NEW&nbsp;&middot;&nbsp;</strong>
								</c:if>
								<c:if test="${dto.acc_star ne '0' }">
									<img class="icons" src="<%=request.getContextPath() %>/resources/assets/star.png" alt="" />
									<strong>&nbsp;4.5&nbsp;&middot;&nbsp;</strong>
								</c:if>
							</li>
							<li><a href="#">후기 000개</a>&nbsp;&middot;&nbsp;</li>
							<li><a href="#">${dto.acc_city }, ${dto.acc_country }</a></li>
						</ul>
						<div class="rate">
							<c:if test="${!empty like }">
							<img class="icons" src="<%=request.getContextPath() %>/resources/assets/heart.png" alt="" />
							<a href="<%=request.getContextPath() %>/wish_delete.do?acc_code=${dto.acc_code}"><strong>&nbsp;찜하기</strong></a>
							</c:if>

							<c:if test="${empty like }">
							<img class="icons" src="<%=request.getContextPath() %>/resources/assets/blank-heart.png" alt="" />
							<a href="<%=request.getContextPath() %>/wish_add.do?acc_code=${dto.acc_code}"><strong>&nbsp;찜하기</strong></a>
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
							<h2>${host.host_name }님이 호스팅하는 <br>${dto.acc_name }</h2>
							<ul>
								<li>최대 인원 ${dto.acc_maxp }명&nbsp;</li>
								<li>&middot; 침실 ${dto.acc_bedroom }개&nbsp;</li>
								<li>&middot; 침대 ${dto.acc_bed }개&nbsp;</li>
								<li>&middot; 욕실 ${dto.acc_bath }개</li>
							</ul>
						</div>
						<a href="#host">
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
					<div>
						<h3>city에서 0000박</h3>
						<div>일~일</div>
						<div>달력</div>
						<button>날짜 지우기</button>
					</div>
				</div>
				<div class="col-4">
					<hr color="#FF1111">
					<br> <font
						style="font-family: serif; font-size: 30px; font-weight: bold;">
						₩<fmt:formatNumber value="${dto.acc_price  }" />
					</font>/박<br> ★${dto.acc_star} · 후기n개 <br> <br>
					<form method="post"
						action="<%=request.getContextPath()%>/payment.do?acc_code=${dto.getAcc_code() }">
						날짜 검색 <input class="btn btn-outline-danger"
							style="width: 100%; background-color: white; color: red;"
							min="${minDate }" type="text" id="day" name="day"><br>
						인원 <input class="btn btn-outline-danger"
							style="width: 100%; background-color: white; color: red;"
							type="number" id="guest" name="guest" value="1" min="1"
							max="${dto.acc_maxp }"> <br> <br>
						<button type="submit" class="btn btn-danger" style="width: 100%">예약하기</button>
						<hr color="#FF1111">
					</form>
				</div>
			</div>
		</div>
	</section>
	
	<c:set var="list" value="${review_list}"/>
	<c:set var="count" value="${count}"/>
	<c:set var="vi" value="${re_avg }"/>
	<section class="bottom">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<hr />
					<ul>
						<li>
							<c:if test="${dto.acc_star eq '0' }">
								<img src="<%=request.getContextPath() %>/resources/assets/blank-star.png" alt="" />
								<strong>new!</strong>
							</c:if>
							<c:if test="${dto.acc_star ne '0' }">
								<img src="<%=request.getContextPath() %>/resources/assets/star.png" alt="" />
								<strong>${dto.acc_star }</strong>
							</c:if>
						</li>
						
						
						
						<li>&middot; 후기 ${count }개</li>
						<ul  class="re_grade">
						<li><span>청결도</span> <div class="bar clean"></div>${vi.cl_avg }</li>
						<li><span>의사소통</span> <div class="bar comm"></div>${vi.comm_avg }</li>
						<li><span>체크인</span> <div class="bar check"></div>${vi.check_avg }</li>
						<li><span>정확성</span> <div class="bar acc"></div>${vi.acc_avg}</li>
						<li><span>위치</span> <div class="bar loc"></div>${vi.loc_avg }</li>
						<li><span>가격 대비 만족도</span> <div class="bar sat"></div>${vi.sat_avg }</li>
						</ul>
						
						<ul class="re_list">
							<c:forEach items="${list }" var="mo">
								<li class="memeber_img"><img src="<%=request.getContextPath()%>/resources/member/${mo.member_pic }" width="70"></li>
								<li class="re_list_name">${mo.member_id }</li>
								<li class="re_list_date">${mo.review_date.substring(0,10) }</li>
								<li class="re_list_cont">${mo.review_content }</li>
							</c:forEach>
						</ul>
						
						
					</ul>
					<hr />
					<div class="host-desc">
						<h3 id="host">호스트 소개란~~~~~~~</h3>
					</div>
					<hr />
				</div>
			</div>
			<div class="row">
				<div class="col-4">
					<h3>알아두어야 할 사항</h3>
				</div>
				<div class="col-4"></div>
				<div class="col-4"></div>
			</div>
		</div>
	</section>
</body>
</html>