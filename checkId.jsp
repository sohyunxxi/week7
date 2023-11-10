<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
    request.setCharacterEncoding("utf-8");
    String idValue = request.getParameter("id_value");
   
    ResultSet rs= null;
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/week6","Sohyunxxi","1234");
    String sql = "SELECT * FROM user WHERE id= ?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,idValue); 
    rs=query.executeQuery();

    %>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
        <% if(rs.next()) {%>
        <script>
            alert("아이디가 중복입니다. 다른 아이디를 사용해 주세요.")
            location.href="makeaccount.jsp";
        </script>
        <% } else {%>
            <script>
                alert("아이디를 사용할 수 있습니다.")
                location.href = "makeaccount.jsp";
            </script>
            <% } %>
    </body>
    