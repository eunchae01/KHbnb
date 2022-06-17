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
		<c:set var="dto" value="${cont }"/>
		<hr width="50%" color="tomato">
			<h3>사업주 테이블 ${dto.getHost_name() } 회원 정보 상세내역 페이지</h3>
		<hr width="50%" color="tomato">
		<br>
		
		<table border="1" cellspacing="0" width="450">
			<tr>
				<th>사업주 번호</th>
				<td> ${dto.getHost_num() }</td>
			</tr>
			
			<tr>
				<th>사업주 아이디</th>
				<td> ${dto.getHost_id() }</td>
			</tr>
			
			<tr>
				<th>사업주 닉네임</th>
				<td> ${dto.getHost_nickname() }</td>
			</tr>
			
			<tr>
				<th>사업주 이름</th>
				<td> ${dto.getHost_name() }</td>
			</tr>
			
			<tr>
				<th>사업주 비밀번호</th>
				<td>
				<c:if test="${dto.getHost_pwd().length() != 0 }">
	               <c:forEach begin="1" end="${dto.getHost_pwd().length() }">
	                         *
	               </c:forEach>
	            </c:if>
	            </td>
	        </tr>
	        
	        <tr>
	        	<th>사업주 사진</th>
	        	<td>${dto.getHost_pic() }
	        	</td>
	        </tr>
	        
	        <tr>
	        	<th>사업주 휴대폰</th>
	        	<td>${dto.getHost_phone() }
	        	</td>
	        </tr>
	        
	        <tr>
	        	<th>사업주 등록일</th>
	        	<td> ${dto.getHost_date().substring(0,10) }
	        	</td>
	        </tr>
	        
	         <c:if test="${empty dto }">
	         <tr>
	            <td colspan="2" align="center">
	               <h3>사업주의 상세 정보가 없습니다.....</h3>
	            </td>
	         </tr>
	      </c:if>
	      
	      <tr>
	      	<td colspan="2" align="center">
	      		<input type="button" value="사업주 수정"
	      		onclick="location.href='host_modify.do?num=${dto.getHost_num()}&page=${Page }'">
	      		&nbsp;
	      		<input type="button" value="사업주 삭제"
	      		onclick="if(confirm('정말로 사업주를 삭제하시겠습니까?')){
	      					location.href='host_delete.do?num=${dto.getHost_num()}&page=${Page }'
	      					}else{ return;}">
	      					&nbsp;
	      		<input type="button" value="목록으로"
	      			onclick="location.href='host_list.do?page=${Page }'">
	      		</td>
	      	</tr>
	        	
	        
		
		</table>
	
	
	</div>



</body>
</html>