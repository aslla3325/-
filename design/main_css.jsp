<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1">
<title>;;;</title>
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
    
}

/* content�κ� ��� div ���� */
.content {
    width: 80%;
    height: auto;
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
    width: 45%;
    height: 200px;
}

/* �̴���Ȱ���� �κ� ��ü div ���� */
.thismonth {
    margin-top: 20px;
    margin-left: 10px;
    margin-right: auto;
    width: 45%;
    height: 200px;
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

/* �������� ����Ʈ */
.list {
    padding: 13px 10px;
    border: 1px solid #FFDD3D;
    border-left: 3px solid #00CC00;
    background-color: #FDFFF2;
}

/* �������� �̴���Ȱ���� �������� ����Ʈ */
.list_top {
    padding: 9.7px 10px;
    border: 1px solid #FFDD3D;
    border-left: 3px solid #00CC00;
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
}

.logout:hover,.logout:active,.logout:focus {
  background: #00CC00;
}

</style>
</head>
<body>
    <header class="headers">
        <a style="color: #0D5718;" href="main_css.jsp">;;;</a>
        <button style="color: #0D5718;" class="logout">�α׾ƿ�</button>
    </header>
    <div class="wrapper">
        <div class="menu">
            <!-- <div class="menu_font">Triple<br/>semicolon</div>  -->
            <div class="menu_font"></div>
            <!-- <div class="bottom_menu menu_font" style="cursor: pointer;" onclick="location.href='user_page.jsp';">����������</div> -->
            <div class="top_menu menu_font" style="cursor: pointer;" onclick="location.href='gong_menu.jsp';">��������</div>
            <div class="middle_menu menu_font" style="cursor: pointer;" onclick="location.href='qna.jsp';">Q & A</div>
            <div class="middle_menu menu_font" style="cursor: pointer;" onclick="location.href='anything.jsp';">���</div>
            <div class="middle_menu menu_font" style="cursor: pointer;" onclick="location.href='thismonth_a.jsp';">�̴��� Ȱ����</div>
            <div class="bottom_menu menu_font" style="cursor: pointer;" onclick="window.open('https://github.com/');">Go to Github</div>
        </div>
        <div class="content">
            <div class="con1">
                <div class="gong" style="margin-bottom: 15px;">
                    <div class="title_sub2">
                        <a href="gong_menu.jsp">��������</a>
                    </div>
                    <div class="list_top">
                        <a href="gongji.jsp">���� 1</a>
                    </div>
                    <div class="list_top">
                        <a href="gongji.jsp">���� 2</a>
                    </div>
                    <div class="list_top">
                        <a href="gongji.jsp">���� 3</a>
                    </div>
                    <div class="list_top">
                        <a href="gongji.jsp">���� 4</a>
                    </div>
                </div>
                <div class="thismonth">
                    <div class="title_sub2">
                        <a href="thismonth_a.jsp">�̴��� Ȱ����</a>
                    </div>
                    <div class="list_top">
                        <a href="thismonth_a.jsp">��������</a>
                    </div>
                    <div class="list_top">
                        <a href="thismonth_a.jsp">��������</a>
                    </div>
                    <div class="list_top">
                        <a href="thismonth_a.jsp">��������</a>
                    </div>
                    <div class="list_top">
                        <a href="thismonth_a.jsp">��������</a>
                    </div>
                </div>
            </div>
            
            <div class="title">
                <div class="title_sub">
                    <a href="thismonth_a.jsp">�̴��� ����</a>
                </div>
            </div>
            <div>
                <div style="width: 90%; margin-right: auto; margin-left: auto;">
                    <div class="list">
                        <a href="question.jsp">���� 1</a>
                        <a style="float: right;" href="user1">��������</a>
                        <div style="padding: 20px 10px 10px 10px;">
                            �� ������ ��¼�� ��¼�� �̷��� ������ �̰ſ����ϴ� 
                            <br/>�ذ����ֽǺ� ���մϴ� �����ȳ� ����
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="title">
                <div class="title_sub">
                    <a href="qna.jsp">Q & A</a>
                </div>
            </div>
            <div>
                <div class="question">
                    <div class="list">
                        <a href="question.jsp">���� 1</a>
                        <a style="float: right;" href="user1">��������</a>
                    </div>
                    <div class="list">
                        <a href="question.jsp">���� 1</a>
                        <a style="float: right;" href="user1">��������</a>
                    </div>
                    <div class="list">
                        <a href="question.jsp">���� 1</a>
                        <a style="float: right;" href="user1">��������</a>
                    </div>
                    <div class="list">
                        <a href="question.jsp">���� 1</a>
                        <a style="float: right;" href="user1">��������</a>
                    </div>
                    <div class="list">
                        <a href="question.jsp">���� 1</a>
                        <a style="float: right;" href="user1">��������</a>
                    </div>
                </div>
            </div>
            
            <div>
                <div class="title">
                    <div class="title_sub">
                        <a href="anything.jsp">����� �̾߱�</a>
                    </div>
                </div>
            </div>
            <div>
                <div class="anything">
                    <div class="list">
                        <a href="any.jsp">��� 1</a>
                        <a style="float: right;" href="user1">��������</a>
                    </div>
                    <div class="list">
                        <a href="any.jsp">��� 1</a>
                        <a style="float: right;" href="user1">��������</a>
                    </div>
                    <div class="list">
                        <a href="any.jsp">��� 1</a>
                        <a style="float: right;" href="user1">��������</a>
                    </div>
                    <div class="list">
                        <a href="any.jsp">��� 1</a>
                        <a style="float: right;" href="user1">��������</a>
                    </div>
                    <div class="list">
                        <a href="any.jsp">��� 1</a>
                        <a style="float: right;" href="user1">��������</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

<!-- 
��Ʈ�� ���
@font-face {
    font-family: 'KOTRA_GOTHIC';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/KOTRA_GOTHIC.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

D2Coding ��Ʈ
@font-face {
    font-family: 'D2Coding';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_three@1.0/D2Coding.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

��Ʈ Medium ��Ʈ
@font-face {
    font-family: 'SUIT-Medium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Medium.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

title back color = #FDFFF2

border: solid 3px #FFDD3D;

https://happy-inside.tistory.com/91
-- �α��� �ؾ� �۾��� �Ǵ� �� ����

display: block;
position: fixed;
    
height: 20%;
width: calc(100%-2px);

https://lcw126.tistory.com/156
https://rebro.kr/16?category=325067

display : flex -- middle �ڽ��� flexbox�� �����ϰڴٴ� �ǹ��̴�.

 -->