<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE HTML>
<html>

<!-- Head -->
<c:import url="../../common/head.jsp"/>

<style>
    tbody tr:hover {
        background-color: #ffe8ee;
    }

    tbody tr:nth-child(1) {
        cursor: pointer;
    }

    tbody tr:nth-child(2) {
        cursor: pointer;
    }

    tbody tr:nth-child(3) {
        cursor: pointer;
    }

    tbody tr:nth-child(4) {
        cursor: pointer;
    }

    tbody tr:nth-child(5) {
        cursor: pointer;
    }
</style>

<script>
    function submit01_click() {
        alert('업로드 성공');
    }
</script>

<body class="no-sidebar">
<div id="page-wrapper">

    <!-- Header -->
    <div id="header-wrapper">
        <div id="header">

            <!-- Menu -->
            <c:import url="../../common/menu.jsp"/>

        </div>
    </div>

    <!-- Main -->
    <div id="main-wrapper">
        <div class="container">

            <!-- Content -->
            <article class="box post">
                <header>
                    <h2>회원 명단 업로드</h2>
                    <br/>
                </header>

                <section>
                    <header>
                        <h3>유의 사항</h3>
                    </header>
                    <p>1) 엑셀 파일만 가능합니다.<br/>
                        2) 학번/교번의 경우 꼭 문자열 타입이어야 합니다.<br>
                        3) 지정된 양식을 꼭 지켜주시기 바랍니다.<br>
                        4) 업로드 버튼을 누르시면 즉시 데이터 베이스에 반영됩니다. 신중하게 진행해 주세요.<br>
                        5) 이미 존재하는 사용자의 경우 반영되지 않습니다.
                    </p>
                    파일 양식 : <a href="https://s3.ap-northeast-2.amazonaws.com/project-sm/%ED%9A%8C%EC%9B%90%EB%AA%85%EB%8B%A8%EC%96%91%EC%8B%9D.xlsx"}>회원 명단 양식.xlsx</a>
                </section>

                <table class="table">
                    <thead>
                    <tr>
                        <th>학번(교번)</th>
                        <th>이름</th>
                        <th>소속 학과</th>
                        <th>구분</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr style="cursor:hand;" data-url="mypage?id=${user.ID}">
                            <td>${user.u_id}</td>
                            <td>${user.u_name}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${user.d_id1 == 0}">
                                        소속 없음
                                    </c:when>
                                    <c:when test="${user.d_id1 == 1}">
                                        신학과
                                    </c:when>
                                    <c:when test="${user.d_id1 == 2}">
                                        영어학과
                                    </c:when>
                                    <c:when test="${user.d_id1 == 3}">
                                        일어일본학과
                                    </c:when>
                                    <c:when test="${user.d_id1 == 4}">
                                        중어중국학과
                                    </c:when>
                                    <c:when test="${user.d_id1 == 5}">
                                        사회복지학과
                                    </c:when>
                                    <c:when test="${user.d_id1 == 6}">
                                        사회과학부
                                    </c:when>
                                    <c:when test="${user.d_id1 == 7}">
                                        신문방송학과
                                    </c:when>
                                    <c:when test="${user.d_id1 == 8}">
                                        경영학부
                                    </c:when>
                                    <c:when test="${user.d_id1 == 9}">
                                        디지털컨텐츠공학과
                                    </c:when>
                                    <c:when test="${user.d_id1 == 10}">
                                        컴퓨터공학과
                                    </c:when>
                                    <c:when test="${user.d_id1 == 11}">
                                        소프트웨어공학과
                                    </c:when>
                                    <c:when test="${user.d_id1 == 12}">
                                        정보통신공학과
                                    </c:when>
                                    <c:when test="${user.d_id1 == 13}">
                                        글로컬IT학과
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${user.u_type == 0}">
                                        일반 사용자
                                    </c:when>
                                    <c:when test="${user.u_type == 1}">
                                        학생
                                    </c:when>
                                    <c:when test="${user.u_type == 2}">
                                        교수
                                    </c:when>
                                    <c:when test="${user.u_type == 3}">
                                        직원
                                    </c:when>
                                    <c:when test="${user.u_type == 4}">
                                        관리자
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <form method="post" enctype="multipart/form-data" action="/upload">
                    <input type="file" name="file" style="width:600px; margin: 10px;" multiple /> <br />
                    <center>
                        <button type="submit" class="button">회원 업로드</button>
                    </center>
                </form>
            </article>

        </div>
    </div>

    <!-- Footer -->
    <c:import url="../../common/footer.jsp"/>


</div>

<!-- Scripts -->
<c:import url="../../common/scripts.jsp"/>

</body>

</html>
