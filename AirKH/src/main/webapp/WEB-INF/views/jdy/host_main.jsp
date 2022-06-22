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
	<section class="host-main">
		<div class="container">
			<div class="row">
				<div class="col-4">
					<div class="profile">
						<img class="profile-img" src="<%=request.getContextPath() %>/resources/assets/user.png" alt="" />
						<h3>안녕하세요. 저는 000입니다.</h3>
						<h3>소개</h3>
						<p>
							Lorem ipsum, dolor sit amet consectetur adipisicing elit. Odit
							quos minus, fuga eligendi molestias enim officia nam iste omnis!
							A reprehenderit eligendi consectetur aspernatur modi tempore
							asperiores quisquam cum impedit!
						</p>
						<a href="#">프로필 수정</a>
					</div>
				</div>
				<div class="col-8">
					<div class="host-acc">
						<div class="host-acc-title">
							<h2>000님의 숙소</h2>
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
						<c:forEach items="${ho_list }" var="ho">
							<li class="memeber_img"><img src="<%=request.getContextPath()%>/resources/member/${ho.member_pic }" width="70"></li>
								<li class="re_list_name">${ho.member_id }</li>
								<li class="re_list_date">${ho.review_date.substring(0,10) }</li>
								<li class="re_list_cont">${ho.review_content }</li>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>