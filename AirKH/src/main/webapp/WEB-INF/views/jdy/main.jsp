<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<script src="https://kit.fontawesome.com/e19f7e9074.js" crossorigin="anonymous"></script>
</head>
<body>
	
	<jsp:include page="./include/main_top.jsp"></jsp:include>
	<h1>사용자 기능</h1>
	<a href="<%=request.getContextPath()%>/jdy.do">숙소 리스트 메인페이지</a>
	<a href="#">숙소 검색</a>
	
	<h1>호스트 기능</h1>
	<a href="<%=request.getContextPath()%>/acc_insert.do?no=1">숙소 등록(사진등록!!!!)</a>
	<a href="<%=request.getContextPath()%>/host_acc_list.do?no=1">숙소 관리 조회, 등록, 삭제, 수정</a>
	
	<h1>관리자 기능</h1>
	<a href="">관리자 테마 관리</a>
	
	<div>
		<p>테마 navbar</p>
		
		<c:set var="tlist" value="${tList }" />
		
		<div align="center">
			<div>
				<c:if test="${!empty tlist }">
					<c:forEach items="${tlist }" var="tdto">
						<div class="theme-link">
							<a href="search_theme.do?no=${tdto.theme_code }">
								<img width="100px" src="<%=request.getContextPath() %>/resources/theme/${tdto.theme_icon }" alt="" />
								<strong>${tdto.theme_name }</strong>
							</a>
						</div>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty tlist }">
					<h3>테마 조회 불가!</h3>
				</c:if>
			</div>
		</div>
		
		<hr>
		
		<c:set var="list" value="${List }" />
		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="adto">
				<a href="<%=request.getContextPath()%>/acc_content.do?no=${adto.acc_code}">
					<span>
						<span>
							<img alt="" src="<%=request.getContextPath() %>/resources/hotel_images/${adto.acc_thumbnail }"
								width="100px">
						</span>
						
						<span>
							<span>
								${adto.acc_name }
							</span>
							<span>
								${adto.acc_country }, ${adto.acc_city }
							</span>
							<span>
								<span>&bsol;<fmt:formatNumber value="${adto.acc_price }" /> /박</span>
								<span>
									<c:if test="${adto.acc_star eq '0' }">
										<span>new!</span>
									</c:if>
									<c:if test="${adto.acc_star ne '0' }">
										<fmt:formatNumber value="${adto.acc_star }" pattern=".0"/>
										<i class="fa-solid fa-star"></i>
									</c:if>
								</span>
							</span>
						</span>
					</span>
				</a>
			
			</c:forEach>
		</c:if>
		
		<c:if test="${empty list }">
			<h3>숙소 정보 없음!</h3>
		</c:if>
		
		<hr>
		
		<h1>BOTTOM</h1>
		<p>~~~~ top버튼</p>
	</div>
	
	
	
</body>
</html>