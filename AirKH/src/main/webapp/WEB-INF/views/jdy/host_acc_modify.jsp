<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 숙소 수정</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/grid.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/host-cont.css" />
</head>
<body>
	
	<jsp:include page="./include/host_top.jsp" />
	
	<c:set var="dto" value="${Cont }" />
	<c:set var="list" value="${oList }" />
	<c:set var="off" value="${offer }" />
	
	<section class="host-cont">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="cont-table">
						<form action="<%=request.getContextPath() %>/acc_modify_ok.do" method="post"
							 enctype="multipart/form-data">
							<input type="hidden" name="acc_code" value="${dto.acc_code }" >
							<input type="hidden" name="acc_host" value="${dto.acc_host }" >
							<input type="hidden" name="acc_thumbnail" value="${dto.acc_thumbnail }" >
							<input type="hidden" name="acc_image1" value="${dto.acc_image1 }" >
							<input type="hidden" name="acc_image2" value="${dto.acc_image2 }" >
							<input type="hidden" name="acc_image3" value="${dto.acc_image3 }" >
							<input type="hidden" name="acc_image4" value="${dto.acc_image4 }" >
							<table>
								<tr>
									<th colspan="2"><h1>숙소 수정 페이지</h1></th>
								</tr>
								<tr>
									<th>숙소 이름</th>
									<td><input name="acc_name" id="name" value="${dto.acc_name }" /></td>
								</tr>
								
								<tr>
									<th>숙소 테마</th>
									<td>
										<c:set var="tlist" value="${tList }"/>
										<select name="acc_theme" required>
											<option value="${dto.acc_theme }" selected>테마 선택</option>
											<c:if test="${!empty tlist }">
												<c:forEach items="${tlist }" var="tdto">
													<option value="${tdto.theme_code }">${tdto.theme_name }</option>
												</c:forEach>
											</c:if>
										</select>
									</td>
								</tr>
								
								<tr>
									<th>숙소 설명</th>
									<td><textarea name="acc_detail" id="detail">${dto.acc_detail }</textarea></td>
								</tr>
								
								<tr>
									<th>숙소 연락처</th>
									<td><input name="acc_phone" id="phone" value="${dto.acc_phone }" /></td>
								</tr>
								
								<tr>
									<th>숙소 위치</th>
									<td>
										<div class="input-box">
											<label for="detail">국가/지역</label>
											<input name="acc_country" id="detail" value="${dto.acc_country }" />
											<label for="detail">시/도</label>
											<input name="acc_city" id="detail" value="${dto.acc_city }" />
											<br>
											<label for="detail">도로명 주소</label>
											<input name="acc_addr" id="detail" value="${dto.acc_addr }" />
											<label for="mail">우편번호</label>
											<input name="acc_mail" id="mail" value="${dto.acc_mail }" />
										</div>
									</td>
								</tr>
								
								<tr>
									<th>숙소 가격</th>
									<td>
										<input name="acc_price" id="price" value="${dto.acc_price }" />&nbsp;&bsol;
									</td>
								</tr>
								
								<tr>
									<th>건물 유형</th>
									<td><input name="acc_build" id="build" value="${dto.acc_build }" /></td>
								</tr>
								
								<tr>
									<th>숙소 유형</th>
									<td><input name="acc_type" id="type" value="${dto.acc_type }" /></td>
								</tr>
								
								<tr>
									<th>최대 숙박 인원</th>
									<td><input type="number" name="acc_maxp" id="maxp" value="${dto.acc_maxp }" min="1"/></td>
								</tr>
								
								<tr>
									<th>침실, 욕실</th>
									<td>
										<div class="input-box">
											<label for="bedroom">침실수: </label>
											<input
												type="number"
												id="bedroom"
												name="acc_bedroom"
												min="0"
												required
												value="${dto.acc_bedroom }"
											/>
											<label for="bed">침대수: </label>
											<input type="number" id="bed" name="acc_bed" min="0" required value="${dto.acc_bed }"/>
											<label for="bath">욕실수: </label>
											<input
												type="number"
												id="bath"
												name="acc_bath"
												min="0"
												required
												value="${dto.acc_bath }"
											/>
										</div>
									</td>
								</tr>
								
								<tr>
									<th>숙소 사진</th>
									<td>
										<img class="acc-image" src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_thumbnail }" alt="" />
										<img class="acc-image" src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_image1 }" alt="" />
										<img class="acc-image" src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_image2 }" alt="" />
										<img class="acc-image" src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_image3 }" alt="" />
										<img class="acc-image" src="<%=request.getContextPath() %>/resources/upload/${dto.acc_date.substring(0, 10) }/${dto.acc_image4 }" alt="" />
										<input type="file" name="file" id="acc_thumbnail" multiple/>
									</td>
								</tr>
							</table>
							<div class="btn-group">
								<input id="submit-btn" type="submit" value="수정">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
</body>
</html>