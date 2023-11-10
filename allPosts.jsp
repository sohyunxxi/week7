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
%>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 목록</title>
    <link type="text/css" rel="stylesheet" href="allPosts.css">
</head>
<body>
    <header>
    <div class="headerMenu"><a href="index.html">Home</a></div> <!-- 메인 페이지-->
    <div class="headerMenu">Groups</div> <!-- 그룹 가입-->
    <div class="headerMenu">About</div>  <!-- 이 페이지 설명, 규칙-->
    <div class="headerMenu">Contact</div> <!-- 도움, 이름 이메일 페이지 -->
    <div class="headerMenu">Members</div> <!--로그인 안 한 페이지 만들기 -> 로그인 해서 확인-->
    <div id="headerLoginBox">
        <img id="headerLoginIcon" src="userIcon.png">
        <div id="headerLogin"><a href="aboutUser.jsp"><%=userName %> 님 </a></div><!--로그인 페이지-->
            <form action="logout.jsp">
                <input type=submit value="로그아웃">
            </form> 
            </div>
    </header>
    <main>
        <div id="mainText">
            <h1 class="mainInfoText">회원 게시글 목록</h1>
            <p  class="mainInfoText">자유롭게 의견을 남겨보세요.<br>◌규정을 침해하는 글은 삭제될 수 있습니다.</p>
        </div>
        <form action="createPost.jsp">
            <button id="mainCreatePostButton" >Create Post</button>
        </form>

    <%

        request.setCharacterEncoding("utf-8");

        try {
            Class.forName("com.mysql.jdbc.Driver");

            // 데이터베이스 연결
            Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/week6","Sohyunxxi","1234");

            String sql = "SELECT post.idx AS post_id, user.id AS user_id, post.title, post.content, post.created_at " +
                         "FROM post " +
                         "JOIN user ON post.user_idx = user.idx " +
                         "ORDER BY post.created_at DESC";

            PreparedStatement query = connect.prepareStatement(sql);
            ResultSet rs = query.executeQuery();
            %>
            <div id="postOuterBox">
            <% while (rs.next()) {
                %>
                <div class="postBox">
                    <form action="memberPostView.jsp" method="GET">
                        <input type="hidden" name="post_id" value="<%= rs.getString("post_id") %>">
                        <p>
                            제목: <%= rs.getString("title") %><br>
                            작성자: <%= rs.getString("user_id") %><br>
                            작성 시간: <%= rs.getTimestamp("created_at") %><br>
                            <button type="submit">게시물 보기</button>
                        </p>
                    </form>
                </div>
            <%
            }
            %>
            </div>
            <%

        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
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
