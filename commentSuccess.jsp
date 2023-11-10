<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
    request.setCharacterEncoding("utf-8");

    //세션 로그인
    String userName = (String)session.getAttribute("username");
    String pwValue = request.getParameter("pw_value");
    ResultSet postSet = null;
    if (userName==null){
        response.sendRedirect("signIn.html");
    }
    
    
    int postIdx = Integer.parseInt(request.getParameter("postIdx"));
    int userIdx = 0;
    String username = "";
    String title = "";
    String content="";
   


    //db 연결
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/week6", "Sohyunxxi", "1234");

    //idx를 이용해서 해당 포스트 내용 가져오기
    String postSql = "SELECT * FROM post WHERE idx=?";
    PreparedStatement postQuery = connect.prepareStatement(postSql);
    postQuery.setInt(1, postIdx);
    ResultSet postResult = postQuery.executeQuery();

    if (postResult.next()) { // Move to the first row
        userIdx = postResult.getInt("user_idx");
        title = postResult.getString("title");
        content = postResult.getString("content");
    }

    // 유저 테이블에서 이름에 해당하는 idx 값을 가져옴
    String userSql = "SELECT id FROM user WHERE idx=?";
    PreparedStatement userQuery = connect.prepareStatement(userSql);
    userQuery.setInt(1, userIdx);
    ResultSet userResult = userQuery.executeQuery();
    
    
    if (userResult.next()) {
        username = userResult.getString("id");
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
            <h1 name = "title" class="mainInfoText"> <%=title %> </h1>
            <p  class="mainInfoText">Author :</p>
            <span name="author"><%=username %> </span>
            <p  class="mainInfoText">작성시간 :</p>
            <span name="author"><%=postResult.getTimestamp("created_at") %> </span>
            <p  class="mainInfoText">수정된시간 :</p>
            <span name="author"><%=postResult.getTimestamp("updated_at") %> </span>

        </div>

        <hr class="divideLine">

        <div id="writeBox">

            <div id="writeContentBox">
                <div id="postContent"><%=content %></div>
            </div>
            <hr class="divideLine">
            <form action="leaveComment.jsp">
            <input type="text" name="comment" length="102" maxlength="100">
            <input type="hidden" name="user" value="<%= postResult.getInt("user_idx") %>">
            <input type="hidden" name="post_idx" value="<%= postResult.getInt("idx") %>">
            <button >댓글등록</button>
            </form>
            <div id="buttonBox">
                <form action="checkUpdate.jsp">
                    <button class="mainCreatePostButton">수정하기</button>
                    <input type="hidden" name="post_id" value="<%= postResult.getInt("idx") %>">
                </form>
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