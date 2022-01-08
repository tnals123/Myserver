<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%
    Cookie[] cookies = request.getCookies();
    Cookie id_cookie=null;

    String myid=null;
    String user_number=null;
    String user_classes=null;
    String user_name = null;
    String mymemo = request.getParameter("mName");
    String myoriginmemo = request.getParameter("originmemo");

    if (cookies != null){
        for (Cookie c : cookies){
            if (c.getName().equals("id")){
                id_cookie=c;
                myid=c.getValue();
            }
        }
    }

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stageus","SooMin","dkssud1010@");

    String get_usermemo="UPDATE officers_memo SET memo = ? WHERE memo = ? ";
    PreparedStatement pstmt2 = conn.prepareStatement(get_usermemo);
    pstmt2.setString(1,mymemo);
    pstmt2.setString(2,myoriginmemo);
    pstmt2.executeUpdate();
            
%>

<script>
    alert("수정하였습니다!");
    location.href = "main.jsp";
</script>