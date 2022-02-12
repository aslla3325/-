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

/* 헤더 부분 */
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
    float: left;
    background-color: #4CE564;
    margin: 10px 0px 0px 0px;
    border-radius: 0 10px 0 0;
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
    font-family: 'Noto Sans KR', sans-serif;
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
    border: 4px solid #FFDD3D;
    padding: 30px 25px 30px 25px;
    border-radius: 8px;
    font-family: 'Noto Sans KR', sans-serif;
}

.qna_back {
    margin: 25px 25px 40px 25px;
    width: 94%;
    font-family: 'Noto Sans KR', sans-serif;
}

.qna_ans_main {
    margin-top: 60px;
    margin-left: 25px;
    margin-right: 25px;
    border: 3.5px solid #00CC00;
    font-family: 'Noto Sans KR', sans-serif;
    border-radius: 8px;
    height: auto;
    /* padding: 30px 25px 30px 25px; */
}

.qna_ans_user {
    padding: 5px 15px 15px 15px;
    height: auto;
}

/* 목록으로 돌아가기 */
a {
    text-decoration: none;
    color: green;
}

.ans_button {
    border-radius: 5px;
	position: relative;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	text-transform: uppercase;
	outline: 0;
	background: #00CC00;
	float: right;
	right: 28px; 
	top: auto;
	bottom: auto;
	border: 0;
	padding: 10px 35px 10px 35px;
	color: #FFFFFF;
	font-size: 15px;
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
    font-family: 'Noto Sans KR', sans-serif;
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
    font-family: 'Noto Sans KR', sans-serif;
    
}

