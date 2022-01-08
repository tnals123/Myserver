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
    <script>
        var ischecked=false;
        if (<%=realid%> !=null){
            alert("<%=realid%>");
            location.href="main.jsp";
        }
        function another(){
            ischecked=true;
            document.asdf.action="signup_id.jsp";
            document.asdf.submit();
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
<body>
    <form action="auth.jsp" method="post">
        <span>아이디&nbsp;&nbsp;&nbsp;</span>
        <input type="text" name="id_value">
        <br>
        <span>비밀번호</span>
        <input type="password" name="pw_value">
        <br>
        <input type="submit" value="로그인">
    </form>
    <form name="asdf" method="post">
         
        <br>
        <span>아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <input type="text" name="id_value2">
        <input type="button" name="id_check" value="아이디 확인" onclick="another()">
        <br>
        <span>비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <input type="password" name="pw_value">
        <br>
        <span>비밀번호 확인</span>
        <input type="password" name="pw_check">
        <br>
        <span>이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <input type="text" name="name" class="myin" value="이름">
        <br>
        <span>나이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="text" name="age" class="myin" value="나이">
        <br>
        <span>폰 번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="text" name="phonenumber" class="myin" value="폰 번호">
        <br>
        <span>이메일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="text" name="email" class="myin" value="이메일">
        <br>
        <span>주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="text" name="address" class="myin" value="주소">
        <br>
        <input type="button" value="회원가입" onclick="signup()">
       
    </form>
</body>


</html>