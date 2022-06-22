<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
</style>
</head>
<body>
		<div align="center" text-align="left">
				<c:set var="list" value="${review_list}"/>
				<c:set var="count" value="${count}"/>
				<c:set var="vi" value="${re_avg }"/>
					<p>★ 후기 ${count }개</p>
					 <ul class="review_grade">
						<li><span>청결도</span> <div class="bar clean"></div>${vi.cl_avg }</li>
						<li><span>의사소통</span> <div class="bar comm"></div>${vi.comm_avg }</li>
						<li><span>체크인</span> <div class="bar check"></div>${vi.check_avg }</li>
						<li><span>정확성</span> <div class="bar acc"></div>${vi.acc_avg}</li>
						<li><span>위치</span> <div class="bar loc"></div>${vi.loc_avg }</li>
						<li><span>가격 대비 만족도</span> <div class="bar sat"></div>${vi.sat_avg }</li>
					</ul>
					<ul class="review_list">
						<c:forEach items="${list}" var="list">
							<li class="re_list">
								<p class="member_name">${list.member_id }</p>
								<p class="review_date">${list.review_date.substring(0, 10) }</p>
								<p class="review_cont">${list.review_content }</p>
								<c:if test="${list.review_content.length() > 80}">
									<a href="#" class="hidden_btn">더 보기 ></a>
								</c:if>




							</li>
						</c:forEach>
						<c:if test="${count > 6}"> 
					<div class="all_review">후기 모두 보기</div>
				</c:if>
			</ul>
		</div>
</body>
</html>