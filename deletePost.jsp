<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%  
    request.setCharacterEncoding("utf-8");

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/week6", "Sohyunxxi", "1234");
    String message = "";
    String redirectPage = "";
    int postIdx = Integer.parseInt(request.getParameter("post_id"));

    String sql = "DELETE FROM post WHERE idx= ? ";
    PreparedStatement query = connect.prepareStatement(sql);

    query.setInt(1,postIdx);

    query.executeUpdate();

%>
<script>
    alert("성공적으로 삭제되었습니다.");
    window.location="allPosts.jsp";

</script>