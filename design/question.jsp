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
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);


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
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: bold;
    font-size: 17px;
    margin-left: 7px; 
    color: #0D5718;
}


.menu {
    width: 20%;
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

.bottom_menu {
    background-color: #4CE564;
    margin-top: 50px;
    margin-left: 5px; 
}

.wrapper {
  display: flex;
  ovreflow: hidden;
}

.content {
    width: 80%;
    float: right;
    background-color: #FDFFF2;
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
    border-radius: 8px;
}

.qna_back {
    margin: 25px 25px 40px 25px;
    width: 94%;
}

.qna_ans_main {
    margin-top: 60px;
    margin-left: 25px;
    margin-right: 25px;
    border: 2px solid #00CC00;
    border-radius: 8px;
    height: auto;
    /* padding: 30px 25px 30px 25px; */
}

.qna_ans_user {
    padding: 5px 15px 15px 15px;
    height: auto;
}

a {
    text-decoration: none;
    color: green;
}

.ans_button {
    border-radius: 5px;
	position: relative;
	font-family: "Roboto", sans-serif;
	text-transform: uppercase;
	outline: 0;
	background: #00CC00;
	float: right;
	right: 28px; 
	top: auto;
	bottom: auto;
	border: 0;
	padding: 10px 40px 10px 40px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.ans_button:hover,.ans_button:active,.ans_button:focus {
    background: #43A047;
}

.textarea_out {
    margin-left: 25px;
    margin-right: 25px;
    margin-top: 120px;
    border-radius: 8px;
    background: #FDFFF2;
    border: 2px solid #00CC00; 
}

.textarea {
    width: 95%;
    margin: 5px;
    background: #FDFFF2;
    border: none;
    font-size: 15px;
    resize: none;
}

.textarea:active, .textarea:focus{
    outline: none;
}

.photo {
    border: 1px solid #FFDD3D;
    border-radius: 50%;
    height: 50px;
    width: 50px;
}

.user {
    margin-top: 15px;
    margin-left: 10px;
}

</style>
</head>
<body>
    <header class="headers">
        <a style="color:black;" href="main_css.jsp">;;;</a>
    </header>
    <div class="wrapper">
        <div class="menu" style="height: auto;">
            <!-- <div class="menu_font">Triple<br/>semicolon</div>  -->
            <div class="menu_font"></div>
            <!-- <div class="bottom_menu menu_font" style="cursor: pointer;" onclick="location.href='user_page.jsp';">����������</div> -->
            <div class="top_menu menu_font" style="cursor: pointer;" onclick="location.href='gong_menu.jsp';">��������</div>
            <div style="background-color: green;">
                <div class="point_menu" style="cursor: pointer;" onclick="location.href='qna.jsp';">Q & A</div>
            </div>
            <div class="middle_menu menu_font" style="cursor: pointer;" onclick="location.href='anything.jsp';">���</div>
            <div class="middle_menu menu_font" style="cursor: pointer;" onclick="location.href='thismonth_a.jsp';">�̴��� Ȱ����</div>
            <div class="bottom_menu menu_font" style="cursor: pointer;" onclick="window.open('https://github.com/');">Go to Github</div>
        </div>
        <div class="content" style="height: auto;">
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
            
            
            <div class="textarea_out" style="padding: 10px;">
                <textarea class="textarea" id="abcd" name="ans" rows="7"></textarea>
            </div>
            <div>
                <button class="ans_button">�亯 �����</button>
            </div>

            <!-- <hr class="line" noshade> -->
            <div class="qna_ans_main">
                <div class="qna_ans_user" style="display: flex;">
                    <img src="images/ts.png" class="photo">
                    <div class="user" style="font-size: 18px;">�����</div>
                    <div class="user" style="font-size: 12px; margin-top: 18px;">time</div>
                </div>
                <div style="padding: 15px 25px 30px 25px;">
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

<!-- 
�����..
https://stickode.com/detail.html?no=1640&comment=undefined


 -->