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
                <a href="#" class="image featured"><img src="../../../res/images/mentoring.jpg" alt=""/></a>
                <header>
                    <h2>SM System Introduce</h2>
                </header>
                <c:forEach var="intro" items="${intro}">
                    <p>
                        <h3>${intro.i_title}</h3>
                        <br>
                        ${intro.i_contents}
                    </p>
                </c:forEach>
            </article>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <center>
                    <a href="intro-change" class="button">수정하기</a>
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
