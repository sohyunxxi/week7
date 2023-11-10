<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.Date" %>
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

    //Connector 파일 불러오기
    Class.forName("com.mysql.jdbc.Driver");

    // 데이터베이스 연결
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/week6","Sohyunxxi","1234");


    String sql = "SELECT * FROM user where id = ?";

    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,userName);

        String name = "";
        String id = "";
        String password = "";
        String email = "";
        Date birth = new Date(); 
        int tel = 0;
        String address = "";
        String gender = ""; 

    ResultSet rs = query.executeQuery();
    if (rs.next()) {
        name = rs.getString("name");
        id = rs.getString("id");
        password = rs.getString("pw");
        email = rs.getString("email");
        birth = rs.getDate("birth");
        tel = rs.getInt("tel");
        address = rs.getString("address");
        gender = rs.getString("gender"); 
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
        <div class="headerMenu"><a href="success.jsp">Home</a></div> <!-- 메인 페이지-->
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
            <h1 id="signupBigWord"> Your Info </h1> 
            <span id="signupExplain">If you want to update, click update button. </span>
            
        </div>
        <form name="signupForm" action="signup.jsp">
            <div id="signupBox">
                <div id="signupShouldWrite">
                    <h2 class="signupTextBox"> Your Info</h2>
                    <div>
                    <span class="spanFont">Your Name *</span>
                    <span><%= name %></span>
                    </div>

                    <div>
                    <span class="spanFont">Id *</span> 
                    <span><%= id %></span>
                    </div>

                    <div>
                    <span class="spanFont">Password *</span>
                    <span><%= password %></span>
                    </div>
                    <div>
                    <span class="spanFont">Recovery Email *</span>
                    <span><%= email %></span>
                    </div>
                </div>

                <div id="signupEtc">
                    <h2 class="signupTextBox">Write down If  you want...</h2>
                    <div>
                    <span class="spanFont">Your BirthDay</span>
                    <span><%= birth %></span>
                    </div>
                    <div>
                    <span class="spanFont">Phone Number</span>
                    <span><%= tel %></span>
                    </div>
                    <div>
                    <span class="spanFont">Address</span>
                    <span><%= address %></span>
                    </div>
                    <div>
                    <span class="spanFont">Gender</span>
                    <span><%= gender %></span>
                    </div>
                </div>
               
            </div> 
        
            
        </form>
        <form action="updateUser.jsp"><button class="button" id="updateButton">Update</button></form>
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