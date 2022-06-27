<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

 <style>
        #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        #modal .modal-window {
            background: rgba( 69, 139, 197, 0.70 );
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 1200px;
            height: 500px;
            position: relative;
            top: -100px;
            padding: 10px;
        }
        #modal .title {
            /*padding-left: 10px;*/
            position:absolute;
            left:44%;
            text-shadow: 1px 1px 2px gray;
            color: white;
            
            
        }
        #modal .title h2 {
            display: inline;
        }
        #modal .close-area {
            position:absolute;
            right:1%;            
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        .re_hidden{display:none;}
    </style>
</head>
<body>
  <div id="container">
        <h2>Lorem Ipsum</h2><input type="button" value="리뷰 등록하기" id="btn-modal">
        <div id="lorem-ipsum"></div>
    </div>
    
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2>리뷰 등록하기</h2>
            </div>
            <div class="close-area">X</div>
            <c:set var="acl" value="${ac_list }"/>
            <div class="content">
                <form method="post" action="<%=request.getContextPath() %>/review_insert_ok.do">
                	<table border="0" cellspacing="0" width="800px">
                		<tr>
                			<th>숙소 이름</th>
                			<td><input type="text" name="acc_name">${acl.acc_name }</td>
                			<td class="re_hidden"><input type="text" name="acc_code">${acl.acc_code }</td>
                			<td class="re_hidden"><input type="text" name="member_id">${acl.member_id }</td>
                		</tr>
                		<tr>
                			<th>청결한가요?</th>
                			<td>
                			<input type="checkbox" name="acc_cl" value="1">1점
                			<input type="checkbox" name="acc_cl" value="2">2점
                			<input type="checkbox" name="acc_cl" value="3">3점
                			<input type="checkbox" name="acc_cl" value="4">4점
                			<input type="checkbox" name="acc_cl" value="5">5점
                			</td>
                		</tr>
                		<tr>
                			<th>의사소통은 잘 되었나요?</th>
                			<td>
                			<input type="checkbox" name="acc_comm" value="1">1점
                			<input type="checkbox" name="acc_comm" value="2">2점
                			<input type="checkbox" name="acc_comm" value="3">3점
                			<input type="checkbox" name="acc_comm" value="4">4점
                			<input type="checkbox" name="acc_comm" value="5">5점
                			</td>
                		</tr>
                		<tr>
                			<th>체크인 / 아웃 시간은 잘 지켜졌나요?</th>
                			<td>
                			<input type="checkbox" name="acc_check" value="1">1점
                			<input type="checkbox" name="acc_check" value="2">2점
                			<input type="checkbox" name="acc_check" value="3">3점
                			<input type="checkbox" name="acc_check" value="4">4점
                			<input type="checkbox" name="acc_check" value="5">5점
                			</td>
                		</tr>
                		<tr>
                			<th>주소는 정확한가요?</th>
                			<td>
                			<input type="checkbox" name="acc_acc" value="1">1점
                			<input type="checkbox" name="acc_acc" value="2">2점
                			<input type="checkbox" name="acc_acc" value="3">3점
                			<input type="checkbox" name="acc_acc" value="4">4점
                			<input type="checkbox" name="acc_acc" value="5">5점
                			</td>
                		</tr>
                		<tr>
                			<th>교통편의성은 어떤가요?</th>
                			<td>
                			<input type="checkbox" name="acc_loc" value="1">1점
                			<input type="checkbox" name="acc_loc" value="2">2점
                			<input type="checkbox" name="acc_loc" value="3">3점
                			<input type="checkbox" name="acc_loc" value="4">4점
                			<input type="checkbox" name="acc_loc" value="5">5점
                			</td>
                		</tr>
                		<tr>
                			<th>가격대비 만족도는 어떤가요?</th>
                			<td>
                			<input type="checkbox" name="acc_sat" value="1">1점
                			<input type="checkbox" name="acc_sat" value="2">2점
                			<input type="checkbox" name="acc_sat" value="3">3점
                			<input type="checkbox" name="acc_sat" value="4">4점
                			<input type="checkbox" name="acc_sat" value="5">5점
                			</td>
                		</tr>
                		<tr>
                			<th>한 말씀 적어주세요.</th>
                			<td><textarea name="re_cont" width="800" height="400"></textarea></td>
                		</tr>
                		
                	</table>
                	<input class="submit_btn" type="submit" value="리뷰등록">
                </form>
                
            </div>
        </div>
    </div>
    <script>
  			// 모달 기본 틀
        	const modal = document.getElementById("modal")
            

            function modalOn() {
			    modal.style.display = "flex"
			}
			function isModalOn() {
			    return modal.style.display === "flex"
			}
			function modalOff() {
			    modal.style.display = "none"
			}
            
            // 모달 보이게하기
			const btnModal = document.getElementById("btn-modal")
				btnModal.addEventListener("click", e => {
				    modal.style.display = "flex"
				})
			
			// x 버튼 클릭 시 닫기 
			const closeBtn = modal.querySelector(".close-area")
				closeBtn.addEventListener("click", e => {
				    modal.style.display = "none"
			})
			
			// 모달 바깥부분 클릭 시 닫기
			modal.addEventListener("click", e => {
			    const evTarget = e.target
			    if(evTarget.classList.contains("modal-overlay")) {
			        modal.style.display = "none"
			    }
			})
	
			// ESC 버튼 누르면 닫기
			window.addEventListener("keyup", e => {
			    if(modal.style.display === "flex" && e.key === "Escape") {
			        modal.style.display = "none"
			    }
			})
    </script>
	
</body>
</html>