<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<div align="center">

<hr width="50%" color="marmoon">
	      <h3>���̺� �α��� ������</h3>
	   <hr width="50%" color="marmoon">
	   <br>
		<form method="post" action="<%=request.getContextPath() %>/admin_login.do">
		<table border="1" cellspacing="0" width="350">
			<tr>
				<th>������ ���̵�</th>
				<td> <input name="admin_id"></td>
			</tr>
			
			<tr>
				<th>������ ��й�ȣ</th>
				<td> <input type="password" name="admin_pwd"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="�α���">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="�ٽ��ۼ�">
				</td>
			</tr>
				
		
		
		</table>
		
		
		
		</form>
		
		</div>

	
</body>
</html>