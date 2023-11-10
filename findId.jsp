<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
    
    request.setCharacterEncoding("utf-8");
    String email = request.getParameter("email");
    ResultSet rs = null;
    String id="";
    String message ="";
    String redirectPage="";
    //데이터베이스 통신 코드

    //Connector 파일 불러오기
    Class.forName("com.mysql.jdbc.Driver");

    // 데이터베이스 연결
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/week6","Sohyunxxi","1234");

    //SQL 만들기
    String sql = "SELECT id FROM user WHERE email=?";
    PreparedStatement query = connect.prepareStatement(sql);

    query.setString(1,email);

        //query 전송
    rs = query.executeQuery();

    
 
    if (rs.next() )  {
        id = rs.getString("id");
        message = "아이디 : "+ id;
        redirectPage = "signIn.html";
    }else{
        message = "계정이 존재하지 않습니다! 회원가입을 해 주세요.";
        redirectPage = "index.html";
    } 

%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        alert("<%= message %>"); // 메시지 출력
        window.location = "<%= redirectPage %>"; // 해당 페이지로 리디렉트
    </script>
    
</body>
