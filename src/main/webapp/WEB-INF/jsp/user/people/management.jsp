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

    tbody td:nth-child(2) {
        cursor: pointer;
    }

    tbody td:nth-child(3) {
        cursor: pointer;
    }

    tbody td:nth-child(4) {
        cursor: pointer;
    }

    tbody td:nth-child(5) {
        cursor: pointer;
    }
</style>

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
            <center>
                <form class="form-inline my-2 my-lg-0" name="search" method="post"
                      action="all-search">
                    <input class="form-control mr-sm-6" type="text" name="keyword"
                           placeholder="이름입력" aria-label="Search"/>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
                    </br>
                </form>
            </center>
            </br>

            <article class="box post">
                <header>
                    <h2>회원 관리</h2>
                    <p>회원 명단 입니다.</p>
                </header>

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
                        <tr style="cursor: hand;" data-url="mypage?id=${user.ID}">
                            <td>${user.u_id}</td>
                            <td>${user.u_name}</td>
                            <td>${user.d_name}</td>
                            <td><c:choose>
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
                            </c:choose></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

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
