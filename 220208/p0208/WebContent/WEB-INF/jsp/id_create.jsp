<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="q" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script>
<q:if test="${ecode eq \"join_fail\"}">
	alert("�ߺ��� ���̵��Դϴ�");
</q:if>

function Checkform() { 
	if( frm.username.value == "" ) {
		frm.username.focus();
		alert("���̵� �Է����ּ���.");
		return false;
	} 
	
	if( frm.password.value == "" ) {
		frm.password.focus();
		alert("��й�ȣ�� �Է����ּ���.");
		return false;
	}
}
</script>
</head>
<body>
	<span>ȸ������</span><br/>
	<form method="POST" action="join_add.do" name="frm" onSubmit="return Checkform()">
		<input type="text" name="username"/>
		<input type="password" name="password"/>
		<input type="submit" value="join"/>
	</form>
</body>
</html>