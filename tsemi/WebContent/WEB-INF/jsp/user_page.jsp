<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%><%@ taglib prefix="q" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1">
<title>;;; - ����������</title>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
@import url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_three@1.0/D2Coding.woff');
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

html, body {
    margin: 0;
    padding: 0;
}

/* ȭ�� ���� ���� */
.wrapper {
  display: flex;
  ovreflow: hidden;
}

/* ��� �κ� */
.headers {
    font-family: 'Hanna', fantasy;
    font-size: 40px;
    margin: 0 10px;
    height: 50px;
    border-bottom: 2px #00CC00 solid;
    /* border-bottom: 2px #00CC00 solid;*/
}

/* �޴��� ��Ʈ ���� */
.menu_font {
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: bold;
    font-size: 17px;
    margin-left: 7px; 
    color: #0D5718;
}

/* �޴� ��� div ���� */
.menu {
    width: 20%;
    height: auto;
    float: left;
    background-color: #4CE564;
    margin: 10px 0px 0px 0px;
    border-radius: 0 10px 0 0;
}

/* content�κ� ��� div ���� */
.content {
    width: 80%;
    height: 920px;
    float: right;
    background-color: #FDFFF2;
    margin: 10px 0px 0px 0px;
}

/* ��������, �̴��� Ȱ���� ������ �������� ���� */
.con1 {
    display: flex;
}

/* �������׺κ� ��ü div ���� */
.gong {
    margin-top: 20px;
    margin-left: auto;
    margin-right: 10px;
    width: 65%;
    height: 160px;
}

/* �̴���Ȱ���� �κ� ��ü div ���� */
.thismonth {
    margin-top: 20px;
    margin-left: 10px;
    margin-right: auto;
    width: 25%;
    height: 160px;
}

/* content Ÿ��Ʋ */
.title {
    margin: 10px 5px 0px 5px;
    background-color: #FDFFF2;
    /* #FDFFF2 */
    height: 60px;
    width: 98%;
    
}

/* content Ÿ��Ʋ ��Ʈ */
.title_sub {
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: bold;
    padding: 25px 10px 20px 10px;
    margin-right: auto;
    margin-left: auto;
    width: 90%;
}

/* content Ÿ��Ʋ ��Ʈ */
.title_sub2 {
    padding: 5px 10px 15px 10px;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: bold;
}

/* �����κ� div */
.question {
    margin-top: 0px;
    margin-bottom: 0px;
    margin-right: auto;
    margin-left: auto;
    background-color: #f8f8f8;
    height: 250px;
    width: 90%
}

/* ���κ� div */
.anything {
    margin-top: 0px;
    margin-bottom: 80px;
    margin-right: auto;
    margin-left: auto;
    background-color: #f8f8f8;
    height: 250px;
    width: 90%
}

/* �޴� ���� */
.top_menu {
    /* 2 : background-color: #0D5718; */
    background-color: #4CE564;
    margin-top: 50px;
    margin-left: 5px;
}

/* �޴� �߰��� */
.middle_menu {
    /* 2 : background-color: #0D5718; */
    background-color: #4CE564;
    margin-top: 20px;
    margin-left: 5px;
}

/* �޴� �Ʒ��� (����) */
.bottom_menu {
    /* 2 : background-color: #0D5718; */
    background-color: #4CE564;
    margin-top: 50px;
    margin-left: 5px;
}

.point_menu {
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 17px;
    background-color: green; 
    padding: 10px; 
    color: #FDFFF2;
    font-weight: bold;
    margin-top: 20px;
    /* margin-left: 5px; */
    box-shadow: 0 0 10px green;
}

/* �������� ����Ʈ */
.list {
    padding: 13px 10px;
    border: 1px solid #FFDD3D;
    border-left: 3px solid #00CC00;
    background-color: #FDFFF2;
    font-family: 'Noto Sans KR', sans-serif;
}

/* �������� �̴���Ȱ���� �������� ����Ʈ */
.list_top {
    padding: 9.7px 10px;
    border: 1px solid #FFDD3D;
    border-left: 3px solid #00CC00;
    font-family: 'Noto Sans KR', sans-serif;
}

a {
    text-decoration: none;
    color: green;
}

