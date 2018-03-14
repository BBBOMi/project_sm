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
                <div>
                    <h2>${notice.n_title}</h2>
                    <br/>
                    <h4>${notice.n_date}</h4>
                    <h4>${notice.n_writer}</h4>
                </div>
                <hr/>
                <div>
                    ${notice.n_contents}
                </div>
                <hr/>
                <div>
                    <c:if test="${notice.n_fileUrl ne null}">
                        <a href="${notice.n_fileUrl}">파일 다운로드</a>
                    </c:if>
                </div>
            </article>

            <center>
                <a href="notice" class="button alt">목록으로</a>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <a href="notice-post?id=${notice.n_id}" class="button alt">수정하기</a>
                    <a href="notice-drop?id=${notice.n_id}" class="button alt">삭제하기</a>
                </sec:authorize>
            </center>

        </div>
    </div>

    <!-- Footer -->
    <c:import url="../../common/footer.jsp"/>

</div>

<!-- Scripts -->
<c:import url="../../common/scripts.jsp"/>

</body>

</html>
