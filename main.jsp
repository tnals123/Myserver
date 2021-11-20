<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%
    Cookie[] cookies = request.getCookies();
    Cookie id_cookie = null;
    String myid = null;
    String user_number = null;
    String[] user_memo = new String[100];
    String[] user_write_year = new String[100];
    String[] user_write_month = new String[100];
    String[] user_write_date = new String[100];
    String[] user_write_time = new String[100];
    String[] user_write_minite = new String[100];

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

    String get_usermemo="SELECT * FROM officers_memo WHERE num=?";
    PreparedStatement pstmt2 = conn.prepareStatement(get_usermemo);
    pstmt2.setString(1,user_number);
    ResultSet rs2 = pstmt2.executeQuery();

    if (rs2.next()){
        for(int i = 0; rs2.next(); i++){
            user_memo[i]=rs2.getString("memo");
            user_write_year[i]=rs2.getString("memo_year");
            user_write_month[i]=rs2.getString("month");
            user_write_date[i]=rs2.getString("date");
            user_write_time[i]=rs2.getString("time");
            user_write_minite[i]=rs2.getString("minite");
        }
    }
%>
<head>
    <link rel="stylesheet" type="text/css" href="main.css">
    <script>
        window.onload=function(){
            var section = document.getElementsByClassName("memosection");
            var defaultmemosection = document.createElement('div');
            var defaultmemo = document.createTextNode("<%=user_memo[0]%>");
            defaultmemosection.appendChild(defaultmemo);
            section[0].appendChild(defaultmemosection);
        }
        function movePage(){
            alert("회원가입이 완료되었습니다");
            document.resister.action="loginpage.jsp";
            document.resister.submit();
        }
        function movePage_AddMemo(){
            alert("<%=user_memo[0]%>");
            document.resister.action="main_addmemo.jsp";
            document.resister.submit();
        }
        // function deFaultMemo(){
        //     var section = document.getElementsByClassName("memosection");
        //     var defaultmemosection = document.createElement('div');
        //     var defaultmemo = document.createTextNode("<%=user_memo[0]%>");
        //     defaultmemosection.appendChild(defaultmemo);
        //     section[0].appendChild(defaultmemosection);
        // }
       
    </script>
</head>
<body class = "body">
    <main class="resistersection">
        <form method="post" name="resister">
            <h1 class = "title">Diary</h1>
            <section class = "memosection">
                <!-- <%=user_memo[0]%> <%=user_write_year[0]%> <span>년</span> <%=user_write_month[0]%> <%=user_write_date[0]%> <span>일</span> <%=user_write_time[0]%> <span>시</span> <%=user_write_minite[0]%> <span>분</span>
                <br>
                <%=user_memo[1]%>
                <br>
                <%=user_memo[2]%>
                <br>
                <%=user_memo[3]%> -->
            </section>
            <input type="button" id="addbutton" value="+" onclick="movePage_AddMemo()">
            <input type="button" id="seeothermemo_officer" value="사원 메모 보기" onclick="deFaultMemo()">
            <input type="button" id="seeothermemo_team" value="팀장 메모 보기">
            <input type="button" id="logout" value="로그아웃">      
        </form>
    </main>
</body>