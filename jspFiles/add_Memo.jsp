<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<head>
    <link href="add_Memo.css" rel="stylesheet" type="text/css">
    <script>
        function another(){
            document.addmymemo.action="../cssFiles/Store_Memo.jsp";
            document.addmymemo.submit();
        }
    </script>
</head>

<body class = "body">
    <main class="addmemoscreen">
        <form name="addmymemo" method="post">
            <section class = "addmemo">
                <h1 class = "title">메모를 추가하세요!</h1>
                <p class = "date">
                    <select name="year" class="selectdate">
                    <option value="2021">2021년</option>
                    <option value="2022">2022년</option>
                    <option value="2023">2023년</option>
                    <option value="2024">2024년</option>
                    </select>
                    <select name="month" class="selectdate">
                    <option value="1">1월</option>
                    <option value="2">2월</option>
                    <option value="3">3월</option>
                    <option value="4">4월</option>
                    <option value="5">5월</option>
                    <option value="6">6월</option>
                    <option value="7">7월</option>
                    <option value="8">8월</option>
                    <option value="9">9월</option>
                    <option value="10">10월</option>
                    <option value="11">11월</option>
                    <option value="12">12월</option>
                    </select>
                    <select name="date" class="selectdate">
                        <option value="1">1일</option>
                        <option value="2">2일</option>
                        <option value="3">3일</option>
                        <option value="4">4일</option>
                        <option value="5">5일</option>
                        <option value="6">6일</option>
                        <option value="7">7일</option>
                        <option value="8">8일</option>
                        <option value="9">9일</option>
                        <option value="10">10일</option>
                        <option value="11">11일</option>
                        <option value="12">12일</option>
                        <option value="13">13일</option>
                        <option value="14">14일</option>
                        <option value="15">15일</option>
                        <option value="16">16일</option>
                        <option value="17">17일</option>
                        <option value="18">18일</option>
                        <option value="19">19일</option>
                        <option value="20">20일</option>
                        <option value="21">21일</option>
                        <option value="22">22일</option>
                        <option value="23">23일</option>
                        <option value="24">24일</option>
                        <option value="25">25일</option>
                        <option value="26">26일</option>
                        <option value="27">27일</option>
                        <option value="28">28일</option>
                        <option value="29">29일</option>
                        <option value="30">30일</option>
                        <option value="31">31일</option>
                    </select>
                </p>
                <p class = "date2">
                    <select name="time" class="selectdate">
                        <option value="24">24시</option>
                        <option value="23">23시</option>
                        <option value="22">22시</option>
                        <option value="21">21시</option>
                        <option value="20">20시</option>
                        <option value="19">19시</option>
                        <option value="18">18시</option>
                        <option value="17">17시</option>
                        <option value="16">16시</option>
                        <option value="15">15시</option>
                        <option value="14">14시</option>
                        <option value="13">13시</option>
                        <option value="12">12시</option>
                        <option value="11">11시</option>
                        <option value="10">10시</option>
                        <option value="09">09시</option>
                        <option value="08">08시</option>
                        <option value="07">07시</option>
                        <option value="06">06시</option>
                        <option value="05">05시</option>
                        <option value="04">04시</option>
                        <option value="03">03시</option>
                        <option value="02">02시</option>
                        <option value="01">01시</option>
                    </select>
                    <select name="minite" class="selectdate" id="minite">
                        <option value="00">00분</option>
                        <option value="10">10분</option>
                        <option value="20">20분</option>
                        <option value="30">30분</option>
                        <option value="40">40분</option>
                        <option value="50">50분</option>
                    </select>
                </p>
                <p>
                   <input hidden="hidden" />
                   <input name="mymemo" type="text" placeholder="메모를 추가하세요!" class="writememo"> 
                </p>
                <p class="button">
                    <input type="button" value="메모하기!" id="memobutton" onclick="another()">
                </p>
            </section>
        </form>
    </main>
</body>
