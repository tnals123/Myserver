<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
Cookie c= new Cookie("id","");
c.setMaxAge(0);
response.addCookie(c);
%>
<script>
    alert("로그아웃 되셨습니다.");
    location.href = "loginpage.jsp"
</script>