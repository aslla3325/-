<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1">
<title>;;; - ���</title>
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
    border-bottom: 2px #00CC00 solid;
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
    background-color: #4CE564;
    margin: 10px 0px 0px 0px;
}

.top_menu {
    background-color: #4CE564;
    margin-top: 50px;
    margin-left: 5px; 
}

.middle_menu {
    background-color: #4CE564;
    margin-top: 20px;
    margin-left: 5px; 
}

.bottom_menu {
    background-color: #4CE564;
    margin-top: 50px;
    margin-left: 5px; 
}

.content {
    width: 80%;
    height: 900px;
    float: right;
    background-color: #FDFFF2;
    margin: 10px 0px 0px 0px;
}

.con_menu_font {
    font-family: "Roboto", sans-serif;
    font-weight: bold;
    font-size: 20px;
    margin-left: 25px; 
}

.any_list {
    margin-left: auto;
    margin-right: auto;
    width: 90%;
    height: 80%;
    background-color: #FDFFF2;
}

.list {
    padding: 13px 10px;
    border: 1px solid #FFDD3D;
    border-left: 3px solid #00CC00;
}

a {
    text-decoration: none;
    color: green;
}

.con1 {
    display: flex;
}

.q_button {
    position: relative;
    font-family: "Roboto", sans-serif;
    text-transform: uppercase;
    top: 20px;
    outline: 0;
    background: #00CC00;
    border: 0;
    padding: 10px 17px;
    color: #FFFFFF;
    font-size: 14px;
    -webkit-transition: all 0.3 ease;
    transition: all 0.3 ease;
    cursor: pointer;
}

.q_button:hover,.q_button:active,.q_button:focus {
  background: #43A047;
}


</style>
</head>
<body>
    <header class="headers">
        <a style="color:black;" href="main_css.jsp">;;;</a>
    </header>
    <div>
        <div class="menu">
            <!-- <div class="menu_font">Triple<br/>semicolon</div>  -->
            <div class="menu_font">Menu</div>
            <div class="bottom_menu" style="cursor: pointer;" onclick="location.href='user_page.jsp';">����������</div>
            <div class="top_menu" style="cursor: pointer;" onclick="location.href='gong_menu.jsp';">��������</div>
            <div class="middle_menu" style="cursor: pointer;" onclick="location.href='qna.jsp';">Q & A</div>
            <div class="middle_menu" style="cursor: pointer;" onclick="location.href='anything.jsp';">���</div>
            <div class="middle_menu" style="cursor: pointer;" onclick="location.href='thismonth_a.jsp';">�̴��� Ȱ����</div>
            <div class="bottom_menu" style="cursor: pointer;" onclick="window.open('https://github.com/');">Go to Github</div>
        </div>
        <div class="content">
            <div class="con1">
                <div>
                <h4 class="con_menu_font">����� �̾߱�</h4>
                </div>
                <div style="margin-left: auto; margin-right: 40px;">
                    <button class="q_button" style="cursor: pointer;" onclick="location.href='make_question.jsp';">�۾���</button>
                </div>
            </div>
            <div class="any_list">
                <div class="list">
                    <a href="any.jsp">��� 1</a>
                    <a style="float: right;" href="user1">��������</a>
                </div>
                <div class="list">
                    <a href="any.jsp">��� 2</a>
                    <a style="float: right;" href="user1">��������</a>
                </div>
                <div class="list">
                    <a href="any.jsp">��� 3</a>
                    <a style="float: right;" href="user1">��������</a>
                </div>
                <div class="list">
                    <a href="any.jsp">��� 4</a>
                    <a style="float: right;" href="user1">��������</a>
                </div>
                <div class="list">
                    <a href="any.jsp">��� 5</a>
                    <a style="float: right;" href="user1">��������</a>
                </div>
                <div class="list">
                    <a href="any.jsp">��� 6</a>
                    <a style="float: right;" href="user1">��������</a>
                </div>
                <div class="list">
                    <a href="any.jsp">��� 7</a>
                    <a style="float: right;" href="user1">��������</a>
                </div>
                <div class="list">
                    <a href="any.jsp">��� 8</a>
                    <a style="float: right;" href="user1">��������</a>
                </div>
                <div class="list">
                    <a href="any.jsp">��� 9</a>
                    <a style="float: right;" href="user1">��������</a>
                </div>
                <div class="list">
                    <a href="any.jsp">��� 10</a>
                    <a style="float: right;" href="user1">��������</a>
                </div>
                <div class="list">
                    <a href="any.jsp">��� 11</a>
                    <a style="float: right;" href="user1">��������</a>
                </div>
                <div class="list">
                    <a href="any.jsp">��� 12</a>
                    <a style="float: right;" href="user1">��������</a>
                </div>
                <div class="list">
                    <a href="any.jsp">��� 13</a>
                    <a style="float: right;" href="user1">��������</a>
                </div>
                <div class="list">
                    <a href="any.jsp">��� 14</a>
                    <a style="float: right;" href="user1">��������</a>
                </div>
                <div class="list">
                    <a href="any.jsp">��� 15</a>
                    <a style="float: right;" href="user1">��������</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>