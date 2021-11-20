<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%
    String idvalue = request.getParameter("id_value");
    String pwvalue = request.getParameter("pw_value");
    String name = request.getParameter("name");
    String phonenumber = request.getParameter("phonenumber");
    String officer[] = request.getParameterValues("office");

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stageus","SooMin","dkssud1010@");
    String signmyinfo="INSERT INTO userinfo(id,pw,name,phonenumber,office) VALUES(?,?,?,?,?)";
    PreparedStatement pstmt = conn.prepareStatement(signmyinfo);

    pstmt.setString(1,idvalue);
    pstmt.setString(2,pwvalue);
    pstmt.setString(3,name);
    pstmt.setString(4,phonenumber);
    pstmt.setString(5,officer[0]);
    pstmt.executeUpdate();
    
%>
<script>
    alert('<%=officer%>');
    alert("회원가입 성공!");
    location.href="loginpage.jsp";
</script>