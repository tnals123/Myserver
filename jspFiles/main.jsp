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

    String get_usermemo="SELECT * FROM officers_memo WHERE num=? ORDER BY memo_year,month,date,time";
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

    String get_usermemo_teamleader="SELECT * FROM officers_memo WHERE officers_classes=? ORDER BY memo_year,month,date,time";
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

    String get_usermemo_employee="SELECT * FROM officers_memo WHERE officers_classes=? ORDER BY memo_year,month,date,time";
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
    <link rel="stylesheet" type="text/css" href="../cssFiles/main2.css">
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

            console.log("???");
            

            for (var i=0; i<=defaultmemo.length;i++){
                if(defaultmemo[i]!="null" && defaultmemo[i]!=undefined){

                    var form = document.createElement("form");
                    form.setAttribute("charset", "UTF-8");
                    form.setAttribute("method", "Post"); 
                    form.setAttribute("action","DeleteMemo.jsp");

                    var form_correction = document.createElement("form");
                    form_correction.setAttribute("charset", "UTF-8");
                    form_correction.setAttribute("method", "Post"); 
                    form_correction.setAttribute("action","CorrectMemo.jsp");
                    form_correction.style.display = "none";

                    var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("type", "hidden");
                    hiddenField.setAttribute("name", "mName");
                    hiddenField.setAttribute("value", defaultmemo[i]);
                    form.appendChild(hiddenField);

                    var hiddenField_correction = document.createElement("input");
                    hiddenField_correction.setAttribute("type", "hidden");
                    hiddenField_correction.setAttribute("name", "mName");
                    var hiddenField_correction_2 = document.createElement("input");
                    hiddenField_correction_2.setAttribute("type", "hidden");
                    hiddenField_correction_2.setAttribute("name", "originmemo");
                    form_correction.appendChild(hiddenField_correction);
                    form_correction.appendChild(hiddenField_correction_2);
                    
                    var section_addmemo = document.createElement("section");
                    var delete_button = document.createElement("button");
                    var correction_button = document.createElement("button");
                    var defaultmemosection2 = document.createElement('span');
                    var defaultmemosection3 = document.createElement('div');
                    var buttonsection = document.createElement('div');
                    var input = document.createElement("input");
                    input.setAttribute("type", "hidden");
                    input.value = defaultmemo[i];
                    var temporary = [];

                    var default_memo_wrtie = document.createTextNode(defaultmemo[i]);
                    var default_memo_year = document.createTextNode("-"+defaultyear[i]+" ??? ");
                    var default_memo_month = document.createTextNode(defaultmonth[i] + " ??? ");
                    var default_memo_date = document.createTextNode(defaultdate[i]+" ??? ");
                    var default_memo_time = document.createTextNode(defaulttime[i]+" ??? ");
                    var default_memo_minite = document.createTextNode(defaultminite[i]+" ??? ");
                    
                    delete_button.type="button";
                    correction_button.type="button";
                    input.style.zIndex = "100";
                    input.style.position = "absolute";
                    input.style.left = "0px"
                    section_addmemo.style.backgroundColor = "lightyellow";
                    section_addmemo.style.height = "90px";
                    defaultmemosection2.style.width="300px";
                    defaultmemosection2.style.position="relative";
                    defaultmemosection2.style.left="10px";
                    defaultmemosection3.style.top = "25px";
                    defaultmemosection3.style.position = "relative";
                    defaultmemosection3.style.width = "100%";
                    defaultmemosection3.style.float = "right";
                    buttonsection.style.position = "relative";
                    buttonsection.style.width = "100%";
                    buttonsection.style.top = "25px";
                    section_addmemo.style.marginTop="20px";
                    delete_button.style.width="80px";
                    delete_button.style.height="22px";
                    delete_button.style.float="right";
                    delete_button.innerHTML = "????????????";
                    correction_button.style.width="80px";
                    correction_button.style.marginLeft="10px";
                    correction_button.style.height="22px";
                    correction_button.style.float="right";
                    correction_button.innerText = "????????????";
                    form.style.width = "100%";
                    section_addmemo.style.width = "100%";

                    defaultmemosection2.appendChild(default_memo_wrtie);
                    defaultmemosection2.appendChild(input);
                    defaultmemosection3.appendChild(default_memo_year);
                    defaultmemosection3.appendChild(default_memo_month);
                    defaultmemosection3.appendChild(default_memo_date);
                    defaultmemosection3.appendChild(default_memo_time);
                    defaultmemosection3.appendChild(default_memo_minite);

                    section[0].appendChild(form);
                    section_addmemo.appendChild(defaultmemosection2);
                    section_addmemo.appendChild(defaultmemosection3);
                    buttonsection.appendChild(delete_button);
                    buttonsection.appendChild(correction_button);
                    section_addmemo.appendChild(buttonsection); 
                    form.appendChild(section_addmemo);
                    form.appendChild(form_correction);

                    temporary.push(i);
                    temporary.push(delete_button);
                    temporary.push(correction_button);
                    temporary.push(form); 
                    temporary.push(form_correction);
                    
                    defaultsectionarray.push(temporary);
                    defaultsectionarray[i][1].onclick = function(){
                        if (this.innerHTML == "????????????"){
                            this.parentElement.parentElement.parentElement.submit();
                            section[0].removeChild(this.parentElement.parentElement);
                        }
                    }

                    defaultsectionarray[i][2].onclick = function(){
                        if(this.innerHTML == "????????????"){
                            this.innerHTML = "????????????";
                            this.parentElement.childNodes[0].innerHTML = "????????????";
                            this.parentElement.parentElement.childNodes[0].childNodes[1].setAttribute("type","visible");  
                            this.parentElement.childNodes[0].onclick = function(){
                                this.parentElement.parentElement.parentElement.childNodes[2].childNodes[1].setAttribute("value",this.parentElement.parentElement.parentElement.childNodes[0].value);
                                this.parentElement.parentElement.parentElement.childNodes[2].childNodes[0].setAttribute("value",this.parentElement.parentElement.childNodes[0].childNodes[1].value);
                                this.parentElement.parentElement.parentElement.childNodes[2].submit();
                            }
                        }
                        else if (this.innerHTML == "????????????"){
                            this.innerHTML = "????????????";
                            this.parentElement.childNodes[0].innerHTML = "????????????";
                            this.parentElement.parentElement.childNodes[0].childNodes[1].setAttribute("type","hidden"); 
                        }
                    }          
                }
            } 
        }

        function logOut(){
            document.resister.action="logout.jsp";
            document.resister.submit();     
        }
        function movePage_AddMemo(){
            document.resister.action="main_addmemo.jsp";
            document.resister.submit();
        }
        function see_Team_Leader_Memo(){
            var teamleaderbutton = document.getElementById("seeothermemo_team");
            teamleaderbutton.value="?????? ??????";

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

                                var form = document.createElement("form");
                                form.setAttribute("charset", "UTF-8");
                                form.setAttribute("method", "Post"); 
                                form.setAttribute("action","DeleteMemo.jsp");

                                var hiddenField = document.createElement("input");
                                hiddenField.setAttribute("type", "hidden");
                                hiddenField.setAttribute("name", "mName");
                                hiddenField.setAttribute("value", defaultmemo_teamleader[i]);
                                form.appendChild(hiddenField);

                                var form_correction = document.createElement("form");
                                form_correction.setAttribute("charset", "UTF-8");
                                form_correction.setAttribute("method", "Post"); 
                                form_correction.setAttribute("action","CorrectMemo.jsp");
                                form_correction.style.display = "none";

                                var hiddenField_correction = document.createElement("input");
                                hiddenField_correction.setAttribute("type", "hidden");
                                hiddenField_correction.setAttribute("name", "mName");
                                var hiddenField_correction_2 = document.createElement("input");
                                hiddenField_correction_2.setAttribute("type", "hidden");
                                hiddenField_correction_2.setAttribute("name", "originmemo");
                                form_correction.appendChild(hiddenField_correction);
                                form_correction.appendChild(hiddenField_correction_2);

                                var section_addmemo = document.createElement("section");
                                var delete_button = document.createElement("button");
                                delete_button.setAttribute("name",i);
                                var correction_button = document.createElement("button");
                                correction_button.setAttribute("name",i);
                                var defaultmemosection2 = document.createElement('span');
                                var defaultmemosection3 = document.createElement('div');
                                var buttonsection = document.createElement('div');
                                var input = document.createElement("input");
                                input.setAttribute("type", "hidden");
                                input.value = defaultmemo_teamleader[i];

                                var default_memo_wrtie = document.createTextNode(defaultmemo_teamleader[i]);
                                var default_memo_year = document.createTextNode("-"+defaultyear_teamleader[i]+" ??? ");
                                var default_memo_month = document.createTextNode(defaultmonth_teamleader[i]+" ??? ");
                                var default_memo_date = document.createTextNode(defaultdate_teamleader[i]+" ??? ");
                                var default_memo_time = document.createTextNode(defaulttime_teamleader[i]+" ??? ");
                                var default_memo_minite = document.createTextNode(defaultminite_teamleader[i]+" ??? ");
                                var default_who_write = document.createTextNode(defaultoffice_teamleader[i]+" ?????? ");
                                
                                delete_button.type="button";
                                correction_button.type="button";
                                input.style.zIndex = "100";
                                input.style.position = "absolute";
                                input.style.left = "0px"
                                section_addmemo.style.backgroundColor = "lightyellow";
                                section_addmemo.style.height = "90px";
                                defaultmemosection2.style.color = "red";
                                defaultmemosection2.style.width="300px";
                                defaultmemosection2.style.position="relative";
                                defaultmemosection2.style.left="10px";
                                defaultmemosection3.style.top = "25px";
                                defaultmemosection3.style.left = "270px";
                                defaultmemosection3.style.position = "relative";
                                defaultmemosection3.style.color = "red";
                                buttonsection.style.position = "relative";
                                buttonsection.style.top = "25px";
                                buttonsection.style.left = "65%";
                                section_addmemo.style.marginTop="20px";
                                delete_button.style.width="80px";
                                delete_button.style.height="22px";
                                delete_button.innerText = "????????????";
                                correction_button.style.width="80px";
                                correction_button.style.marginLeft="10px";
                                correction_button.style.height="22px";
                                correction_button.innerText = "????????????";  
                                
                                var temporary = [];
                       
                                defaultmemosection2.appendChild(default_memo_wrtie);
                                defaultmemosection2.appendChild(input);
                                defaultmemosection3.appendChild(default_memo_year);
                                defaultmemosection3.appendChild(default_memo_month);
                                defaultmemosection3.appendChild(default_memo_date);
                                defaultmemosection3.appendChild(default_memo_time);
                                defaultmemosection3.appendChild(default_memo_minite);
                                defaultmemosection3.appendChild(default_who_write);
                                 
                                section_addmemo.appendChild(defaultmemosection2);
                                section_addmemo.appendChild(defaultmemosection3);
                                buttonsection.appendChild(delete_button);
                                buttonsection.appendChild(correction_button);
                                section_addmemo.appendChild(buttonsection); 

                                form.appendChild(section_addmemo);
                                form.appendChild(form_correction);
                                section[0].appendChild(form);

                                temporary.push(delete_button);
                                temporary.push(correction_button);
                                temporary.push(form);
                                sectionarray_teamleader.push(temporary);

                                sectionarray_teamleader[i][0].onclick = function(){
                                    if (this.innerHTML == "????????????"){
                                        this.parentElement.parentElement.parentElement.submit();
                                        section[0].removeChild(this.parentElement.parentElement);
                                    }
                                }

                                sectionarray_teamleader[i][1].onclick = function(){
                                    if(this.innerHTML == "????????????"){
                                        this.innerHTML = "????????????";
                                        this.parentElement.childNodes[0].innerHTML = "????????????";
                                        this.parentElement.parentElement.childNodes[0].childNodes[1].setAttribute("type","visible");  
                                        this.parentElement.childNodes[0].onclick = function(){
                                            this.parentElement.parentElement.parentElement.childNodes[2].childNodes[1].setAttribute("value",this.parentElement.parentElement.parentElement.childNodes[0].value);
                                            this.parentElement.parentElement.parentElement.childNodes[2].childNodes[0].setAttribute("value",this.parentElement.parentElement.childNodes[0].childNodes[1].value);
                                            this.parentElement.parentElement.parentElement.childNodes[2].submit();
                                        }
                                    }
                                    else if (this.innerHTML == "????????????"){
                                        this.innerHTML = "????????????";
                                        this.parentElement.childNodes[0].innerHTML = "????????????";
                                        this.parentElement.parentElement.childNodes[0].childNodes[1].setAttribute("type","hidden"); 
                                    }
                    } 
                }
            }
        }

        function see_Team_Leader_Memo_Off(){
            var teamleaderbutton = document.getElementById("seeothermemo_team");
            teamleaderbutton.value="?????? ?????? ??????";
            for (var i=0; i<sectionarray_teamleader.length;i++){
                console.log(sectionarray_teamleader[i]);
                section[0].removeChild(sectionarray_teamleader[i][2]);
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
                    employeebutton.value = "?????? ??????";
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

                                var form = document.createElement("form");
                                form.setAttribute("charset", "UTF-8");
                                form.setAttribute("method", "Post"); 
                                form.setAttribute("action","DeleteMemo.jsp");

                                var hiddenField = document.createElement("input");
                                hiddenField.setAttribute("type", "hidden");
                                hiddenField.setAttribute("name", "mName");
                                hiddenField.setAttribute("value", defaultmemo_employee[i]);
                                form.appendChild(hiddenField);

                                var form_correction = document.createElement("form");
                                form_correction.setAttribute("charset", "UTF-8");
                                form_correction.setAttribute("method", "Post"); 
                                form_correction.setAttribute("action","CorrectMemo.jsp");
                                form_correction.style.display = "none";

                                var hiddenField_correction = document.createElement("input");
                                hiddenField_correction.setAttribute("type", "hidden");
                                hiddenField_correction.setAttribute("name", "mName");
                                var hiddenField_correction_2 = document.createElement("input");
                                hiddenField_correction_2.setAttribute("type", "hidden");
                                hiddenField_correction_2.setAttribute("name", "originmemo");
                                form_correction.appendChild(hiddenField_correction);
                                form_correction.appendChild(hiddenField_correction_2);

                                var section_addmemo = document.createElement("section");
                                var delete_button = document.createElement("button");
                                delete_button.setAttribute("name",i);
                                var correction_button = document.createElement("button");
                                correction_button.setAttribute("name",i);
                                var defaultmemosection2 = document.createElement('span');
                                var defaultmemosection3 = document.createElement('div');
                                var buttonsection = document.createElement('div');
                                var input = document.createElement("input");
                                input.setAttribute("type", "hidden");

                                input.value = defaultmemo_employee[i];

                                var default_memo_wrtie = document.createTextNode(defaultmemo_employee[i]);
                                var default_memo_year = document.createTextNode("-"+defaultyear_employee[i]+" ??? ");
                                var default_memo_month = document.createTextNode(defaultmonth_employee[i] + " ??? ");
                                var default_memo_date = document.createTextNode(defaultdate_employee[i]+" ??? ");
                                var default_memo_time = document.createTextNode(defaulttime_employee[i]+" ??? ");
                                var default_memo_minite = document.createTextNode(defaultminite_employee[i]+" ??? ");
                                var default_who_write = document.createTextNode(defaultoffice_employee[i]+" ?????? ");
                       
                                delete_button.type="button";
                                correction_button.type="button";
                                input.style.zIndex = "100";
                                input.style.position = "absolute";
                                input.style.left = "0px"
                                section_addmemo.style.backgroundColor = "lightyellow";
                                section_addmemo.style.height = "90px";
                                defaultmemosection2.style.color = "red";
                                defaultmemosection2.style.width="300px";
                                defaultmemosection2.style.position="relative";
                                defaultmemosection2.style.left="10px";
                                defaultmemosection3.style.top = "25px";
                                defaultmemosection3.style.left = "270px";
                                defaultmemosection3.style.position = "relative";
                                defaultmemosection3.style.color = "red";
                                buttonsection.style.position = "relative";
                                buttonsection.style.top = "25px";
                                buttonsection.style.left = "65%";
                                section_addmemo.style.marginTop="20px";
                                delete_button.style.width="80px";
                                delete_button.style.height="22px";
                                delete_button.innerHTML = "????????????";
                                correction_button.style.width="80px";
                                correction_button.style.marginLeft="10px";
                                correction_button.style.height="22px";
                                correction_button.innerText = "????????????";
                                var temporary = [];

                                defaultmemosection2.appendChild(default_memo_wrtie);
                                defaultmemosection2.appendChild(input);
                                defaultmemosection3.appendChild(default_memo_year);
                                defaultmemosection3.appendChild(default_memo_month);
                                defaultmemosection3.appendChild(default_memo_date);
                                defaultmemosection3.appendChild(default_memo_time);
                                defaultmemosection3.appendChild(default_memo_minite);
                                defaultmemosection3.appendChild(default_who_write);
                                
                                section_addmemo.appendChild(defaultmemosection2);
                                section_addmemo.appendChild(defaultmemosection3);
                                buttonsection.appendChild(delete_button);
                                buttonsection.appendChild(correction_button);
                                section_addmemo.appendChild(buttonsection); 

                                form.appendChild(section_addmemo);
                                form.appendChild(form_correction);
                                section[0].appendChild(form);

                                temporary.push(delete_button);
                                temporary.push(correction_button);
                                temporary.push(form);
                                sectionarray.push(temporary);

                                sectionarray[i][0].onclick = function(){
                                    if (this.innerHTML == "????????????"){
                                        this.parentElement.parentElement.parentElement.submit();
                                        section[0].removeChild(this.parentElement.parentElement);
                                    }
                                }

                                sectionarray[i][1].onclick = function(){
                                    if(this.innerHTML == "????????????"){
                                        this.innerHTML = "????????????";
                                        this.parentElement.childNodes[0].innerHTML = "????????????";
                                        this.parentElement.parentElement.childNodes[0].childNodes[1].setAttribute("type","visible");  
                                        this.parentElement.childNodes[0].onclick = function(){
                                            this.parentElement.parentElement.parentElement.childNodes[2].childNodes[1].setAttribute("value",this.parentElement.parentElement.parentElement.childNodes[0].value);
                                            this.parentElement.parentElement.parentElement.childNodes[2].childNodes[0].setAttribute("value",this.parentElement.parentElement.childNodes[0].childNodes[1].value);
                                            this.parentElement.parentElement.parentElement.childNodes[2].submit();
                                        }
                                    }
                                    else if (this.innerHTML == "????????????"){
                                        this.innerHTML = "????????????";
                                        this.parentElement.childNodes[0].innerHTML = "????????????";
                                        this.parentElement.parentElement.childNodes[0].childNodes[1].setAttribute("type","hidden"); 
                                        }
                                    }
                }   
                
            }
        }

        function see_Employee_Memo_Off(){
            var employeebutton = document.getElementById("seeothermemo_officer");
            employeebutton.value="?????? ?????? ??????";
            for (var i=0; i<sectionarray.length;i++){
                section[0].removeChild(sectionarray[i][2]);
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
        <form method="post" name="resister" id = "myform">
            <h1 class = "title">Diary</h1>
            <section class = "mymemosection">
            </section>
            <input type="button" id="addbutton" value="+" onclick="movePage_AddMemo()">
            <input type="button" id="seeothermemo_officer" value="?????? ?????? ??????" onclick="see_Employee_Memo_OnOff()">
            <input type="button" id="seeothermemo_team" value="?????? ?????? ??????" onclick="see_Team_Leader_Memo_OnOff()">
            <input type="button" id="logout" value="????????????" onclick="logOut()">      
        </form>
    </main>
</body>