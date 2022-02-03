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

html, body {
    margin: 0;
    padding: 0;
}

.headers {
    font-family: 'Hanna', fantasy;
    font-size: 40px;
    margin: 0 10px;
    height: 50px;
    border-bottom: 2px #f0f0f0 solid;
}

.menu_font {
    font-family: "Roboto", sans-serif;
    font-weight: bold;
    font-size: 20px;
    margin-left: 5px; 
}

.menu {
    width: 20%;
    height: 900px;
    float: left;
    background-color: #dcdcdc;
    margin: 10px 0px 0px 0px;
    
}

.content {
    width: 80%;
    height: 900px;
    float: right;
    background-color: #f8f8f8;
    margin: 10px 0px 0px 0px;
}

.con1 {
    display: flex;
}

.gong {
    margin: 20px 5px 0px 5px;
    width: 49%;
    height: 200px;
    background-color: #d0a9f5;
}

.thismonth {
    margin-top: 20px;
    width: 49%;
    height: 200px;
    background-color: pink;
}

.title {
    margin: 15px 5px 5px 5px;
    background-color: skyblue;
    height: 60px;
    width: 99%;
}

.title_sub {
    padding: 20px 10px;
}

.title_sub2 {
    padding: 5px 10px;
}

.question {
    margin: 0px 5px 0px 5px;
    background-color: #f8f8f8;
    height: 250px;
    width: 99%
}

.anything {
    margin: 0px 5px 0px 5px;
    background-color: #f8f8f8;
    height: 250px;
    width: 99%
}

.top_menu {
    background-color: #dcdcdc;
    margin-top: 50px;
    margin-left: 5px;
}

.middle_menu {
    background-color: #dcdcdc;
    margin-top: 20px;
    margin-left: 5px;
}

.bottom_menu {
    background-color: #dcdcdc;
    margin-top: 50px;
    margin-left: 5px;
}

.list {
    background-color: yellow;
    padding: 13px 10px;
    border: 1px solid lightgray;
}

.list_top {
    background-color: yellow;
    padding: 9.7px 10px;
    border: 1px solid lightgray;
}

a {
    text-decoration: none;
    color: green;
}

</style>
</head>
<body>
    <header class="headers" style="cursor: pointer;" onclick="location.href='main_css.jsp';">;;;</header>
    <div>
        <div class="menu">
            <!-- <div class="menu_font">Triple<br/>semicolon</div>  -->
            <div class="menu_font">Menu</div>
            <div class="top_menu" style="cursor: pointer;" onclick="location.href='gong_menu.jsp';">��������</div>
            <div class="middle_menu" style="cursor: pointer;" onclick="location.href='qna.jsp';">Q & A</div>
            <div class="middle_menu" style="cursor: pointer;" onclick="location.href='anything.jsp';">���</div>
            <div class="middle_menu" style="cursor: pointer;" onclick="location.href='thismonth_a.jsp';">�̴��� Ȱ����</div>
            <div class="bottom_menu" style="cursor: pointer;" onclick="window.open('https://github.com/');">Go to Github</div>
        </div>
        <div class="content">
            <div class="con1">
                <div class="gong">
                    <div class="title_sub2" style="cursor: pointer;" onclick="location.href='gong_menu.jsp';">��������</div>
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
                    <div class="title_sub2" style="cursor: pointer;" onclick="location.href='thismonth_a.jsp';">�̴��� ��¼��</div>
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
                <div class="title_sub" style="cursor: pointer;" onclick="location.href='qna.jsp';">����</div>
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
                    <div class="title_sub" style="cursor: pointer;" onclick="location.href='anything.jsp';">����� �̾߱�</div>
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