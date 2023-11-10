<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%
    request.setCharacterEncoding("utf-8");
    String title = request.getParameter("title"); // 제목을 받아옴
    String content = request.getParameter("content"); // 내용을 받아옴
    
    String userName = (String)session.getAttribute("username");
    String pwValue = request.getParameter("pw_value");
    if (userName==null){
        response.sendRedirect("signIn.html");
    }
    
    String id = (String) session.getAttribute("username");
    String message = "";
    String redirectPage = "";
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

     String postSql = "INSERT INTO post (user_idx, title, content) VALUES (?, ?, ?)";
        PreparedStatement postQuery = connect.prepareStatement(postSql);
        postQuery.setInt(1, userIdx); // 'user_idx'에 'user' 테이블의 'idx' 값을 넣음
        postQuery.setString(2, title);
        postQuery.setString(3, content);
        int a = postQuery.executeUpdate();
        int postIdx = 0;
        if(a>0){
            String sql = "SELECT idx FROM post ORDER BY created_at DESC LIMIT 1";
    PreparedStatement query = connect.prepareStatement(sql);
            ResultSet rs = query.executeQuery();
            if(rs.next()){
                postIdx = rs.getInt("idx");
            }
        }

    if (title != null && !title.isEmpty()) {
        // title이 비어있지 않다면 쿼리 실행
        message="포스팅에 성공하였습니다!";
        
       

        redirectPage = "memberPostView.jsp?post_id="+postIdx;

    } else {
        // title이 비어있으면 다른 조치를 취할 수 있음
        message = "제목을 적어주세요!";
        redirectPage = "createPost.jsp";

    }

 
%>

<script>
    alert("<%= message %>"); // 메시지 출력
    window.location = "<%= redirectPage %>"; // 해당 페이지로 리디렉트
</script>