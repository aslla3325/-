<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="q" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
</head>
<body>
	<q:if test="${ecode eq \"join_success\"}">ȸ�������� �Ϸ�Ǿ����ϴ�. �ٽ� �α��� ���ּ���</q:if>
	<q:if test="${ecode eq \"id_invalid\"}">���̵� �Է����ּ���</q:if>
	<q:if test="${ecode eq \"pwd_invalid\"}">��й�ȣ�� �Է����ּ���</q:if>
	<q:if test="${ecode eq \"need_login\"}">�α����� �ʿ��մϴ�</q:if>
	<form method="POST" action="login_add.do">
		<input type="text" name="username"/>
		<input type="password" name="password"/>
		<input type="submit"/>
	</form>
	<a href="join.do">ȸ������</a>
	
	<q:if test="${ecode eq \"login_fail\"}">
		<span>�ش� ���̵� ��й�ȣ�� �����ϴ�</span>
	</q:if>
</body>
</html>