<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 상세</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/grid.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cont.css" />
</head>
<body>

	<jsp:include page="./include/main_top.jsp" />
	<c:set var="dto" value="${Cont }" />
	<c:set var="list" value="${oList }" />
	<c:set var="off" value="${offer }" />
	
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
							<img class="icons" src="<%=request.getContextPath() %>/resources/assets/blank-heart.png" alt="" />
							<a href="#"><strong>&nbsp;찜하기</strong></a>
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
							<h2>000님이 호스팅하는 ${dto.acc_name }</h2>
							<ul>
								<li>최대 인원 ${dto.acc_maxp }명&nbsp;</li>
								<li>&middot; 침실 ${dto.acc_bedroom }개&nbsp;</li>
								<li>&middot; 침대 ${dto.acc_bed }개&nbsp;</li>
								<li>&middot; 욕실 ${dto.acc_bath }개</li>
							</ul>
						</div>
						<a href="#">
							<img src="<%=request.getContextPath() %>/resources/assets/user.png" alt="" class="host-profile" />
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
					<div class="bill">요금 계산서</div>
				</div>
			</div>
		</div>
	</section>
	
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
						<li>&middot; 후기 000개</li>
					</ul>
					<hr />
					<div class="host-desc">
						<h3>호스트 소개란~~~~~~~</h3>
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