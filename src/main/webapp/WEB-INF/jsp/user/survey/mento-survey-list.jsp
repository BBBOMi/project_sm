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
                    <h2>멘토 설문조사 목록</h2>
                </header>

                <table class="table">
                    <thead>
                    <tr>
                        <th>주제</th>
                        <th>조 이름</th>
                        <th>멘토 이름</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="list" items="${ apply }">
                            <c:if test="${list.check}">
                                <tr style="cursor:hand;" data-url="mento-survey?m_id=${ list.m_id }">
                                    <td>${ list.a_title }</td>
                                    <td>${ list.a_name }</td>
                                    <td>${ list.a_mentoName }</td>
                                </tr>
                            </c:if>
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
