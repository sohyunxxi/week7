<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%
    request.setCharacterEncoding("utf-8");
    String updatedTitle = request.getParameter("updatedTitle"); // 제목을 받아옴
    String updatedContent = request.getParameter("updatedContent"); // 내용을 받아옴
    
    String userName = (String)session.getAttribute("username");
    if (userName == null){
        response.sendRedirect("signIn.html");
    }
    
    String id = (String)session.getAttribute("username");
    String message = "";
    String redirectPage = "";
    int userIdx = -1;
    int dbPostIdx = -1;

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

    String postSql = "SELECT idx FROM post WHERE user_idx=? ORDER BY idx DESC LIMIT 1";
    PreparedStatement postQuery = connect.prepareStatement(postSql);
    postQuery.setInt(1, userIdx);
    ResultSet postSet = postQuery.executeQuery();

    if (postSet.next()) {
        dbPostIdx = postSet.getInt("idx");
    }

    if (updatedTitle != null && !updatedTitle.isEmpty() ) {
        String postUpdateSql = "UPDATE post SET title = ?, content = ? WHERE idx = ? AND user_idx = ?";
        PreparedStatement postUpdateQuery = connect.prepareStatement(postUpdateSql);
        postUpdateQuery.setString(1, updatedTitle);
        postUpdateQuery.setString(2, updatedContent);
        postUpdateQuery.setInt(3, dbPostIdx);
        postUpdateQuery.setInt(4, userIdx);
        postUpdateQuery.executeUpdate();
        
        message = "게시글 수정에 성공하였습니다!";
        redirectPage = "updateSuccess.jsp";
    } else {
        message = "게시글 수정이 실패하였습니다. 다시 시도해 주세요.";
        redirectPage = "updatePost.jsp";
    }
%>

<script>
    alert("<%= message %>"); // 메시지 출력
    window.location = "<%= redirectPage %>"; // 해당 페이지로 리디렉트
</script>