/* 로그아웃 버튼 */
.logout {    
    margin-top: 21px;
    margin-right: 10px;
    /* margin-left: auto; */
    /* float: right; */
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

.title_time {
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 13px;
    margin-left: 25px;
    margin-top: 10px;
    color: gray;
}

.textarea::-webkit-scrollbar {
    background-color: #FDFFF2;
}


.textarea::-webkit-scrollbar-thumb {
    background-color: #00CC00;
    border-radius: 10px;
    background-clip: padding-box;
    border: 5px solid transparent;
}

.textarea::-webkit-scrollbar-track {
    background-color: #FDFFF2;
}

/* 삭제 css */
.delete {
    margin-left: 25px;
    margin-top: 20px;
    padding: 2px 10px 2px 10px;
    font-family: 'Noto Sans KR', sans-serif;
    color: gray;
    cursor: pointer;
    font-weight: bold;
    border: 2px solid gray;
    border-radius: 5px;
    background: none;
}


.wow {
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 14px;
    margin-left: 0px;
    margin-top: 30px;
    border: 2px solid #FFDD3D;
    padding: 2px 20px 2px 20px;
    border-radius: 5px;
    background: none;
    cursor: pointer;
    font-weight: bold;
    color: gray;
}

.wow:hover,.wow:active,.wow:focus {
    background: #FFDD3D;
    color: #FFFFFF;
}

.wow_ans {
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 14px;
    margin-left: 25px;
    margin-top: auto;
    margin-bottom: 20px;
    border-radius: 5px;
    border: 2px solid #00CC00;
    background: none;
    padding: 2px 20px 2px 20px;
    cursor: pointer;
    color: green;
    font-weight: bold;
}

.wow_ans:hover,.wow_ans:active,.wow_ans:focus {
    background: #43A047;
    color: #FFFFFF;
}

.con1 {
    display: flex;
}

.hi {
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 17px;
    margin-top: auto;
    margin-bottom: 5px;
    margin-left: auto;
    font-weight: bold;
    color: #0D5718;
}

</style>
</head>
<body>
    <!-- con1 추가, a의 style 추가, hi class 추가, logout class 변경, username div 추가 -->
    <header class="headers con1">
        <a style="color: #0D5718; margin-left: 10px; margin-top: auto; font-size: 50px;" href="main_css.jsp">;;;</a>
        <div class="hi" style="margin-top: auto;">
            Hi username
            <button style="color: #0D5718; margin-left: 15px;" class="logout">로그아웃</button>
        </div>
    </header>
    <div class="wrapper">
        <div class="menu" style="height: auto;">
            <!-- <div class="menu_font">Triple<br/>semicolon</div>  -->
            <div class="menu_font"></div>
            <div style="position:sticky; top:50px;">
                <div class="bottom_menu menu_font" style="cursor: pointer;" onclick="location.href='user_page.jsp';">마이페이지</div>
            
                <div class="top_menu menu_font" style="cursor: pointer;" onclick="location.href='gong_menu.jsp';">공지사항</div>
                <div style="background-color: green;">
                    <div class="point_menu" style="cursor: pointer;" onclick="location.href='qna.jsp';">Q & A</div>
                </div>
                <div class="middle_menu menu_font" style="cursor: pointer;" onclick="location.href='anything.jsp';">잡담</div>
                <div class="middle_menu menu_font" style="cursor: pointer;" onclick="location.href='thismonth_a.jsp';">이달의 활동왕</div>
                <div class="bottom_menu menu_font" style="cursor: pointer;" onclick="window.open('https://github.com/');">Go to Github</div>
            </div>
        </div>
        <div class="content" style="height: auto;">
        
            <!-- if user==운영자, 작성자 삭제 표시 -->
            <button class="delete" onclick="삭제가되어야겠지...">삭제</button>
            
            <div>
                <h4 class="con_menu_font" style="margin-bottom: 5px;">html 에서 div 를 이용하여 어쩌구 저쩌구 이러쿵 저러쿵 글자수가 엄청 길면 과연 어떻게 될까용 자동 두줄이 될까용</h4>
                <div style="display: flex;">                    
                    <div class="title_time" style="font-size: 13px; font-weight: bold;">사용자</div>
                    <div class="title_time" style="font-size: 12px; margin-left: 5px; margin-top:auto; color: gray;">time</div>
                    <div style="display: flex;">
                        <div class="title_time" style="font-size: 12px; margin-left: 10px; margin-top:auto; color: gray;">조회수 3</div>
                        <!-- <div class="user" style="font-size: 12px; margin-top: 20px; margin-left: 5px; color: gray;">2</div>  조회수 숫자.. 따로 빼야하나?.. -->
                    </div>
                </div>
            </div>            
            
            <div class="qna_list">
                음... 디자인 고민<br/>
                와... 진짜 고민되네<br/>
                이게 맞나...<br/>
                과연 질문란에서도 길게 적어도 두줄로 자동완성이 될 것인지 궁금하네 사실 폰트도 정해야하고 이것저것 건드려야 하는 것은 많은데 이게 맞는지 잘 모르겠군 야매로 만들다보면 어찌 되겠지 하는 마음도 있고 그렇군 흠냐링~
                <br/>
                dkdkdkd
                <br/>
                testeststste
                <br/>
                
                <!-- 추천버튼 근데이제 숫자를 곁들인 .. 이렇게 해도 될까나?  -->
                <button class="wow" onclick="추천이되어야겠지..">좋은질문이네요! 5</button>
            </div>
            
            <div class="textarea_out" style="padding: 10px;">
                <textarea class="textarea" id="abcd" name="ans" rows="7"></textarea>
            </div>
            <div>
                <button class="ans_button">답변 남기기</button>
            </div>

            <!-- <hr class="line" noshade> -->
            <div class="qna_ans_main">
                <div>
                    <div style="display: flex;">
                        <div class="qna_ans_user" style="display: flex;">
	                        <img src="images/ts.png" class="photo">
	                        <div class="user" style="font-size: 18px; font-weight: bold;">사용자</div>
	                        <div class="user" style="font-size: 12px; margin-top: 20px; color: gray;">time</div>
	                        
	                    </div>
                        
                        <!-- 댓글삭제 사용자, 운영자만 보이게..-->
                        <button class="delete" style="margin-left: auto; margin-bottom: 25px; margin-right: 20px;">삭제</button>
                    </div>
                    
	                <div style="padding: 15px 25px 25px 25px;">
	                    답변 공간<br/>
	                    답변 부탁<br/>
	                    여기 위에<br/>
	                    답변적는 어떠한 공간 들어갈 예정dmdkddmsfmmsf ewnonawgneowgnegn jimqmewqv me oiwvjjqiwo jimqmewqvmeoiwvjjqiwo w oeinvwenoinwgo inowangwngeoiaw ngoengonweon<br/>
	                    아마도?<br/>
	                </div>
	                
	                <!-- 추천 버튼  -->
                    <button class="wow_ans" onclick="추천이되어야겠지..">좋은답변이네요! 5</button>
                </div>
            </div>
            <div>
            
            </div>
            <div class="qna_back"  style="text-align: center;">
                <a href="qna.jsp">목록으로 돌아가기</a>
            </div>
        </div>
    </div>
</body>
</html>

<!-- 
댓글폼..
https://stickode.com/detail.html?no=1640&comment=undefined


 -->