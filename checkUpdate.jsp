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

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/week6", "Sohyunxxi", "1234");
    
    String message = "";
    String redirectPage = "";
    String username="";
    int userIdx = 0;
    int postIdx = Integer.parseInt(request.getParameter("post_id"));

    String postSql = "SELECT user_idx FROM post WHERE idx=?";
    PreparedStatement postQuery = connect.prepareStatement(postSql);
    postQuery.setInt(1, postIdx);
    ResultSet postResult = postQuery.executeQuery();

    if (postResult.next()) { // Move to the first row
        userIdx = postResult.getInt("user_idx");
    }

    String userSql = "SELECT id FROM user WHERE idx=?";
    PreparedStatement userQuery = connect.prepareStatement(userSql);
    userQuery.setInt(1, userIdx);
    ResultSet userResult = userQuery.executeQuery();
    
    
    if (userResult.next()) {
        username = userResult.getString("id");
    }

    //username => 게시물 작성한 사람의 아이디
    //userName => 로그인한 사람의 아이디

    if(!username.equals(userName)){
        message="글 수정은 작성자만 수정할 수 있습니다.";
        redirectPage="no";
    }
    else{
        redirectPage = "updatePost.jsp";
    }

%>

<script>
    if("<%= redirectPage %>"=="no"){
        alert("<%= message %>"); // 메시지 출력
        history.back();
    }
    else{
        window.location = "<%= redirectPage %>"; // 해당 페이지로 리디렉트
    }
</script>
