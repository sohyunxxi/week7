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



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>create Post</title>
    <link type="text/css" rel="stylesheet" href="createPost.css">
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
            <div id="headerLogin"><%=userName %> 님 </div><!--로그인 페이지-->
                <form action="logout.jsp">
                    <input type=submit value="로그아웃">
                </form> 
                </div>
    </header>
    <main>
        <div id="mainPostMenuCollection">
            <div>
                <a class="mainPostMenus">Categories</a>
                <a class="mainPostMenus">All posts</a>
                <a class="mainPostMenus">My posts</a>
            </div>
            <input id="mainSearchPost" type="text" size="15" maxlength="13" value="Search">
        </div>

        <div id="mainText">
            <h1 class="mainInfoText">Create Post</h1>
            <p  class="mainInfoText">Make a Post to know other members What you are thinking about</p>
        </div>

        <hr class="divideLine">

        <form action="postCheck.jsp">
            <div id="writeBox">
                

                <div id="titleBox">
                    <span> Title </span>
                    <input name="title" id="titleWriteBox" type="text" maxlength="30" length="32">
                </div>
                <div id="onlyMemCheckBox" class="titleFont">
                    <span> Only members</span>
                    <div id="checkBoxText">
                        <input type="checkbox"> Only members can read
                    </div>
                </div>
            <div id="writeContentBox">
                <span id="contentTitle">Content</span>
                <textarea name="content" cols="105" rows="45"></textarea>
            </div>
            <div id="buttonBox">
                <button class="mainCreatePostButton">Post</button></form>
                <form action="success.jsp"><button class="mainCreatePostButton">cancel</button></form>
            </div>
        </div>
 

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
</html>