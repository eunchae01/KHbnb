<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="sty.css"> -->


<style type="text/css">
@charset "UTF-8";

/* 문서 전체에 대한 디자인 적용 */

body{
	
	}
	
	#container{
		width: 1400px;		/* 문서 전체의 폭(가로) 설정 */
		margin: 0 auto;
		background-color: #fff;
		
		
}



	
	
	.p-text {
	float:left;
	margin-left:150px;
	
	}
	
	.p-text ul li{
		font-size:23px;
		font-weight:bold;
		line-height: 300%;
		list-style-type: none;	
	}
	
	
	
	.top{
	margin-top:0%;
	display: flex;
	justify-content:center;
	align-items:center;
	

	}
	
	

	#navi{
	width:100%;
		
	}
	

	
	.top a{
	
	color :black;
	text-decoration:none;
	margin: 10px 60px;
	}
	a{
	color:black;
	text-decoration:none;
	}
	
	.head-bar {
	
	text-color :black;
	text-decoration:none;
	margin: 10px 50px;
	}
	
	.head{
	font-color:black;
	font-size: 30px;
	font-weight: bold;
	}
	
	.top li{
	
	
	
	
	margin-top:5%;
	display: flex;
	
	
	font-size: 25px;
	font-weight: bold;
		text-decoration:none;
		display: inline-block; /*수직적 요소에서 수평적 요소로 전환 */
			margin: 10px 10px;
			padding: 5	px;
	
	}
	
	.top ul{
	
	
	
	
	margin-top:0;
	
	
	}
	



#navi{
box-shadow: 0px 2px 0px 0px rgba(0, 0, 0, 0.1);
}




</style>
</head>
<body>
	
	
	
	<div align="center">
	<div class="top">
	<nav id ="navi">
			
			
			
			<ul>
			
			
						
							<li><a href="<%=request.getContextPath()%>/admin_loginOk.do" class="head-bar"><img src="<%=request.getContextPath() %>/resources/assets/logos.png" alt="" width="40px"/>
							관리자 페이지</a></li>
							
						
					
			
			 <li><a href="<%=request.getContextPath()%>/host_list.do" class="head-bar">[호스트관리]</a></li>
			 <li><a href="<%=request.getContextPath()%>/member_list.do" class="head-bar">[회원관리]</a></li>
			 <li><a href="<%=request.getContextPath()%>/review_list.do" class="head-bar">[리뷰관리]</a></li>
			 <li><a href="<%=request.getContextPath()%>/qa_list.do" class="head-bar">[고객센터]</a></li>
			 <li><a href="<%=request.getContextPath()%>/payment_list.do" class="head-bar">[결제관리]</a></li>
			 <li><a href="<%=request.getContextPath()%>/hacc_list.do" class="head-bar">[숙소관리]</a></li>
			 
			<br>
			
			
			 
				
				
			</ul>	
			</nav>

			
	
	
			
				</div>
				</div>
	
	
</body>
</html>