<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%><%@ taglib prefix="q" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Question</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
body{
    background-color:#d8d89c;
}
.font{
    font-family:'Nanum Gothic';
    font-size: 16px;
    color:#808000;
}
.font_sm {
    font-family:'Nanum Gothic';
    font-size: 12px;
}
.title{
    font-family:'Nanum Gothic';
    height:75px;
    line-height:0px;
    font-size: 35px;
    text-align:center;
    background-color:#e5eed3;
    color:#808000;
}
.table{
    background-color:#e5eed3;
}
@media (max-width:767px) {
	.font{font-size:20px;}
	.font_table{font-size:12px;}
}
/* sm */
@media (min-width:768px) {
	.font{font-size:18px;}
	.font_table{font-size:14px;}
}
/* md */
@media (min-width:992px) {
	.font{font-size:18px;}
	.font_table{font-size:16px;}
}
/* lg */
@media (min-width:1200px) {
	.font{font-size:16px;}
	.font_table{font-size:16px;}
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<!--enctype="multipart/form-data"-->
	<q:if test="${ecode eq \"title_invalid\"}"><span>제목을 입력해주세요</span></q:if>
	<q:if test="${ecode eq \"content_invalid\"}"><span>내용을 입력해주세요</span></q:if>
	
	<form method="POST" action="add_notice.do">
        <div class="form-group has-success">
            <label class="font" for="bcde">제목</label>
            <input type="text" class="form-control font" id="bcde" name="title"/>
        </div>
        
        <div class="form-group has-success">
            <label class="font" for="bcd">운영자</label>
        </div>
        
        <div class="form-group has-success">
            <label class="font" for="abcd">내용</label>
            <textarea class="form-control font" id="abcd" name="content" rows="15"></textarea>
        </div>
        
        <div class="form-group has-success">
            <input class="form-control" type="submit"/>
        </div>
    </form>
</div>
</body>
</html>