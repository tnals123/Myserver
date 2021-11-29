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
    String user_classes = null;
    String user_name = null;
    String[] user_memo = new String[100];
    String[] user_write_year = new String[100];
    String[] user_write_month = new String[100];
    String[] user_write_date = new String[100];
    String[] user_write_time = new String[100];
    String[] user_write_minite = new String[100];

    String[] user_memo_teamleader = new String[100];
    String[] user_write_year_teamleader = new String[100];
    String[] user_write_month_teamleader = new String[100];
    String[] user_write_date_teamleader = new String[100];
    String[] user_write_time_teamleader = new String[100];
    String[] user_write_minite_teamleader = new String[100];
    String[] user_who_write_teamleader = new String[100];
    String[] user_name_teamleader = new String[100];
    String myclass = "team_leader";
    
    String[] user_memo_employee = new String[100];
    String[] user_write_year_employee = new String[100];
    String[] user_write_month_employee = new String[100];
    String[] user_write_date_employee = new String[100];
    String[] user_write_time_employee = new String[100];
    String[] user_write_minite_employee = new String[100];
    String[] user_who_write_employee = new String[100];
    String[] user_name_employee = new String[100];
    String myclass2= "employee";
                
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
        user_classes=rs.getString("office");
        user_name=rs.getString("name");
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

    String get_usermemo_teamleader="SELECT * FROM officers_memo WHERE officers_classes=?";
    PreparedStatement pstmt3 = conn.prepareStatement(get_usermemo_teamleader);
    pstmt3.setString(1,myclass);
    ResultSet rs3 = pstmt3.executeQuery();

    if(rs3.next()){
        for(int i = 0; rs3.next(); i++){
            user_memo_teamleader[i]=rs3.getString("memo");
            user_write_year_teamleader[i]=rs3.getString("memo_year");
            user_write_month_teamleader[i]=rs3.getString("month");
            user_write_date_teamleader[i]=rs3.getString("date");
            user_write_time_teamleader[i]=rs3.getString("time");
            user_write_minite_teamleader[i]=rs3.getString("minite");
            user_who_write_teamleader[i]=rs3.getString("officers_classes");
            user_name_teamleader[i]=rs3.getString("officers_name");
        }
    }

    String get_usermemo_employee="SELECT * FROM officers_memo WHERE officers_classes=?";
    PreparedStatement pstmt4 = conn.prepareStatement(get_usermemo_employee);
    pstmt4.setString(1,myclass2);
    ResultSet rs4 = pstmt4.executeQuery();

    if(rs4.next()){
        for(int i = 0; rs4.next(); i++){
            user_memo_employee[i]=rs4.getString("memo");
            user_write_year_employee[i]=rs4.getString("memo_year");
            user_write_month_employee[i]=rs4.getString("month");
            user_write_date_employee[i]=rs4.getString("date");
            user_write_time_employee[i]=rs4.getString("time");
            user_write_minite_employee[i]=rs4.getString("minite");
            user_who_write_employee[i]=rs4.getString("officers_classes");
            user_name_employee[i]=rs4.getString("officers_name");
        }
    }
   
