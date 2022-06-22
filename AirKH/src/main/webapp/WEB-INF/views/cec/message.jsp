<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		 $(".container2").click(function(){
		      alert("div id 클릭");
		  });
	});
	
	
	function forMessage(){
	    if($("#line1").css('opacity') != '1'){
	    	$('#line1').css('opacity') == '1';
	    	$("#line2").css('opacity') == 'inherit';
	    	
	    	alert("hi");
		}
	}
	
	function forHost(){
	    if($("#line2").css('opacity') != '1'){
	    	$('#line2').css('opacity') == '1';
	    	$("#line1").css('opacity') == 'inherit';
	    	
	    	console.log("hi");
	    }
	}
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
	.container1{
		display: grid;
		margin: 0 auto;
		grid-template-columns: 1fr 3fr;
	}
	
	.chatt{
		height: 80vh;
	}
	
	.container2{
		padding-top: 110px;
		padding-bottom: 20px;
		border-style: solid;
		border-width: 1px;
		border-color: black;
	}

	.container2 h5{
		text-align: left;
		padding-left: 15px;
		font-weight: bold;
		margin-bottom: 25px;
	}

	#line1{
		color: black;
		opacity: 1;
	}

	.container3{
		padding-top: 110px;
		padding-bottom: 20px;
		border-style: solid;
		border-width: 1px;
	
	}
	
	.container3 h5{
		text-align: left;
		padding-left: 15px;
		margin-bottom: 25px;
		font-weight: bold;
	}
	
	#line2{
		color: black;
		opacity: 1;
	}
	
</style>
</head>
<body>
	<jsp:include page="../jdy/include/main_top.jsp"/>
	
	<div align="center" class="container1">
		<div class="container2">
			<h5>메시지</h5>
			<hr id="line1">
			<div class="chatt">
				채팅방 목록123
			</div>
		</div>

		<div class="container3">
			<h5 id="line2">채팅내용</h5>
			<hr>
		</div>	
	</div>
</body>
</html>