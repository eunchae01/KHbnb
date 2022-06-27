<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움말</title>
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
 	top:200px; width:1200px;
 	left:calc(50% - 600px);
 	text-align: center;
 } 
 #QA_header p{ font-size : 45px;}
 #QA_box{
 	position:absolute;
 	top:100px;  
 	text-align: left;
 }

#QA_title{border: 1px solid #000; margin:15px 3px;}
 #QA_text, #QA_memid{border: 1px solid #000;}
 
.QA-btn{border : 1px solid #000;}
#QA_text_cnt{magin:10px auto;}


</style>
</head>
<body>
	<jsp:include page="../jdy/include/main_top.jsp" />
	
	<div id="QA_header">
		<p>무엇이든 물어보세요</p>
		<br/>
		<div id="QA_box">
		<form method="post" action="<%=request.getContextPath()%>/QA_insert.do">
		
			<select name="QA_type">
				<option value="" selected>문의 글 종류</option>
				<option value="여행">여행</option>
				<option value="예약">예약</option>
				<option value="환불">환불</option>
				<option value="결제">결제</option>
				<option value="기타">기타</option>
			</select>
			<span>글 제목 : </span>
			<input id="QA_title" type="text" name="QA_title">
			<span> 작성자 : </span>
			<input id="QA_memid" type="text" name="QA_id">
			<textarea id="QA_text" name="QA_cont" rows="5" cols="160"></textarea>
			<div id="QA_text_cnt">(0 / 1000)</div>
			<input class="QA-btn" type="submit" value="작성완료">
			<input class="QA-btn" type="reset" value="취소">
		
	</form>
	</div>
	</div>
	
	
</body>
</html>