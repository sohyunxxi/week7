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
    <link type="text/css" rel="stylesheet" href="success.css">
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
        <div id="mainPostMenuCollection">
            <div>
                <a class="mainPostMenus">Categories</a>
                <a class="mainPostMenus" href="allPosts.jsp">All posts</a>
                <a class="mainPostMenus">My posts</a>
            </div>
            <input id="mainSearchPost" type="text" size="15" maxlength="13" value="Search">
        </div>
        <div id="mainText">
            <h1 class="mainInfoText">Our posts!</h1>
            <p  class="mainInfoText">Explore to see what you can do, or head to Settings to start managing your Categories.</p>
        </div>

        <form action="createPost.jsp">
            <button id="mainCreatePostButton" >Create Post</button>
        </form>

        <div id="mainPostCollection">

            <div class="mainPost"> 
                <img class="mainPostImgSize" src="computerImg.jpg">
                <div>
                    <div class="mainPostTitleFollow">
                        <a class="mainPostTitle">How to use our computer smart?</a>

                    </div>
                    <div class="mainPostInfo">
                        <img class="mainPostInfoIcon" src="eye.png">
                        <img class="mainPostInfoIcon" src="textBox.png">
                    </div>
                    <div class="mainPostOutline">
                        <span>어떻게 컴퓨터를 예쁘게 잘 쓸 것인가에 대한 포스트의 개요</span>
                        <span>2023.10.31</span>
                    </div>
                </div>
            </div> 

            <div class="mainPost"> 
                <img class="mainPostImgSize" src="computerImg.jpg">
                <div>
                    <div class="mainPostTitleFollow">
                        <a class="mainPostTitle">How to use our computer smart?</a>
                    </div>
                    <div class="mainPostInfo">
                        <img class="mainPostInfoIcon" src="eye.png">
                        <img class="mainPostInfoIcon" src="textBox.png">
                    </div>
                    <div class="mainPostOutline">
                        <span>어떻게 컴퓨터를 예쁘게 잘 쓸 것인가에 대한 포스트의 개요</span>
                        <span>2023.10.31</span>
                    </div>
                </div>
            </div> 

            <div class="mainPost"> 
                <img class="mainPostImgSize" src="computerImg.jpg">
                <div>
                    <div class="mainPostTitleFollow">
                        <a class="mainPostTitle">How to use our computer smart?</a>
                    </div>
                    <div class="mainPostInfo">
                        <img class="mainPostInfoIcon" src="eye.png">
                        <img class="mainPostInfoIcon" src="textBox.png">
                    </div>
                    <div class="mainPostOutline">
                        <span>어떻게 컴퓨터를 예쁘게 잘 쓸 것인가에 대한 포스트의 개요</span>
                        <span>2023.10.31</span>
                    </div>
                </div>
            </div> 

            <div class="mainPost"> 
                <img class="mainPostImgSize" src="computerImg.jpg">
                <div>
                    <div class="mainPostTitleFollow">
                        <a class="mainPostTitle">How to use our computer smart?</a>
                    </div>
                    <div class="mainPostInfo">
                        <img class="mainPostInfoIcon" src="eye.png">
                        <img class="mainPostInfoIcon" src="textBox.png">
                    </div>
                    <div class="mainPostOutline">
                        <span>어떻게 컴퓨터를 예쁘게 잘 쓸 것인가에 대한 포스트의 개요</span>
                        <span>2023.10.31</span>
                    </div>
                </div>
            </div> 

            <div class="mainPost"> 
                <img class="mainPostImgSize" src="computerImg.jpg">
                <div>
                    <div class="mainPostTitleFollow">
                        <a class="mainPostTitle">How to use our computer smart?</a>
                    </div>
                    <div class="mainPostInfo">
                        <img class="mainPostInfoIcon" src="eye.png">
                        <img class="mainPostInfoIcon" src="textBox.png">
                    </div>
                    <div class="mainPostOutline">
                        <span>어떻게 컴퓨터를 예쁘게 잘 쓸 것인가에 대한 포스트의 개요</span>
                        <span>2023.10.31</span>
                    </div>
                </div>
            </div> 

            <div class="mainPost"> 
                <img class="mainPostImgSize" src="computerImg.jpg">
                <div>
                    <div class="mainPostTitleFollow">
                        <a class="mainPostTitle">How to use our computer smart?</a>
                    </div>
                    <div class="mainPostInfo">
                        <img class="mainPostInfoIcon" src="eye.png">
                        <img class="mainPostInfoIcon" src="textBox.png">
                    </div>
                    <div class="mainPostOutline">
                        <span>어떻게 컴퓨터를 예쁘게 잘 쓸 것인가에 대한 포스트의 개요</span>
                        <span>2023.10.31</span>
                    </div>
                </div>
            </div> 
            <div class="mainPost"> 
                <img class="mainPostImgSize" src="computerImg.jpg">
                <div>
                    <div class="mainPostTitleFollow">
                        <a class="mainPostTitle">How to use our computer smart?</a>
                    </div>
                    <div class="mainPostInfo">
                        <img class="mainPostInfoIcon" src="eye.png">
                        <img class="mainPostInfoIcon" src="textBox.png">
                    </div>
                    <div class="mainPostOutline">
                        <span>어떻게 컴퓨터를 예쁘게 잘 쓸 것인가에 대한 포스트의 개요</span>
                        <span>2023.10.31</span>
                    </div>
                </div>
            </div> 

            <div class="mainPost"> 
                <img class="mainPostImgSize" src="computerImg.jpg">
                <div>
                    <div class="mainPostTitleFollow">
                        <a class="mainPostTitle">How to use our computer smart?</a>
                    </div>
                    <div class="mainPostInfo">
                        <img class="mainPostInfoIcon" src="eye.png">
                        <img class="mainPostInfoIcon" src="textBox.png">
                    </div>
                    <div class="mainPostOutline">
                        <span>어떻게 컴퓨터를 예쁘게 잘 쓸 것인가에 대한 포스트의 개요</span>
                        <span>2023.10.31</span>
                    </div>
                </div>
            </div> 
           </div>
            <h2 id="mainNewPostStart">New Posts</h2>

            <div id="mainNewPostCollection">


            <div class="newPostBox">
                <div class="mainNewPostUpper">
                    <img class="mainPostNewImg" src="userIcon.png">
                    <div class="mainPostNewHeader">
                        <span class="mainPostAccount">Admin</span>
                        <span class="mainPostDate">October 27</span>
                    </div>
                </div> 
                <div class="mainNewPostInfo">
                    <a class="mainNewPostTitle">
                        How to use our computer smart?
                    </a>
                    <div><span class="mainNewPostCategories">Computer Clinic</span>
                    <span>2023.10.31</span></div>
                    <span class="mainNewPostOutline">위 글에 대한 내용 1줄</span>
                </div>
                <div class="mainNewPostFooter">
                    <div class="mainNewPostLike">
                        <img class="mainPostLikesIcon" src="likesIcon.png">
                        <span class="mainPostNewFont">Like</span>
                    </div>
                    <div class="mainPostNewFooterInfo">
                        <img class="mainPostInfoIcon" src="eye.png">
                        <span> 30 </span>
                        <img class="mainPostInfoIcon" src="textBox.png">
                        <span> 7 </span>
                    </div>
                </div>
            </div>
            <div class="newPostBox">
                <div class="mainNewPostUpper">
                    <img class="mainPostNewImg" src="userIcon.png">
                    <div class="mainPostNewHeader">
                        <span class="mainPostAccount">Admin</span>
                        <span class="mainPostDate">October 27</span>
                    </div>
                </div> 
                <div class="mainNewPostInfo">
                    <a class="mainNewPostTitle">
                        How to use our computer smart?
                    </a>
                    <div><span class="mainNewPostCategories">Computer Clinic</span>
                    <span>2023.10.31</span></div>
                    <span class="mainNewPostOutline">위 글에 대한 내용 1줄</span>
                </div>
                <div class="mainNewPostFooter">
                    <div class="mainNewPostLike">
                        <img class="mainPostLikesIcon" src="likesIcon.png">
                        <span class="mainPostNewFont">Like</span>
                    </div>
                    <div class="mainPostNewFooterInfo">
                        <img class="mainPostInfoIcon" src="eye.png">
                        <span> 30 </span>
                        <img class="mainPostInfoIcon" src="textBox.png">
                        <span> 7 </span>
                    </div>
                </div>
            </div>

            <div class="newPostBox">
                <div class="mainNewPostUpper">
                    <img class="mainPostNewImg" src="userIcon.png">
                    <div class="mainPostNewHeader">
                        <span class="mainPostAccount">Admin</span>
                        <span class="mainPostDate">October 27</span>
                    </div>
                </div> 
                <div class="mainNewPostInfo">
                    <a class="mainNewPostTitle">
                        How to use our computer smart?
                    </a>
                    <div><span class="mainNewPostCategories">Computer Clinic</span>
                    <span>2023.10.31</span></div>
                    <span class="mainNewPostOutline">위 글에 대한 내용 1줄</span>
                </div>
                <div class="mainNewPostFooter">
                    <div class="mainNewPostLike">
                        <img class="mainPostLikesIcon" src="likesIcon.png">
                        <span class="mainPostNewFont">Like</span>
                    </div>
                    <div class="mainPostNewFooterInfo">
                        <img class="mainPostInfoIcon" src="eye.png">
                        <span> 30 </span>
                        <img class="mainPostInfoIcon" src="textBox.png">
                        <span> 7 </span>
                    </div>
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