<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<head>
    <link rel="stylesheet" type="text/css" href="resisterpage.css">
    <script>
        function movePage(){
            document.resister.action="signup.jsp";
            document.resister.submit();
        }
    </script>
</head>
<body class = "body">
    <main class="resistersection">
        <form method="post" name="resister">
           
            <h1 class = "title">회원가입</h1>
           
            <p class="idpw_section">
                <input type="text" class="idpw" placeholder="아이디를 입력하세요" name="id_value">
            </p>
            <p class="idpw_section">
                <input type="password" class="idpw" placeholder="비밀번호를 입력하세요" name="pw_value">
            </p>
            <p class="idpw_section">
                <input type="password" class="idpw" placeholder="비밀번호를 확인하세요" name="pw_check">
            </p>
            <p class="idpw_section">
                <input type="text" class="idpw" placeholder="이름을 입력하세요" name="name">
            </p>
            <p class="idpw_section">
                <input type="text" class="idpw" placeholder="연락처를 입력하세요" name="phonenumber">
            </p>
            <p class="checkbox_section">
                <label class="labelsection">사원</label><input type="radio" class="choice" name="office">
                <label class="labelsection">팀장</label><input type="radio" class="choice" name="office">
                <label class="labelsection">사장</label><input type="radio" class="choice" name="office">
            </p>
            <p class="resisterbuttonsection">
                <input type="button" class="resisterbutton" value="회원가입" onclick="movePage()">
            </p>
           
        </form>
    </main>
</body>
