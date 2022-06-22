<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="main_navi.jsp"/>
</head>
<body>
	
	<div align="center">
	<c:set var="dto" value="${Cont }"/>
	<c:set var="pageing" value="${Page }"/>
	<table border="0" cellspacing="0" width="300">
	<tr>
	
		<th><h2>회원 ${dto.member_id }의<br> 상세정보</h2></th>
		<td>
		<img src="<%=request.getContextPath()%>/resources/member/${dto.member_pic}"  width="70px" height="70px">
		</td>
	</tr>
	</table>
	
	<table border="0" cellspacing="0" width="450">
		<tr>
			<th>회원 번호</th>
			<td>${dto.member_num }</td>
		</tr>
		
		<tr>
			<th>회원 아이디</th>
			<td>${dto.member_id }</td>
		</tr>
		
		<tr>
			<th>회원 닉네임</th>
			<td>${dto.member_nickname }</td>
		</tr>
		
		<tr>
			<th>회원 이름</th>
			<td>${dto.member_name }</td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td><c:if test="${!empty dto.member_pwd }">
	               <c:forEach begin="1" end="${dto.member_pwd.length() }">
	                         *
	               </c:forEach>
	            </c:if>
	         </td>
	    </tr>
	    
	   
	      
	    
	    <tr>
	         <th>전화번호</th>
	         <td> ${dto.member_phone } </td>
	    </tr>
	    <c:if test="${empty dto }">
	         <tr>
	            <td colspan="2" align="center">
	               <h3>조회된 상세 내역이 없습니다.....</h3>
	            </td>
	         </tr>
	      </c:if>
	      
	      
	      <tr>
	      	<td colspan="2" align="center">
	      		<input type="button" value="회원정보수정" onclick="location.href='member_modify.do?no=${dto.member_num}&page=${Page}'">
	      		&nbsp;
	      		<input type="button" value="회원정보삭제" onclick="if(confirm('정말로 글을 삭제하시겟습니까')){
	      			location.href='member_delete.do?no=${dto.member_num}&page=${Page }'
	      		}else{return;}">&nbsp;
	      		<input type="button" value="회원목록" onclick="location.href='member_list.do?page=${Page}'">
	      		</td>
	      	</tr>
	      
	      	
			
			
	
	
	
	</table>
	</div>


</body>
</html>