<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main-top</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/grid.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/top.style.css" />
</head>
<body>
	<c:set var="hostORmember" value="${hostORmember }"/>
	<section class="top-nav">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-3">
					<div class="top-logo">
						<a href="<%=request.getContextPath()%>/jdy.do">
							<img src="<%=request.getContextPath() %>/resources/assets/logo.png" alt="" class="logo-icon" />
							<h1 class="logo-title">khbnb</h1>
						</a>
					</div>
				</div>
				<div class="col-6 search">
					<div class="search-bar round-box">
						<form action="<%=request.getContextPath() %>/acc_search.do" method="post">
							<input class="where" type="text" name="where" placeholder="여행지 검색" />
							<input
								type="number"
								name="howMany"
								placeholder="게스트 추가"
								min="1"
							/>
							<button type="submit">
								<img
									src="<%=request.getContextPath() %>/resources/assets/magnifying-glass.png"
									alt=""
									class="search-icon"
								/>
							</button>
						</form>
					</div>
				</div>
				<div class="col-3">
					<div class="join-bar">
						<div class="join-box">
							<c:if test="${empty hostORmember }">
								<a href="<%=request.getContextPath()%>/login.do">
									로그인
								</a>
							</c:if>
							<c:if test="${!empty hostORmember }">
								<a href="<%=request.getContextPath()%>/log-out.do">
									로그아웃
								</a>
							</c:if>
						</div>
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

							
								<a href="<%=request.getContextPath()%>/signup-host.do">숙소 호스트 되기</a>

								<a href="<%=request.getContextPath()%>/wish.content.do">위시리스트</a>
								<a href="<%=request.getContextPath()%>/reservation_guest.do?member_id=member_id">여행</a>

								<a href="#">계정</a>
								<a href="<%=request.getContextPath()%>/QA.do">도움말</a>
								<c:if test="${!empty hostORmember }">
									<a href="<%=request.getContextPath()%>/log-out.do">로그아웃</a>
										
									
								</c:if>
								
								
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