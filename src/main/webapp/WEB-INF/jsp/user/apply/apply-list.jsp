<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE HTML>
<html>

<!-- Head -->
<c:import url="../../common/head.jsp"/>

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
                    <h2>나의 멘토 신청서 목록</h2>
                </header>

                <table class="table">
                    <thead>
                    <tr>
                        <th>no.</th>
                        <th>주제</th>
                        <th>상세 주제</th>
                        <th>조 이름</th>
                        <th>신청 날자</th>
                        <th>확인 상태</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="list" items="${ apply }">
                            <tr style="cursor:hand;" data-url="apply?a_id=${ list.a_id }">
                                <td>${ list.a_id }</td>
                                <td>${ list.a_title }</td>
                                <td>${ list.a_sub }</td>
                                <td>${ list.a_name }</td>
                                <td>${ list.a_date }</td>
                                <td>
                                <c:choose>
                                    <c:when test="${list.a_type == 0}">
                                        미확인
                                    </c:when>
                                    <c:when test="${list.a_type == 1}">
                                        승인
                                    </c:when>
                                    <c:when test="${list.a_type == 2}">
                                        반려
                                    </c:when>
                                </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <center>
                    <button type="submit" class="btn btn-light" onClick="location.href='apply'">신청서 작성</button>
                </center>
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