%>
<head>
    <link rel="stylesheet" type="text/css" href="main.css">
    <script>

        var defaultsectionarray = [];
        var isEmployeebuttonclicked = false;
        var sectionarray = [];
        var section = document.getElementsByClassName("mymemosection");
        var lineedit = document.createElement('br');
        var isteamleaderbuttonclikced = false;
        var sectionarray_teamleader = [];

        window.onload=function(){
            var check_user_info = "<%=user_classes%>";
            var button_seeteamleadermemo = document. getElementById("seeothermemo_team");
            var button_seeemployeememo = document. getElementById("seeothermemo_officer");
            

            if (check_user_info == "employee"){
                button_seeteamleadermemo.disabled="true";
                button_seeemployeememo.disabled="true";
            }
            if (check_user_info == "team_leader"){
                button_seeteamleadermemo.disabled="true";
            }

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
                    var delete_button = document.createElement("button");
                    var correction_button = document.createElement("button");
                    var defaultmemosection2 = document.createElement('span');
                    var buttonsection = document.createElement('span');
                    var section_addmemo = document.createElement("section");
                    var temporaryarray=[];

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

                    section_addmemo.style.backgroundColor = "lightyellow";
                    defaultmemosection2.style.width="500px";
                    section_addmemo.style.marginTop="20px";
                    delete_button.style.marginLeft="420px";
                    delete_button.style.width="80px";
                    delete_button.style.height="22px";
                    delete_button.innerHTML = "삭제하기";
                    correction_button.style.width="80px";
                    correction_button.style.marginLeft="10px";
                    correction_button.style.height="22px";
                    correction_button.innerText = "수정하기";
                    defaultmemosection2.appendChild(default_memo_wrtie);
                    defaultmemosection2.appendChild(br);
                    defaultmemosection2.appendChild(br2);
                    defaultmemosection2.appendChild(spacebar);
                    defaultmemosection2.appendChild(default_memo_year);
                    defaultmemosection2.appendChild(default_memo_month);
                    defaultmemosection2.appendChild(default_memo_date);
                    defaultmemosection2.appendChild(default_memo_time);
                    defaultmemosection2.appendChild(default_memo_minite);
          
                    section[0].appendChild(section_addmemo);
                    section_addmemo.appendChild(defaultmemosection2);
                    buttonsection.appendChild(delete_button);
                    buttonsection.appendChild(correction_button);
                    section_addmemo.appendChild(buttonsection);   
                    temporaryarray.push(section_addmemo);  
                    temporaryarray.push(delete_button); 
                    temporaryarray.push(correction_button);   
                    defaultsectionarray.push(temporaryarray);
                    console.log(defaultsectionarray);     
                    
                    
                    
                }
            }
            
        }
        function movePage_AddMemo(){
            document.resister.action="main_addmemo.jsp";
            document.resister.submit();
        }
        function see_Team_Leader_Memo(){
            var teamleaderbutton = document.getElementById("seeothermemo_team");
            teamleaderbutton.value="그만 보기";

            var defaultmemo_teamleader = new Array();
            <% for (int i=0; i<100; i++) { %>
                defaultmemo_teamleader[<%= i %>] = "<%= user_memo_teamleader[i] %>"; 
            <% } %>

            var defaultyear_teamleader = new Array();
            <% for (int i=0; i<100; i++) { %>
                defaultyear_teamleader[<%= i %>] = "<%= user_write_year_teamleader[i] %>"; 
            <% } %>

            var defaultmonth_teamleader = new Array();
            <% for (int i=0; i<100; i++) { %>
                defaultmonth_teamleader[<%= i %>] = "<%= user_write_month_teamleader[i] %>"; 
            <% } %>

            var defaultdate_teamleader = new Array();
            <% for (int i=0; i<100; i++) { %>
                defaultdate_teamleader[<%= i %>] = "<%= user_write_date_teamleader[i] %>"; 
            <% } %>

            var defaulttime_teamleader = new Array();
            <% for (int i=0; i<100; i++) { %>
                defaulttime_teamleader[<%= i %>] = "<%= user_write_time_teamleader[i] %>"; 
            <% } %>

            var defaultminite_teamleader = new Array();
            <% for (int i=0; i<100; i++) { %>
                defaultminite_teamleader[<%= i %>] = "<%= user_write_minite_teamleader[i] %>"; 
            <% } %>
                    
            var defaultoffice_teamleader = new Array();
            <% for (int i=0; i<100; i++) { %>
                defaultoffice_teamleader[<%= i %>] = "<%= user_name_teamleader[i] %>"; 
            <% } %>
                    
                
            for (var i=0; i<=defaultmemo_teamleader.length;i++){

                    if(defaultmemo_teamleader[i]!="null" && defaultmemo_teamleader[i]!=undefined){

                        var section_addmemo = document.createElement("section");
                        var delete_button = document.createElement("button");
                        var correction_button = document.createElement("button");
                        var defaultmemosection2 = document.createElement('span');
                        var buttonsection = document.createElement('span');
                        var br = document.createElement('br');
                        var br2 = document.createElement('br');
                        var temporaryarray=[];

                        var default_memo_wrtie = document.createTextNode('\u00a0'+'\u00a0'+'\u00a0'+defaultmemo_teamleader[i]);
                        var default_memo_year = document.createTextNode("-"+defaultyear_teamleader[i]+" 년 ");
                        var default_memo_month = document.createTextNode(defaultmonth_teamleader[i]+'\u00a0');
                        var default_memo_date = document.createTextNode(defaultdate_teamleader[i]+" 일 ");
                        var default_memo_time = document.createTextNode(defaulttime_teamleader[i]+" 시 ");
                        var default_memo_minite = document.createTextNode(defaultminite_teamleader[i]+" 분 ");
                        var default_who_write = document.createTextNode(defaultoffice_teamleader[i]+" 사원 ");
                        var spacebar = document.createTextNode('\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0'
                                                                        +'\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0'
                                                                        +'\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0'
                                                                        +'\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0');

                        section_addmemo.style.backgroundColor="lightyellow";
                        defaultmemosection2.style.color="red";
                        defaultmemosection2.style.width="500px";
                        section_addmemo.style.marginTop="20px";
                        delete_button.style.marginLeft="420px";
                        delete_button.style.width="80px";
                        delete_button.style.height="22px";
                        delete_button.innerHTML = "삭제하기";
                        correction_button.style.width="80px";
                        correction_button.style.marginLeft="10px";
                        correction_button.style.height="22px";
                        correction_button.innerText = "수정하기";

                        defaultmemosection2.appendChild(default_memo_wrtie);
                        defaultmemosection2.appendChild(br);
                        defaultmemosection2.appendChild(br2);
                        defaultmemosection2.appendChild(spacebar);
                        defaultmemosection2.appendChild(default_memo_year);
                        defaultmemosection2.appendChild(default_memo_month);
                        defaultmemosection2.appendChild(default_memo_date);
                        defaultmemosection2.appendChild(default_memo_time);
                        defaultmemosection2.appendChild(default_memo_minite);
                        defaultmemosection2.appendChild(default_who_write);
                            
                        section[0].appendChild(section_addmemo);
                        section_addmemo.appendChild(defaultmemosection2);
                        buttonsection.appendChild(delete_button);
                        buttonsection.appendChild(correction_button);
                        section_addmemo.appendChild(buttonsection);            
                        temporaryarray.push(section_addmemo);
                        temporaryarray.push(delete_button);
                        temporaryarray.push(correction_button);
                        sectionarray_teamleader.push(temporaryarray);
                }
            }
        }

        function see_Team_Leader_Memo_Off(){
            var teamleaderbutton = document.getElementById("seeothermemo_team");
            teamleaderbutton.value="사원 메모 보기";
            for (var i=0; i<sectionarray_teamleader.length;i++){
                console.log(sectionarray_teamleader[i]);
                section[0].removeChild(sectionarray_teamleader[i]);
                }
            sectionarray_teamleader=[];
        }
    
        function see_Team_Leader_Memo_OnOff(){
            if(isteamleaderbuttonclikced==false){
                see_Team_Leader_Memo();
                isteamleaderbuttonclikced=true;
            }
            else if(isteamleaderbuttonclikced==true){
                see_Team_Leader_Memo_Off();
                isteamleaderbuttonclikced=false;
            }
        }

        function see_Employee_Memo(){
            var employeebutton = document.getElementById("seeothermemo_officer");  
            isEmployeebuttonclicked=true;
                    employeebutton.value = "그만 보기";
                    console.log(isEmployeebuttonclicked);

                    var defaultmemo_employee = new Array();
                    <% for (int i=0; i<100; i++) { %>
                        defaultmemo_employee[<%= i %>] = "<%= user_memo_employee[i] %>"; 
                    <% } %>

                    var defaultyear_employee = new Array();
                    <% for (int i=0; i<100; i++) { %>
                        defaultyear_employee[<%= i %>] = "<%= user_write_year_employee[i] %>"; 
                    <% } %>

                    var defaultmonth_employee = new Array();
                    <% for (int i=0; i<100; i++) { %>
                        defaultmonth_employee[<%= i %>] = "<%= user_write_month_employee[i] %>"; 
                    <% } %>

                    var defaultdate_employee = new Array();
                    <% for (int i=0; i<100; i++) { %>
                        defaultdate_employee[<%= i %>] = "<%= user_write_date_employee[i] %>"; 
                    <% } %>

                    var defaulttime_employee = new Array();
                    <% for (int i=0; i<100; i++) { %>
                        defaulttime_employee[<%= i %>] = "<%= user_write_time_employee[i] %>"; 
                    <% } %>

                    var defaultminite_employee = new Array();
                    <% for (int i=0; i<100; i++) { %>
                        defaultminite_employee[<%= i %>] = "<%= user_write_minite_employee[i] %>"; 
                    <% } %>
                            
                    var defaultoffice_employee = new Array();
                    <% for (int i=0; i<100; i++) { %>
                        defaultoffice_employee[<%= i %>] = "<%= user_name_employee[i] %>"; 
                    <% } %>
                            
                        
                    var section = document.getElementsByClassName("mymemosection");
                        
                    for (var i=0; i<=defaultmemo_employee.length;i++){
                            if(defaultmemo_employee[i]!="null" && defaultmemo_employee[i]!=undefined){
                                
                                var section_addmemo = document.createElement("section");
                                var delete_button = document.createElement("button");
                                var correction_button = document.createElement("button");
                                var defaultmemosection2 = document.createElement('span');
                                var buttonsection = document.createElement('span');
                                var br = document.createElement('br');
                                var br2 = document.createElement('br');
                                var temporaryarray = [];
                                var default_memo_wrtie = document.createTextNode('\u00a0'+'\u00a0'+'\u00a0'+defaultmemo_employee[i]);
                                var default_memo_year = document.createTextNode("-"+defaultyear_employee[i]+" 년 ");
                                var default_memo_month = document.createTextNode(defaultmonth_employee[i]+'\u00a0');
                                var default_memo_date = document.createTextNode(defaultdate_employee[i]+" 일 ");
                                var default_memo_time = document.createTextNode(defaulttime_employee[i]+" 시 ");
                                var default_memo_minite = document.createTextNode(defaultminite_employee[i]+" 분 ");
                                var default_who_write = document.createTextNode(defaultoffice_employee[i]+" 사원 ");
                                var spacebar = document.createTextNode('\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0'
                                                                        +'\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0'
                                                                        +'\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0'
                                                                        +'\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0');

                                section_addmemo.style.backgroundColor="lightyellow";
                                defaultmemosection2.style.color="red";
                                defaultmemosection2.style.width="500px";
                                section_addmemo.style.marginTop="20px";
                                delete_button.style.marginLeft="420px";
                                delete_button.style.width="80px";
                                delete_button.style.height="22px";
                                delete_button.innerText = "삭제하기";
                                correction_button.style.width="80px";
                                correction_button.style.marginLeft="10px";
                                correction_button.style.height="22px";
                                correction_button.innerText = "수정하기";
                                defaultmemosection2.appendChild(default_memo_wrtie);
                                defaultmemosection2.appendChild(br);
                                defaultmemosection2.appendChild(br2);
                                defaultmemosection2.appendChild(spacebar);
                                defaultmemosection2.appendChild(default_memo_year);
                                defaultmemosection2.appendChild(default_memo_month);
                                defaultmemosection2.appendChild(default_memo_date);
                                defaultmemosection2.appendChild(default_memo_time);
                                defaultmemosection2.appendChild(default_memo_minite);
                                defaultmemosection2.appendChild(default_who_write);
                                
                                section[0].appendChild(section_addmemo);
                                section_addmemo.appendChild(defaultmemosection2);
                                buttonsection.appendChild(delete_button);
                                buttonsection.appendChild(correction_button);
                                section_addmemo.appendChild(buttonsection);
                                
                                
                                temporaryarray.push(section_addmemo);
                                temporaryarray.push(delete_button);
                                temporaryarray.push(correction_button);
                                sectionarray_teamleader.push(temporaryarray);
                                
                                
                        }   
                
            }
        }

        function see_Employee_Memo_Off(){
            var employeebutton = document.getElementById("seeothermemo_officer");
            employeebutton.value="사원 메모 보기";
            for (var i=0; i<sectionarray.length;i++){
                console.log(sectionarray[i]);
                section[0].removeChild(sectionarray[i]);
                }
            sectionarray=[];
        }

        function see_Employee_Memo_OnOff(){
            var employeebutton = document.getElementById("seeothermemo_officer");
            if(isEmployeebuttonclicked==false){
                see_Employee_Memo();
                isEmployeebuttonclicked=true;
            }
            else if(isEmployeebuttonclicked==true){
                see_Employee_Memo_Off();
                isEmployeebuttonclicked=false;
            }
        }
            
        
          
    </script>
</head>
<body class = "body">
    <main class="resistersection">
        <form method="post" name="resister">
            <h1 class = "title">Diary</h1>
            <section class = "mymemosection">
            </section>
            <input type="button" id="addbutton" value="+" onclick="movePage_AddMemo()">
            <input type="button" id="seeothermemo_officer" value="사원 메모 보기" onclick="see_Employee_Memo_OnOff()">
            <input type="button" id="seeothermemo_team" value="팀장 메모 보기" onclick="see_Team_Leader_Memo_OnOff()">
            <input type="button" id="logout" value="로그아웃">      
        </form>
    </main>
</body>