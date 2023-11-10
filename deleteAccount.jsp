<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
    request.setCharacterEncoding("utf-8");
    String userName = (String)session.getAttribute("username");
    String pwValue = request.getParameter("pw_value");
    if (userName==null){
        response.sendRedirect("signIn.html");
    }
    
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 성공</title>
    <link type="text/css" rel="stylesheet" href="aboutUser.css">
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
            <div id="headerLogin"><a href="aboutUser.jsp"><%=userName %> 님</a> </div><!--로그인 페이지-->
                <form action="logout.jsp">
                    <input type=submit value="로그아웃">
                </form>
            
        </div>   
    </header>
    <main>
        <div id="signupWordBox">
            <h1 id="signupBigWord"> Are you Sure? </h1> 
            <span id="signupExplain">If you really want to delete your account, click bye button. </span>
        </div>
        <form name="signupForm" action="aboutUser.jsp" >
            
               
        </div> 
        <input type="submit" class="button" value="No, i will keep my account." >
        
        
    </form>
        <form name="signupForm" action="delete.jsp" >
            
               
            </div> 
            <input type="submit" class="button" value="Bye" >
            
            
        </form>
        <!-- <img src="back.png"> -->
        
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
    <script src="signup.js"></script>
</body>
    
</html>