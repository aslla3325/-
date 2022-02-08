<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1">
<title>;;; - ��������</title>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
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

.menu_font {
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: bold;
    font-size: 17px;
    margin-left: 7px; 
    color: #0D5718;
}

.menu {
    width: 20%;
    height: auto;
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

.content {
    width: 80%;
    height: auto;
    float: right;
    background-color: #FDFFF2;
    margin: 10px 0px 0px 0px;
}

.con_menu_font {
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: bold;
    font-size: 20px;
    margin-left: 30px; 
}

.gong_list {
    margin-left: 30px;
    margin-right: 30px;
    height: 800px;
    border: 5px solid #FFDD3D;
    border-radius: 8px;
    font-family: 'Noto Sans KR', sans-serif;
}

.gong_con {
    padding: 20px;
}

.gong_back {
    margin: 25px 25px 40px 25px;
    width: 94%;
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
    border-radius: 5px;
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
            <!-- <div class="bottom_menu" style="cursor: pointer;" onclick="location.href='user_page.jsp';">����������</div> -->
            <div style="background-color: green;">
                <div class="point_menu" style="cursor: pointer; margin-top: 40px;" onclick="location.href='gong_menu.jsp';">��������</div>
            </div>
            
            <div class="middle_menu menu_font" style="cursor: pointer;" onclick="location.href='qna.jsp';">Q & A</div>
            <div class="middle_menu menu_font" style="cursor: pointer;" onclick="location.href='anything.jsp';">���</div>
            <div class="middle_menu menu_font" style="cursor: pointer;" onclick="location.href='thismonth_a.jsp';">�̴��� Ȱ����</div>
            <div class="bottom_menu menu_font" style="cursor: pointer;" onclick="window.open('https://github.com/');">Go to Github</div>
        </div>
        <div class="content">
            <h4 class="con_menu_font">���� 1</h4>
            <div class="gong_list">
                <div class="gong_con">
                    �� ������ ��ΰ��<br/>
                    ª�� ���� ���� ª�� ��Ÿ���� <br/>
                    �� ���� ���� ��� ��Ÿ���� <br/>
                    �׷��� ������ �����ϸ�<br/>
                    ���� ���� �����!?<br/>
                    �׷��� height �� 500px �� �ϰ�<br/>
                    �߰��Ǵ� ���̴� auto �� �����ϰ� ������ �װԾȵǳ�<br/>
                    �� �ȵɱ�?? why~? auto ������ �����ϸ� �����ٵ�~~<br/>
                </div>
            </div>
            <div class="gong_back"  style="text-align: center; font-family: 'Noto Sans KR', sans-serif;">
                <a href="gong_menu.jsp">������� ���ư���</a>
            </div>
        </div>
    </div>
</body>
</html>