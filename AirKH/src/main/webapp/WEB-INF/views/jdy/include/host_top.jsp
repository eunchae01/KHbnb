<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main-top</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/grid.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/host-top.style.css" />
</head>
<body>
	<section class="top-nav">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-9">
					<div class="top-logo">
						<a href="<%=request.getContextPath()%>/host_main.do">
							<img src="<%=request.getContextPath() %>/resources/assets/host-logo.png" alt="" class="logo-icon" />
							<h1 class="logo-title">khbnb</h1>
						</a>
					</div>
				</div>
				<div class="col-3">
					<div class="join-bar">
						<div class="round-box img-box dropdown">
							<a
								href="javascript:void(0)"
								class="dropdown-box"
								onclick="myFunction()"
							>
								<img
									src="<%=request.getContextPath() %>/resources/assets/menu.png"
									alt=""
									class="menu-icon dropbtn"
								/>
								<img
									src="<%=request.getContextPath() %>/resources/assets/user.png"
									alt=""
									class="user-icon dropbtn"
								/>
							</a>
							<div class="dropdown-content" id="myDropdown">
								<a href="<%=request.getContextPath()%>/message.do">메시지</a>
								<a href="#">숙소 관리</a>

								<a href="<%=request.getContextPath()%>/info-update.do">계정</a>

								<a href="<%=request.getContextPath()%>/QA.do">도움말</a>

								<a href="<%=request.getContextPath()%>/log-out.do">로그아웃</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script>
	/* When the user clicks on the button, 
	toggle between hiding and showing the dropdown content */
	function myFunction() {
		document.getElementById('myDropdown').classList.toggle('show');
	}

	// Close the dropdown if the user clicks outside of it
	window.onclick = function (e) {
		if (!e.target.matches('.dropbtn')) {
			var dropdowns = document.getElementsByClassName('dropdown-content');
			for (var d = 0; d < dropdowns.length; d++) {
				var openDropdown = dropdowns[d];
				if (openDropdown.classList.contains('show')) {
					openDropdown.classList.remove('show');
				}
			}
		}
	};
</script>
</html>