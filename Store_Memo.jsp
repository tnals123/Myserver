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

    String get_usernumber="SELECT * FROM userinfo WHERE id=?";
    PreparedStatement pstmt = conn.prepareStatement(get_usernumber);
    pstmt.setString(1,myid);
    ResultSet rs = pstmt.executeQuery();

    if(rs.next()){
        user_number=rs.getString("num");
    }

    String[] year = request.getParameterValues("year");
    String[] month = request.getParameterValues("month");
    String[] date = request.getParameterValues("date");
    String[] time = request.getParameterValues("time");
    String[] minite = request.getParameterValues("minite");
    String memo = request.getParameter("mymemo");

    String input_memo="INSERT INTO officers_memo(num,memo,memo_year,month,date,time,minite) VALUES(?,?,?,?,?,?,?)";
    PreparedStatement pstmt2 = conn.prepareStatement(input_memo);

    pstmt2.setString(1,user_number);
    pstmt2.setString(2,memo);
    pstmt2.setString(3,year[0]);
    pstmt2.setString(4,month[0]);
    pstmt2.setString(5,date[0]);
    pstmt2.setString(6,time[0]);
    pstmt2.setString(7,minite[0]);
    pstmt2.executeUpdate();
            
%>
<script>
    alert("<%=year[0]%>");
    alert("<%=month[0]%>");
    alert("<%=date[0]%>");
    alert("<%=time[0]%>");
    alert("<%=minite[0]%>");
    alert("<%=memo%>");
    alert("<%=user_number%>");
    location.href="loginpage.jsp";
</script>
