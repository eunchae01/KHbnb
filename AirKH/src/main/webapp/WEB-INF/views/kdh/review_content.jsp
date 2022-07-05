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
		text-transform: uppercase;
		
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
		
		<c:set var="dto" value="${Cont }"/>
		<Br>
			<h2>리뷰 테이블 ${dto.acc_name}
			상세내역 페이지</h2>
			<br>
			<img src="<%=request.getContextPath()%>/resources/member/${dto.member_pic}"  width="150px" height="150px">
		<br>
		
		
		
			<table border="0" cellspacing="0" width="750">
				<tr>
				<th>숙소이름</th>
				<td colspan="5">${dto.acc_name }</td>
			
				<tr>
					<th>리뷰번호</th>
					<td>${dto.review_num }</td>
					<th>숙소코드</th>
					<td>${dto.acc_code }</td>
					
					
					<th>리뷰아이디</th>
					<td>${dto.member_id }</td>
				</tr>
				<tr>
					<th>청결도</th>
					<td>${dto.review_cl}</td>
					<th>의사소통</th>
					<td>${dto.review_comm }</td>
					<th>체크인</th>
					<td>${dto.review_check }</td>
					</tr>
				<tr>
					<th>정확성</th>
					<td>${dto.review_acc }</td>
					<th>위치</th>
					<td>${dto.review_loc }</td>
					<th>만족도</th>
					<td>${dto.review_sat }</td>
					</tr>
				<tr>
					<th>예약날짜</th>
					<td colspan="3">${dto.review_date.substring(0,10) }</td>
					<th>평점</th>
					<td>${dto.review_grade }</td>
				</tr>
				<tr>
					<th>리뷰내용</th>
					<td align="center" colspan="5"><textarea rows="3" cols="50" name="review_content" readonly>${dto.review_content }</textarea>
					</td>
				</tr>
				
				<c:if test="${empty dto }">
			         <tr>
			            <td colspan="2" align="center">
			               <h3>조회된 상세 내역이 없습니다.....</h3>
			            </td>
			         </tr>
			      </c:if>
				<tr>
					<td colspan="6" align="center">
						<input type="button" class="btn btn-primary" value="리뷰수정"
			               onclick="location.href='review_modify.do?no=${dto.review_num}&page=${Page }'">
			               &nbsp;
			            <input type="button" class="btn btn-primary" value="글삭제"
			               onclick="if(confirm('정말로 글을 삭제하겠습니까?')) {
			               				location.href='review_delete.do?no=${dto.review_num}&page=${Page }'
			               		    }else {  return; }">
			               &nbsp;
			            <input type="button" class="btn btn-primary" value="전체목록"
			               onclick="location.href='review_list.do?page=${Page }'">
	         </td>
	      </tr>
				
				
			
				</table>
			</div>
		</div>
	</div>

</body>
</html>