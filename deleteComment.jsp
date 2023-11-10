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

    //댓글의 idx
    int commentIdx = Integer.parseInt(request.getParameter("cmIdxDelete"));

    ResultSet postSet = null;
    if (userName==null){
        response.sendRedirect("signIn.html");
    }

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/week6", "Sohyunxxi", "1234");
    //로그인한 사람
    String userSql = "SELECT idx FROM user WHERE id=?";
    PreparedStatement userQuery = connect.prepareStatement(userSql);
    userQuery.setString(1,userName);

    ResultSet rs = userQuery.executeQuery();

    int writerIdx =0;
    if(rs.next()){
        writerIdx = rs.getInt("idx"); 
    }

    //게시글 작성자의 idx얻음
    String cmsql = "SELECT * FROM comment WHERE idx=?";
    PreparedStatement cmquery = connect.prepareStatement(cmsql);
    cmquery.setInt(1,commentIdx);
    ResultSet commentSet = cmquery.executeQuery();
    int userIdx = 0;
    int postIdx=0;
    if(commentSet.next()){
        userIdx = commentSet.getInt("user_idx");
        postIdx = commentSet.getInt("post_idx");
    }

    String message="";


    if(userIdx==writerIdx){// 댓글 작성자와 로그인한 사람이 같은 사람이면 가능
        String sql = "DELETE FROM comment WHERE idx=?";
        PreparedStatement query = connect.prepareStatement(sql);
        query.setInt(1,commentIdx);
        query.executeUpdate();

        message="삭제하였습니다.";
    }
    else{ //다른 사람이면 불가능
        message="다른 사람의 댓글은 삭제할 수 없습니다!";
    }

    %>

    <script>
        alert("<%= message %>")
        window.location="memberPostView.jsp?post_id=" + "<%=postIdx%>"
    </script>



