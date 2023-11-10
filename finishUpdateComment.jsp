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
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/week6","Sohyunxxi","1234");

    //SQL 만들기
    String sql = "SELECT idx FROM user WHERE id=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,userName);

        //query 전송
    ResultSet rs =  query.executeQuery();

    int userIdx =0;
    if(rs.next()){
        userIdx = rs.getInt("idx");
    }

    int commentIdx = Integer.parseInt(request.getParameter("finalComment"));
    String comment = request.getParameter("updatedComment");
    int postIdx = 0;

    String postsql = "SELECT * FROM comment WHERE idx=?";
    PreparedStatement postquery = connect.prepareStatement(postsql);
    postquery.setInt(1,commentIdx);
    
    ResultSet ps = postquery.executeQuery();

    if(ps.next()){
        postIdx = ps.getInt("post_idx");
    }

    String upsql = "UPDATE comment SET content= ? WHERE idx=?";
    PreparedStatement upquery = connect.prepareStatement(upsql);
    upquery.setString(1,comment);
    upquery.setInt(2,commentIdx);

     upquery.executeUpdate();

    %>

    <script>
        alert("댓글이 수정되었습니다.")
        window.location="memberPostView.jsp?post_id=" + "<%=postIdx%>";
    </script>



