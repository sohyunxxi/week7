<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign in</title>
    <link type="text/css" rel="stylesheet" href="signIn.css">
</head>
<body>
    <header>
        <div class="headerMenu">Home</div> <!-- 메인 페이지-->
        <div class="headerMenu">Groups</div> <!-- 그룹 가입-->
        <div class="headerMenu">About</div>  <!-- 이 페이지 설명, 규칙-->
        <div class="headerMenu">Contact</div> <!-- 도움, 이름 이메일 페이지 -->
        <div class="headerMenu">Members</div> <!--로그인 안 한 페이지 만들기 -> 로그인 해서 확인-->
        <div id="headerLoginBox">
            <img id="headerLoginIcon" src="userIcon.png">
            <div id="headerLogin">Log In</div> <!--로그인 페이지-->
        </div>   
    </header>

    <main> 
        
        <div id="signupWordBox"> 
            <h1 id="signupBigWord"> Forgot Password </h1> 
            <span id="signupLittleWord">Insert your Id and recover email.</span>
        </div>
        <form name="signInForm"  action="findPw.jsp" >
            <div id="signupEtc">
                <span>Id</span>
                <input class="inputBox" name="id" type="text" length="50" maxlength="48">
                <span>Recovery email</span>
                <input class="inputBox" name="email" type="text" length="50" maxlength="48">
        
            </div>
            
            <button id="signupButton"> submit</button>
        </form>
        
    </main>

    <footer>
        <div>
            <div id="footerIconBox">
                <img class="footerIcon" src="faceBookLogo.png">
                <img class="footerIcon" src="youtubeLogo.png">
                <img class="footerIcon" src="twitterLogo.png">
                <img class="footerIcon" src="instagramLogo.png">
            </div>
            <span id="footerCopyright">ⓒ 2023 by IT Astronaut</span>
        </div>
        <div id="footerSubscribeBox">
            <span id="footerSubscribeInfo">Subscribe our updates & news!</span>
            <input id="footerSubscribeInput" type = "text" size="50" maxlength="48">
            <button id="footerSubscribeButton">Subscribe</button>
        </div>
    </footer>

</body>
    <!-- <script src="signin.js"></script> -->
</html>