<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>
<html>

<style>
    tbody tr:hover {
        background-color: #ffe8ee;
    }
</style>

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
                    <h2>Notice</h2>
                </header>

                <table class="table">
                    <thead>
                    <tr>
                        <th>no.</th>
                        <th>contents</th>
                        <th>writer</th>
                        <th>date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="notice" items="${notices}">
                        <tr style="cursor:hand;" data-url="notice-view?id=${notice.n_id}&${pagination.queryString}">
                            <td>${notice.n_id}</td>
                            <td>${notice.n_title}</td>
                            <td>${notice.n_writer}</td>
                            <td>${notice.n_date}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <my:pagination pageSize="${pagination.sz}" recordCount="${pagination.recordCount}"/>

            </article>

            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <center>
                    <a href="notice-post">
                        <button type="button" class="button alt">글쓰기</button>
                    </a>
                </center>
            </sec:authorize>

        </div>
    </div>

    <!-- Footer -->
    <c:import url="../../common/footer.jsp"/>

</div>

<!-- Scripts -->
<c:import url="../../common/scripts.jsp"/>

</body>

</html>
