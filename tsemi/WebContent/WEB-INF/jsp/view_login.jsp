<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="q" uri="http://java.sun.com/jsp/jstl/core"%>   
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<style type="text/css">

@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.backcolor {
  background-color: #4CE564;
  width: 360px;
  padding: 8% 0 0;
  margin: 100px auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  border-radius: 5px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}

.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #00CC00;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}

.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}


.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}

.form .message a {
  color: #4CAF50;
  text-decoration: none;
}

body {
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}

.dot_parent{
  font-family: "Roboto", sans-serif;
  color: #43A047;
  font-size: 8px;
  margin: 0 0 13px 0;
  font-weight: bold;
  
  height: 3em; /* 애니메이션 높이 */
  overflow-y: hidden;
  display: block;
}

.dot_parent .dot_child{
  font-size: 3em;/* 애니메이션 높이 */
  font-weight: bold;
  line-height: 0.85;
  animation-name: grow;
  animation-duration: 1s;/* 애니메이션 시간 */
}

@keyframes grow {
    from { transform: translateY(3em) }/* 애니메이션 높이 */
    to { transform: translateY(0) }
}
</style>
<script>
<q:choose>
	<q:when test="${ecode eq \"login_fail\"}">
		alert("해당 아이디나 비밀번호가 없습니다");
	</q:when>
	<q:when test="${ecode eq \"join_success\"}">
		alert("회원가입이 완료되었습니다. 다시 로그인 해주세요");
	</q:when>
	<q:when test="${ecode eq \"need_login\"}">
		alert("로그인이 필요합니다");
	</q:when>
</q:choose>

function Checkform() { 
	if( frm.username.value == "" ) {
		frm.username.focus();
		alert("아이디를 입력해주세요.");
		return false;
	} 
	
	if( frm.password.value == "" ) {
		frm.password.focus();
		alert("비밀번호를 입력해주세요.");
		return false;
	}
}
</script>
</head>
<body class="backcolor">
    <div class="dot_parent"><div class="dot_child">Triple_semicolon.login</div></div>
    <div class="form">
        <form class="login-form" method="POST" action="login_add.do" name="frm" onSubmit="return Checkform()">
           <input type="text" placeholder="username" name="username"/>
           <input type="password" placeholder="password" name="password"/>
           <!-- onclick 오류 났을 때 type="button" 넣어주기 -->
           <button type="submit">LOGIN</button>
           <p class="message">Not registered? <a href="join.do">Create an account</a></p>
        </form>
    </div>
</body>
</html>

<!-- 


.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}



연두색 : #4CE564 
https://feeldesigner.tistory.com/259
 -->