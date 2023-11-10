<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%

    request.setCharacterEncoding("utf-8");
    String userName = (String)session.getAttribute("username");

    if (userName==null){
        response.sendRedirect("signIn.html");
    }

    String username = request.getParameter("name");
    String idValue = request.getParameter("id_value");
    String pwValue = request.getParameter("pw_value1");
    String email = request.getParameter("email");
    String birth = request.getParameter("birth");
    String tel = request.getParameter("tel");
    String address = request.getParameter("address");
    String gender = request.getParameter("gender");
    int accountSet = 0;
   

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/week6", "Sohyunxxi", "1234");
    String birthValue = request.getParameter("birth");

    java.sql.Date sqlBirth = null;

    if (birthValue != null && !birthValue.isEmpty()) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilBirth = sdf.parse(birthValue);
        sqlBirth = new java.sql.Date(utilBirth.getTime());
    }

    String idSql = "SELECT idx FROM user where id = ?";
    PreparedStatement idQuery = connect.prepareStatement(idSql);
    idQuery.setString(1, userName);
    ResultSet rs = idQuery.executeQuery();

    int userIdx = 0;
    if (rs.next()) {
        userIdx = rs.getInt("idx");
    }

    String sql = "UPDATE user SET pw = ?, birth = ?, tel = ?, address = ?, gender = ? WHERE id = ?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, pwValue);
    query.setDate(2, sqlBirth); 
    if (tel != null && !tel.isEmpty()) {
        query.setString(3, tel);
    } else {
        query.setNull(3, java.sql.Types.INTEGER);
    }
    query.setString(4, address);
    query.setString(5, gender);
    query.setString(6, userName);

    accountSet = query.executeUpdate();
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <% if (accountSet < 0) { %>
        <script>
            alert("정보수정에 실패했습니다. 다시 작성해 주세요.");
            location.href = "updateUser.jsp";
        </script>
    <% } else { %>
        <script>
            alert("정보수정에 성공했습니다!");
            location.href = "aboutUser.jsp";
        </script>
    <% } %>
</body>
