<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="main_navi.jsp"/>

<div align="center">
		<hr width="50%" color="gray">
		<c:set var="dto" value="${Cont }"/>
			<h2>리뷰 테이블 ${dto.member_id}상세내역 페이지</h2>
		<hr width="50%" color="gray">
		
		
		
			<table border="1" cellspacing="0" width="750">
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
						<input type="button" value="리뷰수정"
			               onclick="location.href='review_modify.do?no=${dto.review_num}&page=${Page }'">
			               &nbsp;
			            <input type="button" value="글삭제"
			               onclick="if(confirm('정말로 글을 삭제하겠습니까?')) {
			               				location.href='review_delete.do?no=${dto.review_num}&page=${Page }'
			               		    }else {  return; }">
			               &nbsp;
			            <input type="button" value="전체목록"
			               onclick="location.href='review_list.do?page=${Page }'">
	         </td>
	      </tr>
				
				
			
				</table>
				
			
	</div>

</body>
</html>