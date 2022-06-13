<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="styl.css"> -->
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
#login{
	
	margin-left: 1100px;
	margin-bottom:10px;
	font-size: 15px;
	word-spacing:20px;
	text-shadow: 1px 2px 2px #666;
}

#login a{
text-decoration:none
}

#login a:hover{
		color: #F90;
	
}

	.p-image img{
	
	float:left;
	margin-left:150px;
	margin-left:200px;
	}
	
	.profiles{
	margin-top:200px;
	}
	
	#profile{
	margin-top:200px;
	}
	
	.p-text {
	float:left;
	margin-left:50px;
	
	}
	
	.p-text ul li{
		font-size:23px;
		font-weight:bold;
		line-height: 300%;
		list-style-type: none;	
	}
	
	#text{
	
	clear:both;
	margin-bottom: 200px;
	
	
	}
	#text table{
	margin-top:200px;
	
	}
	
	.port {
	margin-top:200px;
	}
	
	.top{
	margin-top:0%;
	display: flex;
	justify-content:center;
	align-items:center;

	}
	
	#aboutme {
	
	
	width:600px;
	padding-top:5px;
	padding-left:50px;
	float:left;
	
	
	}
	
	#aboutme table{
	text-align:justfy;
	padding-left:80px;
	
	}
	
	
	

	 
	#sidebar{
	float:right;
	width:600px;
	height:300px;
	padding-top:20px;
	padding-left:20px;
	padding-right:100px;
	
	
	}
	
	#introduce{
	margin-top:100px;
	margin-left:70px;
	width:1300px;
	clear:both;
	}
	
	#introduce p{
	font-size:20px;
	font-weight: bold;
	}
	
	.center{
	padding-left:20px;
	}
	.up{
	padding-top:20px;
	}
	.up-center{
	padding-top:20px;
	padding-left:20px;
	}

	#navi{
		background-color: black;
	}
	
	#navi a{
text-decoration:none
}
	
	.head-bar{
	color:white;
	margin: 10px 40px;
	}
	
	.top li{
	
	
	
	color:white;
margin-top:5%;
	display: flex;
	
	
	font-size: 25px;
	font-weight: bold;
		text-decoration:none;
		display: inline-block; /*수직적 요소에서 수평적 요소로 전환 */
			margin: 10px 50px;
			padding: 5	px;
	
	}

.sub-title{
	font-size:15px;
	style:bold;
}
	
#foot{
	padding: 5px 0;
	width: 1200px;
	margin: 0 auto;
	
	text-align:center;
	background-color:black;
	color:white;
	font-size:15px;
	clear:both;
}






</style>
</head>
<body>
	
	
	
	<div align="center">
	<div class="top">
	<nav id ="navi">
			<h1 class="head-bar">관리자 메뉴</h1>
			
			
			<ul>
			
			 <li><a href="<%=request.getContextPath()%>/host_list.do" class="head-bar">[사업자관리]</a></li>
			 <li><a href="<%=request.getContextPath()%>/member_list.do" class="head-bar">[회원관리]</a></li>
			 <li><a href="<%=request.getContextPath()%>/review_list.do" class="head-bar">[리뷰관리]</a></li>
			 <li><a href="<%=request.getContextPath()%>/acc_list.do" class="head-bar">[숙소관리]</a></li>
			 
				
				
			</ul>	
			</nav>

			
	
	
			
				</div>
				</div>
	
	
</body>
</html>