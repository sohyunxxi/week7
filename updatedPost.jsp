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
    ResultSet postSet = null;
    if (userName==null){
        response.sendRedirect("signIn.html");
    }
    
    
    String id = (String) session.getAttribute("username");
    int userIdx = -1;
    // 데이터베이스 연결
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/week6", "Sohyunxxi", "1234");

    // 'user' 테이블에서 'name'에 해당하는 'idx' 값을 가져옴
    String userSql = "SELECT idx FROM user WHERE id=?";
    PreparedStatement userQuery = connect.prepareStatement(userSql);
    userQuery.setString(1, id);
    ResultSet userResult = userQuery.executeQuery();
    
    
    if (userResult.next()) {
        userIdx = userResult.getInt("idx");
    }

    String postSql = "SELECT title,content FROM post WHERE title=? ORDER BY idx DESC LIMIT 1";
    PreparedStatement postQuery = connect.prepareStatement(postSql);
    postQuery.setString(1, title);
    postSet = postQuery.executeQuery();
    String postTitle ="";
    String postContent = "";

    if (postSet.next()) {
        postTitle = postSet.getString("title");
        postContent = postSet.getString("content");
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
            <h1 name = "title" class="mainInfoText"> <%=postTitle %> </h1>
            <p  class="mainInfoText">Author :</p>
            <span name="author"><%=userName %> </span>
        </div>

        <hr class="divideLine">

        <div id="writeBox">

            <div id="writeContentBox">
                <span id="contentTitle">Content</span>
                <textarea cols="105" rows="45"><%=postContent %> </textarea>
            </div>
            <div id="buttonBox">
                <form action="updatePost.jsp"><button class="mainCreatePostButton">수정하기</button></form>
                <form action="success.jsp"><button class="mainCreatePostButton">뒤로가기</button></form>
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