<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
Cookie[] cookies = request.getCookies();
Cookie realid=null;
Cookie myid_check=null;
if (cookies != null){
    for (Cookie c : cookies){
        if (c.getName().equals("id")){
            realid=c;
        if (c.getName().equals("idcheck")){
            myid_check=c;
        }
        }
    }
}
%>

<head>
    <link rel="stylesheet" type="text/css" href="loginpage.css">
    <script>
        var ischecked=false;
        // if (<%=realid%> !=null){
        //     alert("<%=realid%>");
        //     location.href="main.jsp";
        // }
        function another(){
            ischecked=true;
            document.gotoresister.action="resister.jsp";
            document.gotoresister.submit();
        }
        function goToMain(){
            document.gotoresister.action="auth.jsp";
            document.gotoresister.submit();

        }
        function signup(){
            var pwname=document.getElementsByName("pw_value");
            var pwname2=document.getElementsByName("pw_check");
            var name=document.getElementsByName("name");
            var age=document.getElementsByName("age");
            var phonenumber=document.getElementsByName("phonenumber");
            var email=document.getElementsByName("email");
            var address=document.getElementsByName("address");
            var info=document.getElementsByClassName("myin");
            
            for (var i=0;i<=info.length;i++){
                if(info[i].innerHTML==""){
                    alert(info[i].value+"의 값을 입력해 주십시오");
                    location.href="index.jsp";
                }
            }
            if("<%=myid_check%>"==null){
                alert("아이디 검사를 하지 않으셨습니다");
                location.href="index.jsp";
            }

            if(pwname[1].value!=pwname2[0].value){
                alert("비밀번호가 다릅니다.");
                location.href="index.jsp";
            }
            if(name[0].length!=2){
                alert("이름은 영어로 2자 여야 합니다.");
                location.href="index.jsp";
            }
            if(age[0].length<=10 || age[0].length>=100){
                alert("나이는 11살 이상 100살 이하만 가능합니다.")
                location.href="index.jsp";
            }
            else {
                document.asdf.action="signup.jsp";
                document.asdf.submit();
            }
            
            
            
        }
        
    </script>
</head>
<body class="body">
    <header>
        <p class = "font">
            Diary
        </p>
    </header>

    <main class= "login">
        <section class="loginsection">
            <form action="auth.jsp" method="post" class="loginsection_2" name="gotoresister">
                <h1 class="logintext">로그인</h1>
                <p class="idpw_section">
                    <input type="text" class="idpw" placeholder="아이디를 입력하세요" name="id_value">
                </p>
                <p class="idpw_section">
                    <input type="password" class="idpw" placeholder="비밀번호를 입력하세요" name="pw_value">
                </p>
                <p class="checkbox_section">
                    <label class="checkbox">로그인 유지</label><input type="checkbox" checked>
                </p>
                <p class="buttonsection">
                    <input type="button" class="clickbutton" value="로그인" onclick="goToMain()">
                    <input type="button" class="clickbutton" value="회원가입" onclick="another()">
                </p>
            </form>
        </section>
    </main>

</body>


</html>