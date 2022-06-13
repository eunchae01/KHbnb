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
	<c:set var="dto" value="${Cont }" />
	<c:set var="list" value="${oList }" />
	<c:set var="off" value="${offer }" />
	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h1>
						${dto.acc_name }
					</h1>
					<div class="head-review">
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
							<li>&middot; ${dto.acc_city }, ${dto.acc_country }</li>
						</ul>
					</div>
					<div class="head-like">
						<a href="#"><img src="<%=request.getContextPath() %>/resources/assets/blank-heart.png" alt="" />
						<strong>찜하기</strong></a>
					</div>
				</div>
			</div>
		</div>
	</header>
	<section class="cont-images">
		<div class="container">
			<div class="row">
				<div class="col-6">
					<img src="<%=request.getContextPath() %>/resources/hotel_images/${dto.acc_thumbnail }" alt="" class="thumbnail" />
				</div>
				<div class="col-3">
					<img src="<%=request.getContextPath() %>/resources/hotel_images/${dto.acc_image1 }" alt="" class="aoc-img" />
					<img src="<%=request.getContextPath() %>/resources/hotel_images/${dto.acc_image2 }" alt="" class="aoc-img" />
				</div>
				<div class="col-3">
					<img src="<%=request.getContextPath() %>/resources/hotel_images/${dto.acc_image3 }" alt="" class="aoc-img" />
					<img src="<%=request.getContextPath() %>/resources/hotel_images/${dto.acc_image4 }" alt="" class="aoc-img" />
				</div>
			</div>
		</div>
	</section>
	<section class="cont-desc">
		<div class="container">
			<div class="row">
				<div class="col-8">
					<div class="desc-head">
						<h2>000님이 호스팅하는 ${dto.acc_name }</h2>
						<ul>
							<li>최대 인원 ${dto.acc_maxp }명</li>
							<li>&middot; 침실 ${dto.acc_bedroom }개</li>
							<li>&middot; 침대 ${dto.acc_bed }개</li>
							<li>&middot; 욕실 ${dto.acc_bath }개</li>
						</ul>
						<a href="#">
							<img src="<%=request.getContextPath() %>/resources/assets/user.png" alt="" class="host-profile" />
						</a>
					</div>
					<hr />
					<h3><span>에어</span>커버</h3>
					<p>
						모든 예약에는 호스트가 예약을 취소하거나 숙소 정보가 정확하지 않은
						경우 또는 체크인에 문제가 있는 상황에 대비한 무료 보호 프로그램이
						포함됩니다.
					</p>
					<a href="#" class="fake-a">더 알아보기</a>
					<hr />
					<h3>숙소 설명</h3>
					<p>${dto.acc_detail }</p>
					<div class="desc-room">
						<h3>숙박 장소</h3>
						<div class="bedroom-box">
							<img src="" alt="" class="bedroom-img" />
							<div class="room-h">침실 ${dto.acc_bedroom }</div>
						</div>
						<div class="bed-box">
							<div class="room-h">침대${dto.acc_bed }</div>
						</div>
						<div class="bath-box">
							<div class="room-h">욕실${dto.acc_bath }</div>
						</div>
					</div>
					<hr />
					<h3>숙소 편의시설</h3>
					<div class="desc-offer">
						<c:forEach items="${off }" var="arr">
							<c:forEach items="${list }" var="odto">
								<c:if test="${arr eq odto.offer_code }">
									<img src="<%=request.getContextPath() %>/resources/offer/${odto.offer_icon}" alt="" class="offer-icon" >
									<div class="offer-name">${odto.offer_name }</div>
								</c:if>
							</c:forEach>
						</c:forEach>
					</div>
					
					<hr />
					<h3>${dto.acc_city }에서 0000박</h3>
					<div>일~일</div>
					<div>달력</div>
					<button>날짜 지우기</button>
					
				</div>
				<div class="col-4">
					<div>요금 계산서</div>
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