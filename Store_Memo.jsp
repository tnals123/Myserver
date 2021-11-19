<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%
    String memo = request.getParameter("mymemo");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stageus","SooMin","dkssud1010@");
    String signmyinfo="INSERT INTO officers_memo(memo) VALUES(?)";
    PreparedStatement pstmt = conn.prepareStatement(signmyinfo);

    pstmt.setString(1,memo);
    pstmt.executeUpdate();
%>
<script>
    alert("메모추가 완료");
    location.href="loginpage.jsp";
</script>
