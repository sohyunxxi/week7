<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import =  "java.sql.Timestamp" %>

<%
    request.setCharacterEncoding("utf-8");

    //세션 로그인
    String userName = (String)session.getAttribute("username");
    String pwValue = request.getParameter("pw_value");
    ResultSet postSet = null;
    if (userName==null){
        response.sendRedirect("signIn.html");
    }
    
    

    int userIdx = 0;
    String username = "";
    String title = "";
    String content="";
   
    int postIdx = 0;
    String postIdxStr = request.getParameter("post_id");
    if (postIdxStr != null && !postIdxStr.isEmpty()) {
    postIdx = Integer.parseInt(postIdxStr);
    }

int commentIdx = 0;
String commentIdxStr = request.getParameter("comment_idx");
if (commentIdxStr != null && !commentIdxStr.isEmpty()) {
    commentIdx = Integer.parseInt(commentIdxStr);
}

  

    //db 연결
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/week6", "Sohyunxxi", "1234");
    String sql = "SELECT * FROM comment WHERE idx=?";
    PreparedStatement query = connect.prepareStatement(sql);

    query.setInt(1,commentIdx);

        //query 전송
    ResultSet rs = query.executeQuery();
    Timestamp createTime =null;
    Timestamp updateTime =null;

    if(rs.next()){
        createTime = rs.getTimestamp("created_at");
        updateTime = rs.getTimestamp("updated_at");
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
            <span name="author"><%=createTime %> </span>
            <p  class="mainInfoText">수정된시간 :</p>
            <span name="author"><%=updateTime %> </span>

        </div>

        <hr class="divideLine">

        <div id="writeBox">

            <div id="writeContentBox">
                <div id="postContent"><%=content %></div>
            </div>
            <hr class="divideLine">
          
            <div id="buttonBox">
                <form action="checkUpdate.jsp">
                    <button class="mainCreatePostButton">수정하기</button>


                </form>
                <form action="success.jsp"><button class="mainCreatePostButton">뒤로가기</button></form>
            </div>
            <form action="finishUpdateComment.jsp">
            <input type="text" name="updatedComment" length="102" maxlength="100">
            <button>수정완료</button>
            <input type="hidden" name="finalComment" value="<%= commentIdx %>">
            </form>

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