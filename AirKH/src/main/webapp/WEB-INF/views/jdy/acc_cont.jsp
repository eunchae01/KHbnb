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
    
    // 글자 수 제한
    $('#re_textCont').on('keyup', function() {
        $('#re_text_cnt').html("("+$(this).val().length+" / 200)");
 
        if($(this).val().length > 200) {
            $(this).val($(this).val().substring(0, 200));
            $('re_text_cnt').html("(200 / 200)");
        }
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
									<strong>&nbsp;<fmt:formatNumber value="${dto.acc_star }" pattern=".0"/>&nbsp;&middot;&nbsp;</strong>
								</c:if>
							</li>
							<li><a href="#">후기 ${count }개</a>&nbsp;&middot;&nbsp;</li>
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
					<div>
						<h3>city에서 0000박</h3>
						<div>일~일</div>
						<div>달력</div>
						<button>날짜 지우기</button>
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
						</form>
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
			<c:forEach items="${list }" var="mo">
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
<<<<<<< HEAD
					<div id="host-top">
						<img src="<%=request.getContextPath() %>/resources/host/${host.host_pic}" alt="" class="host-profile" />
						<div class="host-title">
							<h4>호스트: ${host.host_name }</h4>
							<p>회원 가입일: ${host.host_date.substring(0, 4) }년 ${host.host_date.substring(5, 7) }월&nbsp;&middot;&nbsp;사업자 정보</p>
						</div>
=======
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
							<c:forEach items="${re_list }" var="mo">
								<li class="memeber_img"><img src="<%=request.getContextPath()%>/resources/member/${mo.member_pic }" width="70"></li>
								<li class="re_list_name">${mo.member_id }</li>
								<li class="re_list_date">${mo.review_date.substring(0,10) }</li>
								<li class="re_list_cont">${mo.review_content }</li>
							</c:forEach>
						</ul>
					</ul>
					 <div id="modal_container">
        <input type="button" value="리뷰 등록하기" id="btn-modal">
        
    </div>
    
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2>리뷰 등록하기</h2>
            </div>
            <div class="close-area">X</div>
            <c:set var="mem" value="${member_id }" />
            <c:set var="mem_pic" value="${member_pic }" />
            <div class="modal_content">
                <form method="post" action="<%=request.getContextPath() %>/review_insert_ok.do">
                	<table border="0" cellspacing="0" width="1200px">
                	<br/>
                		<tr>
                			<th>숙소 이름</th>
                			<td><input type="text" name="acc_name" value="${dto.acc_name }"></td>
                			<td class="re_hidden"><input type="number" name="acc_code" value="${dto.acc_code }"></td>
                			<td class="re_hidden"><input type="text" name="member_id" value="${mem }"></td>
                			<td class="re_hidden"><input type="text" name="member_pic" value="${mem_pic }"></td>
                			 
                		</tr>
                		<tr>
                			<th>청결한가요?</th>
                			<td>
                			<input type="checkbox" name="review_cl" value="1"> 1점
                			<input type="checkbox" name="review_cl" value="2"> 2점
                			<input type="checkbox" name="review_cl" value="3"> 3점
                			<input type="checkbox" name="review_cl" value="4"> 4점
                			<input type="checkbox" name="review_cl" value="5"> 5점
                			</td>
                		</tr>
                		<tr>
                			<th>의사소통은 잘 되었나요?</th>
                			<td>
                			<input type="checkbox" name="review_comm" value="1"> 1점
                			<input type="checkbox" name="review_comm" value="2"> 2점
                			<input type="checkbox" name="review_comm" value="3"> 3점
                			<input type="checkbox" name="review_comm" value="4"> 4점
                			<input type="checkbox" name="review_comm" value="5"> 5점
                			</td>
                		</tr>
                		<tr>
                			<th>체크인 / 아웃 시간은 잘 지켜졌나요?</th>
                			<td>
                			<input type="checkbox" name="review_check" value="1"> 1점
                			<input type="checkbox" name="review_check" value="2"> 2점
                			<input type="checkbox" name="review_check" value="3"> 3점
                			<input type="checkbox" name="review_check" value="4"> 4점
                			<input type="checkbox" name="review_check" value="5"> 5점
                			</td>
                		</tr>
                		<tr>
                			<th>주소는 정확한가요?</th>
                			<td>
                			<input type="checkbox" name="review_acc" value="1"> 1점
                			<input type="checkbox" name="review_acc" value="2"> 2점
                			<input type="checkbox" name="review_acc" value="3"> 3점
                			<input type="checkbox" name="review_acc" value="4"> 4점
                			<input type="checkbox" name="review_acc" value="5"> 5점
                			</td>
                		</tr>
                		<tr>
                			<th>교통편의성은 어떤가요?</th>
                			<td>
                			<input type="checkbox" name="review_loc" value="1"> 1점
                			<input type="checkbox" name="review_loc" value="2"> 2점
                			<input type="checkbox" name="review_loc" value="3"> 3점
                			<input type="checkbox" name="review_loc" value="4"> 4점
                			<input type="checkbox" name="review_loc" value="5"> 5점
                			</td>
                		</tr>
                		<tr>
                			<th>가격대비 만족도는 어떤가요?</th>
                			<td>
                			<input type="checkbox" name="review_sat" value="1"> 1점
                			<input type="checkbox" name="review_sat" value="2"> 2점
                			<input type="checkbox" name="review_sat" value="3"> 3점
                			<input type="checkbox" name="review_sat" value="4"> 4점
                			<input type="checkbox" name="review_sat" value="5"> 5점
                			</td>
                		</tr>
                		<tr>
                			<th>전체적인 평점은 어떤가요?</th>
                			<td>
                			<input type="checkbox" name="review_grade" value="1"> 1점
                			<input type="checkbox" name="review_grade" value="2"> 2점
                			<input type="checkbox" name="review_grade" value="3"> 3점
                			<input type="checkbox" name="review_grade" value="4"> 4점
                			<input type="checkbox" name="review_grade" value="5"> 5점
                			</td>
                		</tr>
                		<br/>
                		<tr>
                			<th>리뷰를 작성해주세요!</th>
                			<td>
                				<textarea id="re_textCont" name="review_content" cols="100" rows="3"></textarea>
                				<div id="re_text_cnt">(0 / 200)</div>
                			</td>
                		</tr>
                		
                		
                		
                	</table>
                	<input class="submit_btn" type="submit" value="리뷰등록">
                </form>
                
            </div>
        </div>
    </div>
					<hr />
					<div class="host-desc">
						<h3>호스트 소개란~~~~~~~</h3>
>>>>>>> 06fdee6 (커밋)
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
<<<<<<< HEAD
				<div class="col-4 know-col">
					<h2>알아두어야 할 사항</h2>
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
				<div class="col-4">
				</div>
				<div class="col-4">
=======
				<div class="col-4">
					<h3>알아두어야 할 사항</h3> 
>>>>>>> 06fdee6 (커밋)
				</div>
			</div>
		</div>
	</section>
	 <script>
  			// 모달 기본 틀
        	const modal = document.getElementById("modal")
            

            function modalOn() {
			    modal.style.display = "flex"
			}
			function isModalOn() {
			    return modal.style.display === "flex"
			}
			function modalOff() {
			    modal.style.display = "none"
			}
            
            // 모달 보이게하기
			const btnModal = document.getElementById("btn-modal")
				btnModal.addEventListener("click", e => {
				    modal.style.display = "flex"
				})
			
			// x 버튼 클릭 시 닫기 
			const closeBtn = modal.querySelector(".close-area")
				closeBtn.addEventListener("click", e => {
				    modal.style.display = "none"
			})
			
			// 모달 바깥부분 클릭 시 닫기
			modal.addEventListener("click", e => {
			    const evTarget = e.target
			    if(evTarget.classList.contains("modal-overlay")) {
			        modal.style.display = "none"
			    }
			})
	
			// ESC 버튼 누르면 닫기
			window.addEventListener("keyup", e => {
			    if(modal.style.display === "flex" && e.key === "Escape") {
			        modal.style.display = "none"
			    }
			})
    </script>
</body>
</html>