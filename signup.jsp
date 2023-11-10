<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%--  데이터베이스 탐색 라이브러리  --%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>

<%--  데이터베이스 연결 라이브러리  --%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%--  SQL 전송 라이브러리  --%>
<%@ page import="java.sql.PreparedStatement" %>
<%
    
    request.setCharacterEncoding("utf-8");
    String username = request.getParameter("name");
    String idValue = request.getParameter("id_value");
    String pwValue = request.getParameter("pw_value1");
    String email = request.getParameter("email");
    String birth = request.getParameter("birth");
    String tel = request.getParameter("tel");
    String address = request.getParameter("address");
    String gender = request.getParameter("gender");
    int accountSet = 0;
   
    //데이터베이스 통신 코드

    //Connector 파일 불러오기
    Class.forName("com.mysql.jdbc.Driver");

    // 데이터베이스 연결
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/week6","Sohyunxxi","1234");

    String birthValue = request.getParameter("birth");

    java.sql.Date sqlBirth = null;

    if (birthValue != null && !birthValue.isEmpty()) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilBirth = sdf.parse(birthValue);
        sqlBirth = new java.sql.Date(utilBirth.getTime());
    }

   
    //SQL 만들기
    String sql = "INSERT INTO user (id, pw, name, email, birth, tel, address, gender) VALUES (?,?,?,?,?,?,?,?)";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,idValue);
    query.setString(2,pwValue);
    query.setString(3,username);
    query.setString(4,email);
    query.setDate(5, sqlBirth); 
    
    if (tel != null && !tel.isEmpty()) {
        query.setString(6, tel);
    } else {
        query.setNull(6, java.sql.Types.INTEGER);
    }
    query.setString(7,address);
    query.setString(8,gender);
        //query 전송

    accountSet = query.executeUpdate();
%>
<body>
    
    <% if(accountSet<0) { %>
   <script>
        alert("회원가입에 실패하였습니다. 조건을 다시 잘 확인하고 작성해 주세요.")
        location.href = "index.html";
    </script>

<% } else {%>
     <script>
    alert("회원가입에 성공하였습니다. 로그인을 해 주세요.")
    location.href="signIn.html";
    </script>
    <% } %>
</body>
