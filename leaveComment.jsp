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
    
    //post 작성자의 post idx
    
    int postIdx = 0;
    int userIdx =  Integer.parseInt(request.getParameter("user"));
    String message ="";
    String content = request.getParameter("comment");


    //댓글 작성자 아이디
    String commentWriter = userName;
   
   


    //db 연결
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/week6", "Sohyunxxi", "1234");

    //게시물 idx를 찾기 위해서 게시물 작성자의 idx를 알아야 함.
    //게작 idx 아는 방법 -> 전 게시물에서 넘긴 user
    String postSql = "SELECT idx FROM post WHERE user_idx=?";
    PreparedStatement postQuery = connect.prepareStatement(postSql);
    postQuery.setInt(1, userIdx);
    ResultSet postResult = postQuery.executeQuery();

    if (postResult.next()) { // Move to the first row
        postIdx = postResult.getInt("idx");
    }

    //댓글 단 유저의 idx 찾음
    String userSql = "SELECT idx FROM user WHERE id=?";
    PreparedStatement userQuery = connect.prepareStatement(userSql);
    userQuery.setString(1, userName);
    ResultSet userResult = userQuery.executeQuery();
    
    
    if (userResult.next()) {
        userIdx = userResult.getInt("idx");
    }


    // 유저 테이블에서 이름에 해당하는 idx 값을 가져옴
    String sql = "INSERT INTO comment (user_idx, post_idx, content) VALUES(?,?,?)";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setInt(1, userIdx);
    query.setInt(2, postIdx);
    query.setString(3,content);

    int num = query.executeUpdate();

    int post_id = postIdx;
    
  if (num > 0) { 
          response.sendRedirect("memberPostView.jsp?post_id="+postIdx);
  } else { %>
        <script>
            alert("댓글 작성 실패했습니다. 다시 작성해 주세요.");
            history.back();
            
        </script>
    <% } %>
%>
    
    

