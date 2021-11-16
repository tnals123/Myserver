<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<head>
    <link rel="stylesheet" type="text/css" href="main.css">
    <script>
        function movePage(){
            alert("회원가입이 완료되었습니다");
            document.resister.action="loginpage.jsp";
            document.resister.submit();
        }
        function movePage_AddMemo(){
            document.resister.action="main_addmemo.jsp";
            document.resister.submit();
        }
        // function scrollRotate() {
        //     let image = document.getElementById("addbutton");
        //     image.style.transform = "rotate(" + window.pageYOffset/2 + "deg)";
        // }
        // window.addEventListener('scroll',scrollRotate);
    </script>
</head>
<body class = "body">
    <main class="resistersection">
        <form method="post" name="resister">
            <h1 class = "title">Diary</h1>
            <section class = "memosection">
            </section>
            <input type="button" id="addbutton" value="+" onclick="movePage_AddMemo()">

            <input type="button" id="seeothermemo_officer" value="사원 메모 보기">
            <input type="button" id="seeothermemo_team" value="팀장 메모 보기">
            
            <input type="button" id="logout" value="로그아웃">
            
        </form>
    </main>
</body>