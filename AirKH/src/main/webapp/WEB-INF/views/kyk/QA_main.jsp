<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움말</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/grid.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/cont.css" />
<script type="text/javascript">
$(function(){
	 //글자 수 제한
    $('#QA_text').on('keyup', function() {
        $('#QA_text_cnt').html("("+$(this).val().length+" / 1000)");
 
        if($(this).val().length > 1000) {
            $(this).val($(this).val().substring(0, 1000));
            $('QA_text_cnt').html("(1000 / 1000)");
        }
    });
});
</script>
<style type="text/css">
 #QA_header{
 	margin: 150px auto;
 	width:1200px;
 	
 	text-align: center;
 } 
 .QA_q{ font-size : 45px; }
 #QA_box{
 	
 	top:100px;  
 	text-align: center;
 }


 .qa_mt{margin-bottom:20px;  background:#ff3e5c; color:#fff;}

.qa_title{padding:5px 15px; margin-bottom:20px; text-align: center; width:20%; border:1px solid #000;}
.qa_title.mid{width:60%;}
.qa_list{background:#fed0d8;}
.qa_btn{ border : 5px solid #ff3e5c; margin:10px; background: #ff3e5c; color:#fff; width:90px; height:40px; border-radius: 10%;}
.qa_bottom{border-top : 1px solid #000; background: #fed0d8;}
.p_margin{margin:15px auto;}
</style>
</head>
<body>
	<jsp:include page="../jdy/include/main_top.jsp" />
	
	<div id="QA_header">
		<p class="QA_q">무엇이든 물어보세요</p>
		<br/>
		<div id="QA_box">
			<p> 나의 문의 목록</p>
			<table border="1" cellspacing="0" width="1200">
				<tr class="qa_mt">
					<th class="qa_title">문의 종류</th> <th class="qa_title mid">문의글 제목</th> <th class="qa_title">문의글 상태</th>
				</tr>
				
				
				<c:set var="list" value="${qa_list }" />
				
				
				  <c:if test="${!empty list }">
			         <c:forEach items="${list }" var="i">
			            <tr class="qa_list">
				            <c:if test="${i.qa_type eq 0 }">
				            	   <td> 여행 </td>
				            </c:if>
				            <c:if test="${i.qa_type eq 1 }">
				            	   <td> 예약 </td>
				            </c:if>
				            <c:if test="${i.qa_type eq 2 }">
				            	   <td> 환불 </td>
				            </c:if>
				            <c:if test="${i.qa_type eq 3 }">
				            	   <td> 결제 </td>
				            </c:if>
				            <c:if test="${i.qa_type eq 4 }">
				            	   <td> 기타 </td>
				            </c:if>
			            
			                
			              
			               
			              
			               	<td>
			                  <a href="<%=request.getContextPath() %>/QA_content.do?qa_num=${i.qa_num }">
             							${i.qa_title } </a></td>
			              
			                
			               
			               
			               	<td> 
			               		<c:if test="${i.qa_state eq 0}">
			               			처리중
			               		</c:if>
			               		<c:if test="${i.qa_state eq 1}">
			               			답변완료
			               		</c:if>
			               		
			               	 </td>
			            	</tr>
	         		</c:forEach>
	    		  </c:if>
	      
	      <c:if test="${empty list }">
	         <tr  class="qa_list">
	            <td colspan="3" align="center">
	               <p class="p_margin">문의 내역이 없습니다.</p>
	            </td>
	         </tr>
	      </c:if>
	      
	      <tr>
	      
	         <td class="qa_bottom" colspan="3" align="right">
	         
	            <input type="button" value="문의하기" class="qa_btn"
	                 onclick="location.href='QA_write.do'" >
	         </td>
	      </tr>
			</table>
			
		</div>
	</div>
	
	<jsp:include page="../jdy/include/footer.jsp"/>
</body>
</html>