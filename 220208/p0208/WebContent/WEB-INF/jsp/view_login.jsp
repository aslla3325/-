<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="q" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script>
<q:choose>
	<q:when test="${ecode eq \"login_fail\"}">
		alert("�ش� ���̵� ��й�ȣ�� �����ϴ�");
	</q:when>
	<q:when test="${ecode eq \"join_success\"}">
		alert("ȸ�������� �Ϸ�Ǿ����ϴ�. �ٽ� �α��� ���ּ���");
	</q:when>
	<q:when test="${ecode eq \"need_login\"}">
		alert("�α����� �ʿ��մϴ�");
	</q:when>
</q:choose>

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
	<form method="POST" action="login_add.do" name="frm" onSubmit="return Checkform()">
		<input type="text" name="username"/>
		<input type="password" name="password"/>
		<input type="submit"/>
	</form>
	<a href="join.do">ȸ������</a>

</body>
</html>