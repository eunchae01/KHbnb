<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style type="text/css">

.wrapper {
		display: flex;
		flex-direction: column;
		height: 100%;
		align-items:center;
		
	}
	
	.container0 {
		width:90%;
	}


</style>

</head>
<body>
<div class="wrapper">
		<div class="container0">	
			<jsp:include page="main_navi.jsp"/>

<div align="center">
		<Br>
			<h2>고객 테이블 글쓰기(임시) 페이지</h2>
		
		
		<br>
		
		<form method="post" action="<%=request.getContextPath() %>/qa_writeOk.do">
			<table border="0" cellspacing="0" width="450">
				
				<tr>
					<th>게시글 종류</th>
					<td><select name="qa_type">
                  <option value="" selected>문의 글 종류</option>
                  <option value="0">여행</option>
                  <option value="1">예약</option>
                  <option value="2">환불</option>
                  <option value="3">결제</option>
                  <option value="4">기타</option>
               </select></td>
				
				<tr>
					<th>작성자</th>
					<td><input name="qa_id"></td>
				</tr>
				
				<tr>
					<th>글제목</th>
					<td><input name="qa_title"></td>
				</tr>
				
				<tr>
					<th>글내용</th>
					<td><textarea rows="8" cols="20" name="qa_cont">
					</textarea>
					</td>
				</tr>
				
				
				
				<tr>
				
					<td colspan="2" align="center">
					<input class="btn btn-primary" type="submit" value="게시글 작성">&nbsp;&nbsp;
					<input class="btn btn-primary" type="reset" value="다시작성">
					</td>
				</tr>
					
					
				
			
			
			
			
			</table>
		
		
		
		
		
		
		
		
		</form>
			</div>
		</div>
	
	</div>


</body>
</html>