<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="q" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

</head>
<body>
	<span>ȸ������</span><br/>
	<q:if test="${ecode eq \"id_invalid\"}">���̵� �Է����ּ���</q:if>
	<q:if test="${ecode eq \"pwd_invalid\"}">��й�ȣ�� �Է����ּ���</q:if>
	<form method="POST" action="join_add.do">
		<input type="text" name="username"/>
		<q:if test="${ecode eq \"join_fail\"}">�ߺ��� ���̵��Դϴ�</q:if>
		<br/>
		<input type="password" name="password"/>
		<input type="submit" value="join"/>
	</form>
</body>
</html>