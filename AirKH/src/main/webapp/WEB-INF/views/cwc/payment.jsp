<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<script type="text/javascript">
	$(".btn-modal").click(function() {
		var data = $(this).data('id');
		$("#contents.body-contents").val(data);
		$("#text-contents.body-contents").html(data);
	});
</script>

<style>
body {
	width: 100%;
	height: 100%;
}

.con1 {
	height: 20%;
	margin-bottom: 50px;
}

.con2 {
	margin-left: 300px;
	margin-right: 300px;
	margin-top: 150px;
}

#con3 {
	margin-top: 100px;
	padding: 20px;
}

.right {
	float: right;
	width: 40%;
}

.left {
	float: left;
	width: 55%
}

li {
	list-style-type: none;
}

input {
	height: 35px;
}

.bill-container {
	position: sticky;
	top: 150px;
	width: 500px;
	height: 500px;
	border: 1px solid lightgray;
	border-radius: 10px;
	padding: 24px;
	margin-bottom: 80px;
}
</style>

<script src="//code.jquery.com/jquery.min.js"></script>


<script type="text/javascript">
function check() {
	let check;
	if(document.getElementById("coupon").value==12345){
		check=1;
		console.log("check");
		let coup=${cprice};
		let pri=$("#totalp").val();
		let element = document.getElementById('ck_day');
		let total=(pri*element.innerHTML);
		let comm=total*0.1;
		let totalm=(total+comm)*0.3;		
		$("#cout").text("-₩"+(totalm.toLocaleString(undefined, { maximumFractionDigits: 0 }))+"원");
		$("#cout").css("color","red");
		let finalmoney=total+comm-totalm;
		$("#totalm2").text((finalmoney.toLocaleString(undefined, { maximumFractionDigits: 0 }))+"원")
	}else{
		check=0;
		alert("번호가 틀립니다..");
		console.log("check");
	}
}

function change_person() {
	$("#guest").attr("readonly", false);
	$("#guest").css("color","blue");
}

function change_day() {
	$("#day").attr("disabled", false);
	$("#day").trigger('click');
}

function count(type)  {
	  const resultElement = document.getElementById('result');
	  
	  let number = resultElement.innerText;
	  if(type === 'plus') {
		  if(number< ${maxp }){
	    number = parseInt(number) + 1;
		  }
	  }else if(type === 'minus')  {
		  if(number>1){
			  number = parseInt(number) - 1;  
		  }
	  }
	  resultElement.innerText = number;
	}

function check_per() {
	alert("변경완료");
	$("#check_person").val((document.getElementById('result').innerText));
	
}
	
</script>


<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


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
    	let ck_in=start.format('YYYY-MM-DD');
    	let ck_out=end.format('YYYY-MM-DD');
    	
    	let date1=new Date(ck_in);
    	let date2=new Date(ck_out);
    	let difDate= date1.getTime() - date2.getTime();
    	let total=Math.abs(difDate / (1000 * 60 * 60 * 24));
    	$("#ck_in").text( ck_in);
    	$("#ck_out").text(ck_out);
    	$("#ck_day").text(total);
    	$("#ck_day2").text(total);
    	
    	let pri=$("#totalp").val();
    	let total_price=pri*total;
    	let service=total_price*0.1;
    	let tomoney=service+total_price;
    	$("#totalp2").text((total_price.toLocaleString(undefined, { maximumFractionDigits: 0 }))+"원")
    	$("#totals2").text((service.toLocaleString(undefined, { maximumFractionDigits: 0 }))+"원")
    	$("#totalm2").text((tomoney.toLocaleString(undefined, { maximumFractionDigits: 0 }))+"원")
    });
});

</script>

