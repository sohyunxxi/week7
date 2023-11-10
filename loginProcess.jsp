<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
    request.setCharacterEncoding("utf-8");
    String idValue = request.getParameter("id_value");
    String pwValue = request.getParameter("pw_value");
   
    ResultSet rs= null;
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/week6","Sohyunxxi","1234");
    String sql = "SELECT * FROM user WHERE id= ?";
    PreparedStatement query = connect.prepareStatement(sql);
  
    query.setString(1,idValue); 
        
    rs=query.executeQuery();


    try{
        
   
       

        if(rs.next()){
            String dbId =rs.getString("id");
            String dbpw =rs.getString("pw");
            if(pwValue.equals(dbpw)){
                session.setAttribute("sessionId",idValue);
                response.sendRedirect("success.html");
            }
            else{
                response.sendRedirect("pwFail.html");
            }
        }
        else{
            response.sendRedirect("idFail.html");
        }
    }

    catch(Exception e){
        e.printStackTrace();
    }
    
%>