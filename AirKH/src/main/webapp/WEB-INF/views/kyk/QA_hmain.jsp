<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/grid.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cont.css" />
<script type="text/javascript">
$(function(){
	 //글자 수 제한
    $('#QA_text').on('keyup', function() {
        $('#QA_text_cnt').html("("+$(this).val().length+" / 1000)");
 
        if($(this).val().length > 1000) {
            $(this).val($(this).val().substring(0, 1000));
            $('QA_text_cnt').html("(1000 / 1000)");
        }
    });
});
</script>
<style type="text/css">
 #QA_header{
 	position:absolute;
 	top:150px; width:1200px;
 	left:calc(50% - 600px);
 	text-align: center;
 } 
 .QA_q{ font-size : 45px;}
 #QA_box{
 	position:absolute;
 	top:100px;  
 	text-align: left;
 }
 .qa_cont{font-size:14px;}
 #QA_text, #QA_title , .QA_btn{border:1px solid #000;}
 #QA_title{width:450px;}
 
 </style>
</head>
<body>

	<jsp:include page="../jdy/include/main_top.jsp" />
	<c:set var="id" value="${qa_id}" />
		<div id="QA_header">
		<p class="QA_q">무엇이든 물어보세요</p>
		<br/>
			<div id="QA_box">
			<form method="post" action="<%=request.getContextPath()%>/QA_h_insertOk.do">
				
					<select name="qa_type">
						<option value="" selected>문의 글 종류</option>
						<option value="0">여행</option>
						<option value="1">예약</option>
						<option value="2">환불</option>
						<option value="3">결제</option>
						<option value="4">기타</option>
					</select>
					<span class="qa_title">글 제목 : </span>
					<input id="QA_title" type="text" name="qa_title">
					<input class="qa_hidden"id="QA_memid" type="text" name="qa_id" value="${id }">
					<br/>
					<p class="qa_cont">문의 내용 : </p>
					<textarea id="QA_text" name="qa_cont" rows="5" cols="160"></textarea>
					<div id="QA_text_cnt">(0 / 1000)</div>
					<input class="QA_btn" type="submit" value="작성완료">
					<input class="QA_btn" type="reset" value="취소">
				
			</form>
			</div>
			</div>
</body>
</html>