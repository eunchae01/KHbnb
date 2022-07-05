<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 메인</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/grid.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/host_main.css" />

</head>
<body>
	<jsp:include page="./include/host_top.jsp" />
	<c:set var="list" value="${List }" />
	<c:set var="ho_list" value="${host_list }" />

	<c:set var="host" value="${Host }" />
	<c:set var="count" value="${count }" />

	<section class="host-main">
		<div class="container">
			<div class="row">
				<div class="col-4">
					<div class="profile">

						<img class="profile-img" src="<%=request.getContextPath() %>/resources/host/${host.host_pic}" alt="" />
						<h3>안녕하세요. 저는 ${host.host_name }입니다.</h3>



						<h3>소개</h3>
						<p>
							${host.host_int }
						</p>
						<br>
						<a href="<%=request.getContextPath()%>/info-update.do">프로필 수정</a>
						<br><br>
						<a href="<%=request.getContextPath()%>/delete-user.do">회원탈퇴</a>
					</div>
				</div>
				<div class="col-8">
					<div class="host-acc">
						<h2>${host.host_name }님의 숙소 관리</h2>
						<div class="host-acc-title">

							<a href="<%=request.getContextPath()%>/reservation_host.do">예약 관리</a>
							<a href="<%=request.getContextPath()%>/acc_insert.do?no=${host_num}">새로운 숙소 등록하기</a>
						</div>
						<c:if test="${!empty list }">
							<div class="host-acc-list">
								<c:forEach items="${list }" var="adto">
								
									<a href="<%=request.getContextPath()%>/host_acc_cont.do?no=${adto.acc_code}">
										<div class="acc-box">
											<div class="acc-img-frame">
												<img src="<%=request.getContextPath() %>/resources/upload/${adto.acc_date.substring(0, 10) }/${adto.acc_thumbnail }" alt="" />
											</div>
											<div class="rate">
												<c:if test="${adto.acc_star eq '0' }">
													<div>NEW</div>
												</c:if>
												<c:if test="${adto.acc_star ne '0' }">
													<img src="<%=request.getContextPath() %>/resources/assets/star.png" alt="" />
													<div><fmt:formatNumber value="${adto.acc_star }" pattern=".0"/></div>
												</c:if>
											</div>
											<div>${adto.acc_type } &middot; ${adto.acc_build }</div>
											<div>${adto.acc_name }</div>
										</div>
									</a>	
								</c:forEach>
							</div>
						</c:if>
						<c:if test="${empty list }">
							<h3>숙소 정보 없음!</h3>
						</c:if>
					</div>
					
					<div class="host-review">
						<h2>
							<img class="star-icon" src="<%=request.getContextPath() %>/resources/assets/star.png" alt="" />
							&nbsp;후기 ${count }개
						</h2>
						<c:forEach items="${ho_list }" var="ho">
							<a href="<%=request.getContextPath()%>/acc_content.do?no=${ho.acc_code}&hostno=${host_num}">
								<div class="review-list">
			                           <div class="acc-name">${ho.acc_name }</div>
			                           <div class="rlist-cont">${ho.review_content }</div>
			                           <div class="rlist-top">
			                              <img src="<%=request.getContextPath()%>/resources/member/${ho.member_pic }" alt="" />
			                              <div class="rlist-title">
			                                 <div class="rlist-name">${ho.member_id }</div>
			                                 <div class="rlist-date">
			                                    ${ho.review_date.substring(0,4) }년 ${ho.review_date.substring(5,7) }월 
			                                 </div>            
			                              </div>
		                           </div>
		                        </div>
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<jsp:include page="./include/footer.jsp"/>

</body>
</html>