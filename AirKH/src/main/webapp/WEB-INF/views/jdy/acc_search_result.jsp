<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/grid.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main_style.css" />
</head>
<body>
	
	<jsp:include page="./include/main_top.jsp" />
	
	<c:set var="tlist" value="${tList }" />
	
	<section class="t-nav-bar">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<ul class="theme-bar">
						<c:if test="${!empty tlist }">
							<c:forEach items="${tlist }" var="tdto">
								<a href="search_theme.do?no=${tdto.theme_code }" class="theme-hover">
									<li>
										<img src="<%=request.getContextPath() %>/resources/theme/${tdto.theme_icon }" alt=""
										 class="theme-icon" />
										<strong class="theme-name">${tdto.theme_name }</strong>
									</li>
								</a>
							</c:forEach>
						</c:if>
					
						<c:if test="${empty tlist }">
							<h3>테마 조회 불가!</h3>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</section>
	
	<section class="acc-preview">
		<div class="container">
			<div class="row">
				
				<c:set var="list" value="${List }" />
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="adto">
						<div class="col-3">
							<a href="<%=request.getContextPath()%>/acc_content.do?no=${adto.acc_code}" class="link-to-acc">
								<img class="acc-image" src="<%=request.getContextPath() %>/resources/upload/${adto.acc_date.substring(0, 10) }/${adto.acc_thumbnail }" alt="" />
								<div class="acc-list">
									<div class="acc-info">
										<div class="acc-title">${adto.acc_name }</div>
										<div class="rate-box">
											<c:if test="${adto.acc_star eq '0' }">
												<div class="rate">
													NEW
												</div>
											</c:if>
											<c:if test="${adto.acc_star ne '0' }">
												<div class="rate">
													<fmt:formatNumber value="${adto.acc_star }" pattern=".0"/>
												</div>
												<img class="star-icon" src="<%=request.getContextPath() %>/resources/assets/star.png" alt="" />
											</c:if>
										</div>
									</div>
									<div class="acc-loc">${adto.acc_city }, ${adto.acc_country }</div>
									<div class="acc-price"><strong>&bsol;<fmt:formatNumber value="${adto.acc_price }" /></strong>/박</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty list }">
					<h3>숙소 정보 없음!</h3>
				</c:if>
			</div>
		</div>
	</section>

</body>
</html>