</head>
<body>
	<jsp:include page="../jdy/include/main_top.jsp"></jsp:include>

	<div class="con2">
		<c:set var="dto" value="${pCont }" />
		<c:set var="member" value="${member }" />
		<c:set var="host" value="${host }" />
		<input id="totalp" type="hidden" value="${dto.acc_price  }" />
		<form method="post" action="<%=request.getContextPath()%>/add_pay.do">
			<div class="left">
				<div>
					<a href="javascript:window.history.back();">〈
						&nbsp;&nbsp;&nbsp;&nbsp;</a> <span
						style="font-size: 35px; font-weight: 700">예약 요청</span>
				</div>

				<br> <br>

				<div>
					<span style="font-size: 25px; font-weight: 700">예약 정보</span> <br>
					<br>

					<div>
						<div class="left">
							<strong> 날짜 </strong><br> <input
								style="font-size: 20px; width: 100%; background-color: white;"
								min="${minDate }" type="text" value="${day }"
								disabled="disabled" id="day" name="day">
						</div>

						<div class="right">

							<div align="right">
								<br> <a style="text-decoration: underline;"
									href="javascript:void(0);" onclick="change_day();">수정</a>
							</div>


						</div>
					</div>

					<br> <br> <br>

					<div>

						<div class="left">
							<strong> 게스트 </strong><br> <input
								style="width: 15px; font-size: 20px;" type="text"
								readonly="readonly" value="${guest }" id="check_person"
								name="check_person">명
						</div>


						<div class="right">
							<div align="right">
								<br> <br> <a style="text-decoration: underline;"
									href="#" data-bs-toggle="modal" data-bs-target="#exampleModal3">수정</a><br>
							</div>


							<div class="modal fade" id="exampleModal3" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<p align="center" style="font-size: 30px; font-weight: bold;">게스트</p>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<p style="font-size: 15px">이 숙소의 최대 숙박 인원은 2명(유아 포함)입니다.
												반려동물 동반은 허용되지 않습니다.</p>
											<p style="vertical-align: bottom; font-size: 15px;">(해당숙소의
												최대 인원은 ${maxp }입니다!)</p>

											<div style="float: left">
												<label>게스트</label>
											</div>
											<div style="float: right;">
												<input
													style="background-color: white; border-radius: 30%; border: 1px solid gray; font-size: 22px;"
													type='button' onclick='count("plus")' value='+' /><font
													style="font-size: 22px">&nbsp;&nbsp;<span
													id='result'>${guest }</span></font>&nbsp;&nbsp;<input
													style="background-color: white; border-radius: 30%; border: 1px solid gray; font-size: 22px;"
													type='button' onclick='count("minus")' value='-' />
											</div>
										</div>
										<div class="modal-footer">
											<button name="cou" type="button" class="btn btn-primary"
												data-bs-dismiss="modal" onclick="check_per()">변경</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>

				<br> <br> <br> <br>
				<hr>
				<br>

				<div>
					<div>
						<span style="font-size: 25px; font-weight: 700">결재 수단</span> <br>
						<br>
					</div>



					<select class="form-select form-select-md"
						aria-label=".form-select-sm example">
						<option selected>신용카드 또는 체크카드</option>
					</select> <br>
					<table width="100%">
						<tr>
							<td colspan="2">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1">카드번호</span>
									</div>
									<input type="text" class="form-control"
										placeholder="0000-0000-0000-0000" aria-label="Username"
										aria-describedby="basic-addon1" name="card_num">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1">만료일</span>
									</div>
									<input type="text" class="form-control" placeholder="MM / YY"
										aria-label="Username" aria-describedby="basic-addon1"
										name="exprie">
								</div>
							</td>
							<td>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1">CVV</span>
									</div>
									<input type="text" class="form-control" placeholder="123"
										aria-label="Username" aria-describedby="basic-addon1"
										name="cvv">
								</div>
							</td>
						</tr>
					</table>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">우편번호</span>
						</div>
						<input type="text" class="form-control" placeholder="08291"
							aria-label="Username" aria-describedby="basic-addon1"
							name="zip_code">
					</div>
					<select class="form-select form-select-md"
						aria-label=".form-select-sm example" name="country">
						<option value="">국가/지역</option>
						<option value="1">대한민국</option>
						<option value="2">일본</option>
						<option value="3">미국</option>
						<option value="4">영국</option>
						<option value="5">프랑스</option>
						<option value="6">독일</option>
						<option value="7">etc</option>
					</select>

				</div>
				<div style="margin-top: 50px; margin-bottom: 50px;">
					<a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"
						style="text-decoration: underline;"><font
						style="font-size: 20px; font-weight: 700">쿠폰 입력하기</font></a>

					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">쿠폰 적용 시 30%</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<input style="width: 100%" type="text"
										placeholder="쿠폰 번호 5자리를 입력해 주세여(12345=> 30% dc적용)" id="coupon">
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">취소</button>
									<button name="cou" type="button" class="btn btn-primary"
										data-bs-dismiss="modal" onclick="check()">등록</button>
								</div>
							</div>
						</div>
					</div>

				</div>
				<hr>
				<div style="margin-top: 50px; margin-bottom: 50px;">
					<span style="font-size: 25px; font-weight: 700">환불정책</span> <br>
					<div>
						6월 8일 오후 3:00 전에 예약을 취소하면 첫 1박 요금 및 서비스 수수료를 제외한 요금의 50%가 환불됩니다.
						<button type="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop">자세히 알아보기</button>

						<div class="modal fade" id="staticBackdrop"
							data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="staticBackdropLabel">환불 정책</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<br>
										<p>취소:</p>
										<span>예약 전일(~15:00)<br> 전액 환불: 결제하신 금액이 100%
											환불됩니다.
										</span>
										<hr>
										<span>예약 당일(15:00~)<br> 부분 환불: 첫 1박을 제외한 나머지 숙박일에
											대한 요금을 환불받으실 수 있습니다. 첫 1박 요금과 서비스 수수료는 환불되지 않습니다.

										</span>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>


					</div>

					<hr>
				</div>
				<div style="margin-top: 50px; margin-bottom: 50px;">
					<span><strong>호스트가 24시간 이내 예약 요청을 수락하기 전까지는 예약이 아직
							확정된 것이 아닙니다.</strong> 예약 확정 전까지는 요금이 청구되지 않습니다.</span>

				</div>
				<hr>
				<div>
					<button type="submit" class="btn btn-danger">예약 요청</button>
				</div>
				<br> <br> <br>

			</div>



			<div class="right" id="con3">
				<div class="bill-container">
					<table>
						<tr>
							<td rowspan="2"><img
								src="<%=request.getContextPath() %>/resources/upload/2022-06-13/${dto.getAcc_thumbnail() }"
								alt="" class="thumbnail" width="150px" height="150px" /></td>
							<td><font style="font-size: 15px">${dto.getAcc_name() }</font>
							</td>
						</tr>


						<tr>
							<td><font style="font-size: 15px">★${dto.getAcc_star() }</font>
							</td>
						</tr>
					</table>
					<hr>

					<div>

						<table width="100%" style="border-bottom: 1px solid gray">

							<tr>
								<td colspan="2"><font
									style="font-size: 30px; font-weight: bold;">요금 세부 정보</font><br></td>
							</tr>

							<tr>
								<td style="vertical-align: bottom;"><br> <input style="width:110px; font-size: 20px" type="text"
									readonly="readonly"
									value="₩<fmt:formatNumber
									value="${dto.getAcc_price() }" />">x <span id="ck_day">${date}</span> 박
								</td>
								<td style="vertical-align: bottom;" align="right">₩<span id="totalp2"><fmt:formatNumber value="${price }" />원</span>
								</td>
							</tr>
							<tr>
								<td style="vertical-align: bottom;"><label>서비스 수수료</label></td>
								<td style="vertical-align: bottom;" align="right">₩<span id="totals2"><fmt:formatNumber value="${commission }" />원</span></td>
							</tr>
							<tr>
								<td style="vertical-align: bottom;"><label>특별가 제안<font style="font-size: 10px;">(쿠폰)</font></label></td>
								<td style="vertical-align: bottom;" align="right"><span id="cout">쿠폰 적용 전</span></td>
							</tr>

						</table>
						<div>
							<table width="100%">
								<tr>
									<td style="vertical-align: bottom;"><br> <strong>총 합계(KRW)</strong></td>
									<td style="vertical-align: bottom;" align="right">₩<span id="totalm2"><fmt:formatNumber
												value="${total_price }" />원</span>
									</td>
								</tr>
							</table>

						</div>
					</div>
				</div>
			</div>
			<input type="hidden" name="acc_code" value="${dto.getAcc_code() }">
			<input type="hidden" name="acc_name" value="${dto.getAcc_name() }">
			<input type="hidden" name="acc_price" value="${price }"> <input
				type="hidden" name="acc_thumbnail" value="${dto.getAcc_thumbnail()}">
			<input type="hidden" name="acc_addr" value="${dto.getAcc_addr() }">
			<input type="hidden" name="check_in" value="${check_in}"> <input
				type="hidden" name="check_out" value="${check_out}"> <input
				type="hidden" name="member_name" value="${member.getMember_name() }">
			<input type="hidden" name="member_phone"
				value="${member.getMember_phone() }"> <input type="hidden"
				name="host_name" value="${host.getHost_name() }"> <input
				type="hidden" name="host_phone" value="${host.getHost_phone() }">
			<input type="hidden" name="reserve_info" value="0">


		</form>
	</div>
</body>
</html>
