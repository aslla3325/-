<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1">
<title>;;; - Q & A</title>
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
    height: auto;
    float: left;
    background-color: #dcdcdc;
    margin: 10px 0px 0px 0px;
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

.wrapper {
  display: flex;
  ovreflow: hidden;
}

.content {
    width: 80%;
    height: 900px;
    float: right;
    background-color: #f8f8f8;
    margin: 10px 0px 0px 0px;
}

.con_menu_font {
    font-family: "Roboto", sans-serif;
    font-weight: bold;
    font-size: 20px;
    margin-left: 25px; 
    margin-right: 25px;
}

.qna_list {
    margin-top: 35px;
    margin-left: 25px;
    margin-right: 25px;
    height: auto;
    border: 3px solid #FFDD3D;
    padding: 30px 25px 30px 25px;
}

.qna_back {
    margin: 25px;
    width: 94%;
}

.qna_ans {
    margin-top: 60px;
    margin-left: 25px;
    margin-right: 25px;
    border: 2px solid #00CC00;
    height: auto;
    padding: 30px 25px 30px 25px;
}

a {
    text-decoration: none;
    color: green;
}

.ans_button {
	position: relative;
	font-family: "Roboto", sans-serif;
	text-transform: uppercase;
	outline: 0;
	background: #00CC00;
	left: 25px; 
	top: 150px;
	border: 0;
	padding: 10px 40px 10px 40px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.line {
    margin: 150px 25px 0px 25px;
    background-color: #00CC00;
    border: solid 2px #00CC00;
}

</style>
</head>
<body>
    <header class="headers" style="cursor: pointer;" onclick="location.href='main_css.jsp';">;;;</header>
    <div class="wrapper">
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
            <h4 class="con_menu_font">html ���� div �� �̿��Ͽ� ��¼�� ��¼�� �̷��� ������ ���ڼ��� ��û ��� ���� ��� �ɱ�� �ڵ� ������ �ɱ��</h4>
            <div class="qna_list">
                ��... ������ ���<br/>
                ��... ��¥ ��εǳ�<br/>
                �̰� �³�...<br/>
                ���� ������������ ��� ��� ���ٷ� �ڵ��ϼ��� �� ������ �ñ��ϳ� ��� ��Ʈ�� ���ؾ��ϰ� �̰����� �ǵ���� �ϴ� ���� ������ �̰� �´��� �� �𸣰ڱ� �߸ŷ� ����ٺ��� ���� �ǰ��� �ϴ� ������ �ְ� �׷��� ��ĸ�~
                <br/>
                dkdkdkd
                <br/>
                testeststste
                <br/>
            </div>
            <button class="ans_button">�亯 ����</button>
            <hr class="line" noshade>
            <div class="qna_ans">
                <div>
                    �亯 ����<br/>
                    �亯 ��Ź<br/>
                    ���� ����<br/>
                    �亯���� ��� ���� �� ����<br/>
                    �Ƹ���?<br/>
                </div>
            </div>
            <div class="qna_back"  style="text-align: center;">
                <a href="qna.jsp">������� ���ư���</a>
            </div>
        </div>
    </div>
</body>
</html>