/* �α׾ƿ� ��ư */
.logout {    
    margin-top: 21px;
    margin-right: 10px;
    float: right;
    font-family: 'Noto Sans KR', sans-serif;
    text-transform: uppercase;
    outline: 0;
    background: #FDFFF2;
    border: 0;
    padding: 5px 10px;
    color: black;
    -webkit-transition: all 0.3 ease;
    transition: all 0.3 ease;
    cursor: pointer;
    border-radius: 5px 5px 0 0;
}

.logout:hover,.logout:active,.logout:focus {
  background: #00CC00;
}

.photo_head {
    margin-top: 5px;
    margin-left: 8px;
    height: 75px;
    width: 75px;
    border: 2px solid #00CC00;
    border-radius: 50%;
}

.wrapper {
  display: flex;
  ovreflow: hidden;
}

.photo {
    display: inline-block;
    border: 3px solid #FFDD3D;
    border-radius: 50%;
    overflow: hidden;
    height: 200px;
    width: 200px;
    background-color: white;
}

.myback {
    background-color: #FFDD3D;
    margin-top: 30px;
}

</style>
</head>
<body>
    <header class="headers">
        <a style="color: #0D5718; margin-left: 10px;" href="home.do">;;;</a>
        <button style="color: #0D5718;" class="logout" onclick="location.href='login.do';">�α׾ƿ�</button>
    </header>
    <div class="wrapper">
        <div class="menu">
            <!-- <div class="menu_font">Triple<br/>semicolon</div>  -->
            <div class="menu_font"></div>
            <div style="background-color: green;">
                <div class="point_menu" style="cursor: pointer; margin-top: 40px;" onclick="location.href='mypage.do';">����������</div>
            	<!--<div class="bottom_menu menu_font" style="cursor: pointer;" onclick="location.href='mypage.do';">����������</div> -->
            </div>
            <div style="position:sticky;">
            <div class="top_menu menu_font" style="cursor: pointer;" onclick="location.href='notice.do';">��������</div>
            <div class="middle_menu menu_font" style="cursor: pointer;" onclick="location.href='qna_list.do';">Q & A</div>
            <div class="middle_menu menu_font" style="cursor: pointer;" onclick="location.href='com_list.do';">���</div>
            <div class="middle_menu menu_font" style="cursor: pointer;" onclick="location.href='month_act.do';">�̴��� Ȱ����</div>
            <div class="bottom_menu menu_font" style="cursor: pointer;" onclick="window.open('https://github.com/');">Go to Github</div>
            </div>
		</div>
		
        <div class="content">
            <div style="text-align: center; margin-top: 30px;">
                <img src="images/ts.png" class="photo">
            </div>
            <div class="myback">
                my_page
            </div> 
                
			<div class="title_sub2">
				<a href="notice.do">���� �� ����</a>
			</div>
			<q:forEach items="${ques}" end="2" var="t">
				<div class="list_top">
					<div class="dotdotdot"><a href="qna.do?no=${t.no}">${t.title}</a></div>
				</div>
			</q:forEach> 
			
			<div class="title_sub2">
				<a href="notice.do">���� �� �����亯</a>
			</div>
			<q:forEach items="${q_ans}" end="2" var="t">
				<div class="list_top">
					<div class="dotdotdot"><a href="qna.do?no=${t.no}">${t.content}</a></div>
				</div>
			</q:forEach> 
			
			<div class="title_sub2">
				<a>----------------------------------------------------------------------</a><br/>
				<a>----------------------------------------------------------------------</a><br/>
				<a>----------------------------------------------------------------------</a>
			</div>
			
			<div class="title_sub2">
				<a href="notice.do">���� �� ���</a>
			</div>
			<q:forEach items="${com}" end="2" var="t">
				<div class="list_top">
					<div class="dotdotdot"><a href="com.do?no=${t.no}">${t.title}</a></div>
				</div>
			</q:forEach> 
			
			<div class="title_sub2">
				<a href="notice.do">���� �� ���亯</a>
			</div>
			<q:forEach items="${com_ans}" end="2" var="t">
				<div class="list_top">
					<div class="dotdotdot"><a href="com.do?no=${t.no}">${t.content}</a></div>
				</div>
			</q:forEach>         

        </div>     
    </div>
</body>
</html>