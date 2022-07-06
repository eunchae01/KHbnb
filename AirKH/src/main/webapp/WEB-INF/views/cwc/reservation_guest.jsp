<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/modal.css" />
<script type="text/javascript">
$(function(){
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
<style>
.accName{width:300px;}
.con1 {
	margin-top: 150px;
	margin-left: 5%;
	margin-right: 5%;
}

.con2 {
	margin-left: 3%;
	margin-right: 3%;
}

button {
	background-color: white;
}
</style>
</head>
<body>
	<c:set var="list" value="${List }" />
	<jsp:include page="../jdy/include/main_top.jsp"></jsp:include>

	<div class="con1">
		<h2>여행</h2>
		<hr>

		<div class="con2" align="center">
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<table width="80%" height="400px"
						style="border-top: 2px solid gray;">

						<tr>
							<td colspan="4" height="30%"
								style="vertical-align: bottom; padding-left: 50px;"><h2>${dto.getAcc_name() }</h2></td>
							<td width="30%" rowspan="5"><a
								href="<%=request.getContextPath()%>/acc_content.do?no=${dto.getAcc_code() }">
									<img
									src="<%=request.getContextPath() %>/resources/upload/2022-06-13/${dto.getAcc_thumbnail() }"
									alt="" class="thumbnail" width="100%" height="100%" />
							</a></td>
						</tr>

						<tr>
							<td style="vertical-align: top; padding-left: 70px;" colspan="3">${dto.getAcc_addr() }*
								게스트 ${dto.getCheck_person() }명</td>
						</tr>

						<tr>
							<td align="left"
								style="vertical-align: bottom; padding-left: 50px;">${dto.getCheck_in() }</td>
							<td align="left" style="vertical-align: bottom;">${dto.getCheck_out() }</td>
							<td></td>

						</tr>

						<tr>
							<td align="left" style="vertical-align: top; padding-left: 50px;">체크인
								시간: 15:00</td>
							<td align="left" style="vertical-align: top;">체크아웃 시간: 12:00</td>
							<td>예약자 성함 : ${dto.getMember_name() }</td>
						</tr>

						<tr>
							<td style="height: 20px; padding-left: 50px;"><button
									style="width: 100%; height: 100%;" type="button"
									class="btn btn-outline-success" data-bs-toggle="modal"
									data-bs-target="#exampleModal1">
									<c:choose>
										<c:when test="${dto.getReserve_info()=='0'}">예약 승인 대기 중</c:when>
										<c:when test="${dto.getReserve_info()=='1'}">예약 승인 완료</c:when>
									</c:choose>


								</button>
								<div class="modal fade" id="exampleModal1" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">예약 정보</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<c:choose>
													<c:when test="${dto.getReserve_info()=='0'}">호스트가 요청한 예약을 승인해야 예약이 완료됩니다.</c:when>
													<c:when test="${dto.getReserve_info()=='1'}">예약이 성공적으로 완료되었습니다.</c:when>
												</c:choose>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>

											</div>
										</div>
									</div>
								</div></td>
							<td><button style="width: 100%; height: 100%;" type="button"
									class="btn btn-outline-success" data-bs-toggle="modal"
									data-bs-target="#exampleModal2">변경 및 취소</button>

								<div class="modal fade" id="exampleModal2" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div style="width: 600px; height: 350px;"
											class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">변경 및 취소</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<br>
												<span>
													취소를 원하시면 클릭해주세요<br><br>
													<button class="btn btn-outline-success"
														style="font-size: 20px;"
														onclick="if(confirm('숙소 예약을 취소하시겠습니까?')) {
	               							location.href='cart_delete.do?cart_num=${dto.getCart_num() }'}else {  return; }">
														취소하기</button>
												</span>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>

											</div>
										</div>
									</div>
								</div></td>
							<td><button style="width: 100%; height: 100%;" type="button"
									class="btn btn-outline-success" data-bs-toggle="modal"
									data-bs-target="#exampleModal3">호스트 정보 보기</button> <!-- Modal -->
								<div class="modal fade" id="exampleModal3" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">호스트 정보</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<p>호스트 이름: ${dto.getHost_name() }</p>
												<p>호스트 연락처: ${dto.getHost_phone() }</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>

											</div>
										</div>
									</div>
								</div></td>
								<td>
					      			<input class="btn btn-outline-success"type="button" value="리뷰 등록하기" id="btn-modal">
					      			 <div id="modal" class="modal-overlay">
				        				<div class="modal-window">
				            				<div class="title">
				                				<h2>리뷰 등록하기</h2>
				            				</div>
				            				<div class="close-area">X</div>
				            <c:set var="mem" value="${mem }" />
				            <c:set var="mem_pic" value="${mem_pic }" />
				            <c:set var="host_num" value="${host_num }" />
				            
				            
								            <div class="modal_content">
								                <form method="post" action="<%=request.getContextPath() %>/review_insert_ok.do?hostno=${host_num}">
								                	<table border="0" cellspacing="0" width="1200px">
								                	<br/>
								                		<tr>
								                			<th>숙소 이름</th>
								                			<td><input class="accName"type="text" name="acc_name" value="${dto.acc_name }"></td>
								                			<td class="re_hidden"><input type="number" name="acc_code" value="${dto.acc_code }"></td>
								                			<td class="re_hidden"><input type="number" name="host_num" value="${host_num }"></td>
								                			<td class="re_hidden"><input type="text" name="member_pic" value="${mem_pic }"></td>
								                			<td class="re_hidden"><input type="text" name="member_id" value="${mem }"></td>
								                			
								                			 
								                		</tr>
								                		<tr>
								                			<th>청결한가요?</th>
								                			<td>
								                			<input type="radio" name="review_cl" value="1"> 1점
								                			<input type="radio" name="review_cl" value="2"> 2점
								                			<input type="radio" name="review_cl" value="3"> 3점
								                			<input type="radio" name="review_cl" value="4"> 4점
								                			<input type="radio" name="review_cl" value="5"> 5점
								                			</td>
								                		</tr>
								                		<tr>
								                			<th>의사소통은 잘 되었나요?</th>
								                			<td>
								                			<input type="radio" name="review_comm" value="1"> 1점
								                			<input type="radio" name="review_comm" value="2"> 2점
								                			<input type="radio" name="review_comm" value="3"> 3점
								                			<input type="radio" name="review_comm" value="4"> 4점
								                			<input type="radio" name="review_comm" value="5"> 5점
								                			</td>
								                		</tr>
								                		<tr>
								                			<th>체크인 / 아웃 시간은 잘 지켜졌나요?</th>
								                			<td>
								                			<input type="radio" name="review_check" value="1"> 1점
								                			<input type="radio" name="review_check" value="2"> 2점
								                			<input type="radio" name="review_check" value="3"> 3점
								                			<input type="radio" name="review_check" value="4"> 4점
								                			<input type="radio" name="review_check" value="5"> 5점
								                			</td>
								                		</tr>
								                		<tr>
								                			<th>주소는 정확한가요?</th>
								                			<td>
								                			<input type="radio" name="review_acc" value="1"> 1점
								                			<input type="radio" name="review_acc" value="2"> 2점
								                			<input type="radio" name="review_acc" value="3"> 3점
								                			<input type="radio" name="review_acc" value="4"> 4점
								                			<input type="radio" name="review_acc" value="5"> 5점
								                			</td>
								                		</tr>
								                		<tr>
								                			<th>교통편의성은 어떤가요?</th>
								                			<td>
								                			<input type="radio" name="review_loc" value="1"> 1점
								                			<input type="radio" name="review_loc" value="2"> 2점
								                			<input type="radio" name="review_loc" value="3"> 3점
								                			<input type="radio" name="review_loc" value="4"> 4점
								                			<input type="radio" name="review_loc" value="5"> 5점
								                			</td>
								                		</tr>
								                		<tr>
								                			<th>가격대비 만족도는 어떤가요?</th>
								                			<td>
								                			<input type="radio" name="review_sat" value="1"> 1점
								                			<input type="radio" name="review_sat" value="2"> 2점
								                			<input type="radio" name="review_sat" value="3"> 3점
								                			<input type="radio" name="review_sat" value="4"> 4점
								                			<input type="radio" name="review_sat" value="5"> 5점
								                			</td>
								                		</tr>
								                		<tr>
								                			<th>전체적인 평점은 어떤가요?</th>
								                			<td>
								                			<input type="radio" name="review_grade" value="1"> 1점
								                			<input type="radio" name="review_grade" value="2"> 2점
								                			<input type="radio" name="review_grade" value="3"> 3점
								                			<input type="radio" name="review_grade" value="4"> 4점
								                			<input type="radio" name="review_grade" value="5"> 5점
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
								</td>
						</tr>

					</table>
					<br>
					<hr>
					<br>
				</c:forEach>
			</c:if>


			<c:if test="${empty list }">
				<h2>아직 예약된 여행이 없습니다!</h2>
				<h3>여행 가방에 쌓인 먼지를 털어내고 다음 여행 계획을 세워보세요.</h3>
				<button
					onclick="location.href='<%=request.getContextPath()%>/acc_content.do'">숙소
					검색하기</button>
			</c:if>
			<hr>
		</div>
	</div>
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

