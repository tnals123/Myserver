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
            var section = document.getElementsByClassName("mymemosection");

            var defaultmemo = new Array();
            <% for (int i=0; i<100; i++) { %>
                defaultmemo[<%= i %>] = "<%= user_memo[i] %>"; 
            <% } %>

            var defaultyear = new Array();
            <% for (int i=0; i<100; i++) { %>
                defaultyear[<%= i %>] = "<%= user_write_year[i] %>"; 
            <% } %>

            var defaultmonth = new Array();
            <% for (int i=0; i<100; i++) { %>
                defaultmonth[<%= i %>] = "<%= user_write_month[i] %>"; 
            <% } %>

            var defaultdate = new Array();
            <% for (int i=0; i<100; i++) { %>
                defaultdate[<%= i %>] = "<%= user_write_date[i] %>"; 
            <% } %>

            var defaulttime = new Array();
            <% for (int i=0; i<100; i++) { %>
                defaulttime[<%= i %>] = "<%= user_write_time[i] %>"; 
            <% } %>

            var defaultminite = new Array();
            <% for (int i=0; i<100; i++) { %>
                defaultminite[<%= i %>] = "<%= user_write_minite[i] %>"; 
            <% } %>

            console.log("ㅋ");

            for (var i=0; i<=defaultmemo.length;i++){
                if(defaultmemo[i]!="null" && defaultmemo[i]!=undefined){

                    var section_addmemo = document.createElement("section");
                    section_addmemo.style.backgroundColor="lightyellow";
                    var defaultmemosection = document.createElement('div');
                    var br = document.createElement('br');
                    var br2 = document.createElement('br');
                    var br3 = document.createElement('br');
                    var default_memo_wrtie = document.createTextNode('\u00a0'+'\u00a0'+'\u00a0'+defaultmemo[i]);
                    var default_memo_year = document.createTextNode("-"+defaultyear[i]+" 년 ");
                    var default_memo_month = document.createTextNode(defaultmonth[i]+'\u00a0');
                    var default_memo_date = document.createTextNode(defaultdate[i]+" 일 ");
                    var default_memo_time = document.createTextNode(defaulttime[i]+" 시 ");
                    var default_memo_minite = document.createTextNode(defaultminite[i]+" 분 ");
                    var spacebar = document.createTextNode('\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0'
                                                            +'\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0'
                                                            +'\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0'
                                                            +'\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0'
                                                            +'\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0');
                    defaultmemosection.appendChild(br3);
                    defaultmemosection.appendChild(default_memo_wrtie);
                    defaultmemosection.appendChild(br);
                    defaultmemosection.appendChild(br2);
                    defaultmemosection.appendChild(spacebar);
                    defaultmemosection.appendChild(default_memo_year);
                    defaultmemosection.appendChild(default_memo_month);
                    defaultmemosection.appendChild(default_memo_date);
                    defaultmemosection.appendChild(default_memo_time);
                    defaultmemosection.appendChild(default_memo_minite);
                    
                    
                    
                    section[0].appendChild(section_addmemo);
                    section_addmemo.appendChild(defaultmemosection);
                    section[0].appendChild(br3);
                }
            }
            
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
            <section class = "mymemosection">
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